Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5802656B
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 16:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C58898EE;
	Wed, 22 May 2019 14:12:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC5A8967B
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 00:04:42 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o11so124135pgm.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 17:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+HMpjJbOByDkcgcmqTFcjwM/Zjfkc20s8NGwt76Mr8=;
 b=j4WuGAiB78NENHpKiG9zayDHhFXbSof9DBg8B2HBr/kmmcPN9GqmrJtEvfpILt2UDv
 g/t38CUs9Jgy6qf4aWZAgF0ez61a/ZE9j2aoeIhfvjQHG5ZJfxM3bKay51Z1C0a4UhI1
 gBwytN7NjJS5YT3IJHliu7dvbmFTEITJde41VDA/EcG8Tyjsn/wMDyxqRVbAm16CZubk
 ZUF9S3/RCfqTQhQ4yYxoQKMLy5rpnEXUDkPpo0g8qIsbPyg1gtI3CcyW/zvnrGbwkHCj
 /kmG+3+TEcQQLPtx8xyLJJIEVOyroZOIqN2wZT1GKZqzR6F9Yjeonom6W9hLCleZGiZS
 rqWw==
X-Gm-Message-State: APjAAAVk66dADQoh8z37HX5rT1gDFm79pGJyHoLjdQque9tUqD3ZYeu8
 tiA7V0TCB2x0Lc37Mf1eG9xyeg==
X-Google-Smtp-Source: APXvYqyRHlp4k1ARvHRDx6pnXWJEks1ZEDsNIbDRibBeuJSxc6NZrbRUP3gWhA9hXypH8RUrMs25NQ==
X-Received: by 2002:a63:8dc8:: with SMTP id z191mr87505404pgd.9.1558483482349; 
 Tue, 21 May 2019 17:04:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a11sm15675685pff.128.2019.05.21.17.04.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 17:04:40 -0700 (PDT)
Date: Tue, 21 May 2019 17:04:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <201905211633.6C0BF0C2@keescook>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521182932.sm4vxweuwo5ermyd@mbp>
X-Mailman-Approved-At: Wed, 22 May 2019 14:12:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h+HMpjJbOByDkcgcmqTFcjwM/Zjfkc20s8NGwt76Mr8=;
 b=Zf9QLE33qmPluiR2OGF4dL2quucaUAVgN4YPizfJiTzAzfLxxGI5FlE9xizVc831A4
 PZROfhtKhT/R7pMFQlHGrknlILzZeG3LHD5gyBNKzIo1iuXRcoC6OuM/wsNOYEBlL6Lp
 KGXm5hniO64celTxThJARG41BLIiM0pmyycsI=
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
 Kevin Brodsky <kevin.brodsky@arm.com>,
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

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDc6Mjk6MzNQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgTWF5IDIwLCAyMDE5IGF0IDA0OjUzOjA3UE0gLTA3MDAsIEV2Z2Vu
aWkgU3RlcGFub3Ygd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCA3OjQ5IEFNIENh
dGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gPiBJTU8g
KFJGQyBmb3Igbm93KSwgSSBzZWUgdHdvIHdheXMgZm9yd2FyZDoKPiA+ID4gWy4uLl0KPiA+ID4g
Mi4gU2ltaWxhciBzaGltIHRvIHRoZSBhYm92ZSBsaWJjIHdyYXBwZXIgYnV0IGluc2lkZSB0aGUg
a2VybmVsCj4gPiA+ICAgIChhcmNoL2FybTY0IG9ubHk7IG1vc3QgcG9pbnRlciBhcmd1bWVudHMg
Y291bGQgYmUgY292ZXJlZCB3aXRoIGFuCj4gPiA+ICAgIF9fU0NfQ0FTVCBzaW1pbGFyIHRvIHRo
ZSBzMzkwIG9uZSkuIFRoZXJlIGFyZSB0d28gZGlmZmVyZW5jZXMgZnJvbQo+ID4gPiAgICB3aGF0
IHdlJ3ZlIGRpc2N1c3NlZCBpbiB0aGUgcGFzdDoKPiA+ID4KPiA+ID4gICAgYSkgdGhpcyBpcyBh
biBvcHQtaW4gYnkgdGhlIHVzZXIgd2hpY2ggd291bGQgaGF2ZSB0byBleHBsaWNpdGx5IGNhbGwK
PiA+ID4gICAgICAgcHJjdGwoKS4gSWYgaXQgcmV0dXJucyAtRU5PVFNVUFAgZXRjLiwgdGhlIHVz
ZXIgd29uJ3QgYmUgYWxsb3dlZAo+ID4gPiAgICAgICB0byBwYXNzIHRhZ2dlZCBwb2ludGVycyB0
byB0aGUga2VybmVsLiBUaGlzIHdvdWxkIHByb2JhYmx5IGJlIHRoZQo+ID4gPiAgICAgICByZXNw
b25zaWJpbGl0eSBvZiB0aGUgQyBsaWIgdG8gbWFrZSBzdXJlIGl0IGRvZXNuJ3QgdGFnIGhlYXAK
PiA+ID4gICAgICAgYWxsb2NhdGlvbnMuIElmIHRoZSB1c2VyIGRpZCBub3Qgb3B0LWluLCB0aGUg
c3lzY2FsbHMgYXJlIHJvdXRlZAo+ID4gPiAgICAgICB0aHJvdWdoIHRoZSBub3JtYWwgcGF0aCAo
bm8gdW50YWdnaW5nIGFkZHJlc3Mgc2hpbSkuCj4gPiA+Cj4gPiA+ICAgIGIpIGlvY3RsKCkgYW5k
IG90aGVyIGJsYWNrbGlzdGVkIHN5c2NhbGxzIChwcmN0bCkgd2lsbCBub3QgYWNjZXB0Cj4gPiA+
ICAgICAgIHRhZ2dlZCBwb2ludGVycyAodG8gYmUgZG9jdW1lbnRlZCBpbiBWaWNlbnpvJ3MgQUJJ
IHBhdGNoZXMpLgo+ID4KPiA+IFRoZSB3YXkgSSBzZWUgaXQsIGEgcGF0Y2ggdGhhdCBicmVha3Mg
aGFuZGxpbmcgb2YgdGFnZ2VkIHBvaW50ZXJzIGlzCj4gPiBub3QgdGhhdCBkaWZmZXJlbnQgZnJv
bSwgc2F5LCBhIHBhdGNoIHRoYXQgYWRkcyBhIHdpbGQgcG9pbnRlcgo+ID4gZGVyZWZlcmVuY2Uu
IEJvdGggYXJlIGJ1Z3M7IHRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgKGEpIHRoZSBmb3JtZXIKPiA+
IGJyZWFrcyBhIHJlbGF0aXZlbHkgdW5jb21tb24gdGFyZ2V0IGFuZCAoYikgaXQncyBhcmd1YWJs
eSBhbiBlYXNpZXIKPiA+IG1pc3Rha2UgdG8gbWFrZS4gSWYgTVRFIGFkb3B0aW9uIGdvZXMgd2Vs
bCwgKGEpIHdpbGwgbm90IGJlIHRoZSBjYXNlCj4gPiBmb3IgbG9uZy4KPiAKPiBJdCdzIGFsc28g
dGhlIGZhY3Qgc3VjaCBwYXRjaCB3b3VsZCBnbyB1bm5vdGljZWQgZm9yIGEgbG9uZyB0aW1lIHVu
dGlsCj4gc29tZW9uZSBleGVyY2lzZXMgdGhhdCBjb2RlIHBhdGguIEFuZCB3aGVuIHRoZXkgZG8s
IHRoZSB1c2VyIHdvdWxkIGJlCj4gcHJldHR5IG11Y2ggaW4gdGhlIGRhcmsgdHJ5aW5nIHRvIGZp
Z3VyZSB3aGF0IHdoYXQgd2VudCB3cm9uZywgd2h5IGEKPiBTSUdTRUdWIG9yIC1FRkFVTFQgaGFw
cGVuZWQuIFdoYXQncyB3b3JzZSwgd2UgY2FuJ3QgZXZlbiBzYXkgd2UgZml4ZWQKPiBhbGwgdGhl
IHBsYWNlcyB3aGVyZSBpdCBtYXR0ZXJzIGluIHRoZSBjdXJyZW50IGtlcm5lbCBjb2RlYmFzZSAo
aWdub3JpbmcKPiBmdXR1cmUgcGF0Y2hlcykuCgpTbywgbG9va2luZyBmb3J3YXJkIGEgYml0LCB0
aGlzIGlzbid0IGdvaW5nIHRvIGJlIGFuIEFSTS1zcGVjaWZpYyBpc3N1ZQpmb3IgbG9uZy4gSW4g
ZmFjdCwgSSB0aGluayB3ZSBzaG91bGRuJ3QgaGF2ZSBhcm0tc3BlY2lmaWMgc3lzY2FsbCB3cmFw
cGVycwppbiB0aGlzIHNlcmllczogSSB0aGluayB1bnRhZ2dlZF9hZGRyKCkgc2hvdWxkIGxpa2Vs
eSBiZSBhZGRlZCBhdCB0aGUKdG9wLWxldmVsIGFuZCBoYXZlIGl0IGJlIGEgbm8tb3AgZm9yIG90
aGVyIGFyY2hpdGVjdHVyZXMuIFNvIGdpdmVuIHRoaXMKYmVjb21pbmcgYSBrZXJuZWwtd2lkZSBt
dWx0aS1hcmNoaXRlY3R1cmUgaXNzdWUgKHVuZGVyIHRoZSBhc3N1bXB0aW9uCnRoYXQgeDg2LCBS
SVNDLVYsIGFuZCBvdGhlcnMgd2lsbCBnYWluIHNpbWlsYXIgVEJJIG9yIE1URSB0aGluZ3MpLAp3
ZSBzaG91bGQgc29sdmUgaXQgaW4gYSB3YXkgdGhhdCB3ZSBjYW4gcmUtdXNlLgoKV2UgbmVlZCBz
b21ldGhpbmcgdGhhdCBpcyBnb2luZyB0byB3b3JrIGV2ZXJ5d2hlcmUuIEFuZCBpdCBuZWVkcyB0
byBiZQpzdXBwb3J0ZWQgYnkgdGhlIGtlcm5lbCBmb3IgdGhlIHNpbXBsZSByZWFzb24gdGhhdCB0
aGUga2VybmVsIG5lZWRzIHRvCmRvIE1URSBjaGVja3MgZHVyaW5nIGNvcHlfZnJvbV91c2VyKCk6
IGhhdmluZyB0aGF0IGluZm9ybWF0aW9uIHN0cmlwcGVkCm1lYW5zIHdlIGxvc2UgYW55IHVzZXJz
cGFjZS1hc3NpZ25lZCBNVEUgcHJvdGVjdGlvbnMgaWYgdGhleSBnZXQgaGFuZGxlZApieSB0aGUg
a2VybmVsLCB3aGljaCBpcyBhIHRvdGFsIG5vbi1zdGFydGVyLCBJTU8uCgpBcyBhbiBhc2lkZTog
SSB0aGluayBTcGFyYyBBREkgc3VwcG9ydCBpbiBMaW51eCBhY3R1YWxseSBzaWRlLXN0ZXBwZWQK
dGhpc1sxXSAoaS5lLiBjaG9zZSAic29sdXRpb24gMSIpOiAiQWxsIGFkZHJlc3NlcyBwYXNzZWQg
dG8ga2VybmVsIG11c3QKYmUgbm9uLUFESSB0YWdnZWQgYWRkcmVzc2VzLiIgKEFuZCBzYWRseSwg
Iktlcm5lbCBkb2VzIG5vdCBlbmFibGUgQURJCmZvciBrZXJuZWwgY29kZS4iKSBJIHRoaW5rIHRo
aXMgd2FzIGEgbWlzdGFrZSB3ZSBzaG91bGQgbm90IHJlcGVhdCBmb3IKYXJtNjQgKHdlIGRvIHNl
ZW0gdG8gYmUgYXQgbGVhc3QgaW4gYWdyZWVtZW50IGFib3V0IHRoaXMsIEkgdGhpbmspLgoKWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC82NTQ0ODEvCgo+ID4gVGhp
cyBpcyBhIGJpdCBvZiBhIGNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtLiBJbiBhIHdvcmxkIHdoZXJl
IG1lbW9yeQo+ID4gYWxsb2NhdG9ycyBvbiBvbmUgb3Igc2V2ZXJhbCBwb3B1bGFyIHBsYXRmb3Jt
cyBnZW5lcmF0ZSBwb2ludGVycyB3aXRoCj4gPiBub24temVybyB0YWdzLCBhbnkgc3VjaCBicmVh
a2FnZSB3aWxsIGJlIGNhdWdodCBpbiB0ZXN0aW5nLgo+ID4gVW5mb3J0dW5hdGVseSB0byByZWFj
aCB0aGF0IHN0YXRlIHdlIG5lZWQgdGhlIGtlcm5lbCB0byBzdGFydAo+ID4gYWNjZXB0aW5nIHRh
Z2dlZCBwb2ludGVycyBmaXJzdCwgYW5kIHRoZW4gaG9sZCBvbiBmb3IgYSBjb3VwbGUgb2YKPiA+
IHllYXJzIHVudGlsIHVzZXJzcGFjZSBjYXRjaGVzIHVwLgo+IAo+IFdvdWxkIHRoZSBrZXJuZWwg
YWxzbyBjYXRjaCB1cCB3aXRoIHByb3ZpZGluZyBhIHN0YWJsZSBBQkk/IEJlY2F1c2Ugd2UKPiBo
YXZlIHR3byBtb3ZpbmcgdGFyZ2V0cy4KPiAKPiBPbiBvbmUgaGFuZCwgeW91IGhhdmUgQW5kcm9p
ZCBvciBzb21lIExpbnV4IGRpc3RybyB0aGF0IHN0aWNrIHRvIGEKPiBzdGFibGUga2VybmVsIHZl
cnNpb24gZm9yIHNvbWUgdGltZSwgc28gdGhleSBoYXZlIGJldHRlciBjaGFuY2Ugb2YKPiBjbGVh
cmluZyBtb3N0IG9mIHRoZSBwcm9ibGVtcy4gT24gdGhlIG90aGVyIGhhbmQsIHdlIGhhdmUgbWFp
bmxpbmUKPiBrZXJuZWwgdGhhdCBnZXRzIG92ZXIgNTAwSyBsaW5lcyBldmVyeSByZWxlYXNlLiBB
cyBtYWludGFpbmVyLCBJIGNhbid0Cj4gcmVseSBvbiBteSB0ZXN0aW5nIGFsb25lIGFzIHRoaXMg
aXMgb24gYSBsaW1pdGVkIG51bWJlciBvZiBwbGF0Zm9ybXMuIFNvCj4gbXkgY29uY2VybiBpcyB0
aGF0IGV2ZXJ5IGtlcm5lbCByZWxlYXNlIGhhcyBhIHNpZ25pZmljYW50IGNoYW5jZSBvZgo+IGJy
ZWFraW5nIHRoZSBBQkksIHVubGVzcyB3ZSBoYXZlIGEgYmV0dGVyIHdheSBvZiBpZGVudGlmeWlu
ZyBwb3RlbnRpYWwKPiBpc3N1ZXMuCgpJIGp1c3Qgd2FudCB0byBtYWtlIHN1cmUgSSBmdWxseSB1
bmRlcnN0YW5kIHlvdXIgY29uY2VybiBhYm91dCB0aGlzCmJlaW5nIGFuIEFCSSBicmVhaywgYW5k
IEkgd29yayBiZXN0IHdpdGggZXhhbXBsZXMuIFRoZSBjbG9zZXN0IHNpdHVhdGlvbgpJIGNhbiBz
ZWUgd291bGQgYmU6CgotIHNvbWUgcHJvZ3JhbSBoYXMgbm8gaWRlYSBhYm91dCBNVEUKLSBtYWxs
b2MoKSBzdGFydHMgcmV0dXJuaW5nIE1URS10YWdnZWQgYWRkcmVzc2VzCi0gcHJvZ3JhbSBkb2Vz
bid0IGJyZWFrIGZyb20gdGhhdCBjaGFuZ2UKLSBwcm9ncmFtIHVzZXMgc29tZSBzeXNjYWxsIHRo
YXQgaXMgbWlzc2luZyB1bnRhZ2dlZF9hZGRyKCkgYW5kIGZhaWxzCi0ga2VybmVsIGhhcyBub3cg
YnJva2VuIHVzZXJzcGFjZSB0aGF0IHVzZWQgdG8gd29yawoKVGhlIHRyb3VibGUgSSBzZWUgd2l0
aCB0aGlzIGlzIHRoYXQgaXQgaXMgbGFyZ2VseSB0aGVvcmV0aWNhbCBhbmQKcmVxdWlyZXMgcGFy
dCBvZiB1c2Vyc3BhY2UgdG8gY29sbHVkZSB0byBzdGFydCB1c2luZyBhIG5ldyBDUFUgZmVhdHVy
ZQp0aGF0IHRpY2tsZXMgYSBidWcgaW4gdGhlIGtlcm5lbC4gQXMgSSB1bmRlcnN0YW5kIHRoZSBn
b2xkZW4gcnVsZSwKdGhpcyBpcyBhIGJ1ZyBpbiB0aGUga2VybmVsIChhIG1pc3NlZCBpb2N0bCgp
IG9yIHN1Y2gpIHRvIGJlIGZpeGVkLApub3QgYSBnbG9iYWwgYnJlYWtpbmcgb2Ygc29tZSB1c2Vy
c3BhY2UgYmVoYXZpb3IuCgpJIGZlZWwgbGlrZSBJJ20gbWlzc2luZyBzb21ldGhpbmcgYWJvdXQg
dGhpcyBiZWluZyBzZWVuIGFzIGFuIEFCSQpicmVhay4gVGhlIGtlcm5lbCBhbHJlYWR5IGZhaWxz
IG9uIHVzZXJzcGFjZSBhZGRyZXNzZXMgdGhhdCBoYXZlIGhpZ2gKYml0cyBzZXQgLS0gYXJlIHRo
ZXJlIHRoaW5ncyB0aGF0IF9kZXBlbmRfIG9uIHRoaXMgZmFpbHVyZSB0byBvcGVyYXRlPwoKLS0g
CktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
