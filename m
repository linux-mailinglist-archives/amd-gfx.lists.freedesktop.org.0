Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A18526A
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 19:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33496E74C;
	Wed,  7 Aug 2019 17:53:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB24B6E6DE
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 17:17:47 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b3so41807955plr.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 10:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eJrnZxNMCItWIynTatJDEuA9CjWuilxGr3zPMXDYoA=;
 b=HycD/H0bySBa1FUvCmov7+cliVnb1b5Dh0zBlQZl0OwO2GMEzEY9ASE0rpclYqshov
 ohKHdOEXpZPTJ9y4cqUQDkQcrZ1CLe+lo76Bbq4USx28B2E5o8tkKEPCA2orZvfiZnEc
 vg6QIwaCwbrGTm6Fk1be1fHVC43NZeTmkTvePSmRkVEPzJP73MmlHUKoHCVr13Hr6Uxg
 yvRPTaWpJqTk57P02fAmeOPMgDoctWeba4TEhrBdIrIbfP+Q88Gdp82rc7CbxpncClBV
 c08ennrLWvN40bWwH4wC0Hi4pX4s9HeMv+CsUiCjL1ocawUFsrF6GHKwYsf3s8AIoP4q
 h5zg==
X-Gm-Message-State: APjAAAXWT/B5pHLwzdRN2XVZt1We99i6CM5g9vR7tCPhE+0GljpiJWxb
 JQzlcraBC9NzMa/jhTXMqLFMr3cK3juNuDLJaYSChQ==
X-Google-Smtp-Source: APXvYqyBW2S319ERBiJQIcPzcGoHmCZb6zerpXN+gU6uALMoVMzBI9LSMd7krnp9xpHZv3cXEfAdJC0fzaJdRwq+DTM=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr8596413pgq.130.1565198266795; 
 Wed, 07 Aug 2019 10:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
In-Reply-To: <20190806171335.4dzjex5asoertaob@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 7 Aug 2019 19:17:35 +0200
Message-ID: <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Approved-At: Wed, 07 Aug 2019 17:53:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8eJrnZxNMCItWIynTatJDEuA9CjWuilxGr3zPMXDYoA=;
 b=lvCOFn8kPw5sKWIBqAtj9nTDw5hreHjOLB8fZD9LK4XqWLqI/y9ZOZsE/4TR27f4Um
 7sNjnMM7si41kfySDx/t9SNrRsRpe9RSjuTSsxtP/LZWsBQ/9wQ/cD4jAY9Afx15eKqx
 drzyP65XIEr5B54raR+/HRbXQh7LyawRCf3zPKIRTqPoYkdFiyNYDBtM/quaMKyDYY7N
 e0hyz+AA4niyiPyNwzehq1Nhy/KS415dSI2CnjbBlju4Nld2LwgPUsvJDvfBXebX8Wbi
 Nmslq3Y7cfQOcqEViWBEfcEzC2SDosb0kffCvwGdMnZ05+LE89QNyyYCkt8oyQaFasdF
 n/vQ==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjEzIFBNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDM6MjA6NTlQTSArMDEwMCwg
V2lsbCBEZWFjb24gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwNDoxNjo0OVBN
ICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAyNCwgMjAx
OSBhdCA0OjAyIFBNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+
IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDA4OjAzOjI5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFs
b3Ygd3JvdGU6Cj4gPiA+ID4gPiBTaG91bGQgdGhpcyBnbyB0aHJvdWdoIHRoZSBtbSBvciB0aGUg
YXJtIHRyZWU/Cj4gPiA+ID4KPiA+ID4gPiBJIHdvdWxkIGNlcnRhaW5seSBwcmVmZXIgdG8gdGFr
ZSBhdCBsZWFzdCB0aGUgYXJtNjQgYml0cyB2aWEgdGhlIGFybTY0IHRyZWUKPiA+ID4gPiAoaS5l
LiBwYXRjaGVzIDEsIDIgYW5kIDE1KS4gV2UgYWxzbyBuZWVkIGEgRG9jdW1lbnRhdGlvbiBwYXRj
aCBkZXNjcmliaW5nCj4gPiA+ID4gdGhlIG5ldyBBQkkuCj4gPiA+Cj4gPiA+IFNvdW5kcyBnb29k
ISBTaG91bGQgSSBwb3N0IHRob3NlIHBhdGNoZXMgdG9nZXRoZXIgd2l0aCB0aGUKPiA+ID4gRG9j
dW1lbnRhdGlvbiBwYXRjaGVzIGZyb20gVmluY2Vuem8gYXMgYSBzZXBhcmF0ZSBwYXRjaHNldD8K
PiA+Cj4gPiBZZXMsIHBsZWFzZSAoYWx0aG91Z2ggYXMgeW91IHNheSBiZWxvdywgd2UgbmVlZCBh
IG5ldyB2ZXJzaW9uIG9mIHRob3NlCj4gPiBwYXRjaGVzIGZyb20gVmluY2Vuem8gdG8gYWRkcmVz
cyB0aGUgZmVlZGJhY2sgb24gdjUpLiBUaGUgb3RoZXIgdGhpbmcgSQo+ID4gc2hvdWxkIHNheSBp
cyB0aGF0IEknZCBiZSBoYXBweSB0byBxdWV1ZSB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2Vy
aWVzCj4gPiB0b28sIGJ1dCBzb21lIG9mIHRoZW0gYXJlIG1pc3NpbmcgYWNrcyBmcm9tIHRoZSBy
ZWxldmFudCBtYWludGFpbmVycyAoZS5nLgo+ID4gdGhlIG1tLyBhbmQgZnMvIGNoYW5nZXMpLgo+
Cj4gT2ssIEkndmUgcXVldWVkIHBhdGNoZXMgMSwgMiwgYW5kIDE1IG9uIGEgc3RhYmxlIGJyYW5j
aCBoZXJlOgo+Cj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9hcm02NC9saW51eC5naXQvbG9nLz9oPWZvci1uZXh0L3RiaQo+Cj4gd2hpY2ggc2hvdWxk
IGZpbmQgaXRzIHdheSBpbnRvIC1uZXh0IHNob3J0bHkgdmlhIG91ciBmb3ItbmV4dC9jb3JlIGJy
YW5jaC4KPiBJZiB5b3Ugd2FudCB0byBtYWtlIGNoYW5nZXMsIHBsZWFzZSBzZW5kIGFkZGl0aW9u
YWwgcGF0Y2hlcyBvbiB0b3AuCj4KPiBUaGlzIGlzIHRhcmdldHRpbmcgNS40LCBidXQgSSB3aWxs
IGRyb3AgaXQgYmVmb3JlIHRoZSBtZXJnZSB3aW5kb3cgaWYKPiB3ZSBkb24ndCBoYXZlIGJvdGgg
b2YgdGhlIGZvbGxvd2luZyBpbiBwbGFjZToKPgo+ICAgKiBVcGRhdGVkIEFCSSBkb2N1bWVudGF0
aW9uIHdpdGggQWNrcyBmcm9tIENhdGFsaW4gYW5kIEtldmluCgpDYXRhbGluIGhhcyBwb3N0ZWQg
YSBuZXcgdmVyc2lvbiB0b2RheS4KCj4gICAqIFRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJp
ZXMgZWl0aGVyIEFja2VkIChzbyBJIGNhbiBwaWNrIHRoZW0gdXApCj4gICAgIG9yIHF1ZXVlZCB2
aWEgc29tZSBvdGhlciB0cmVlKHMpIGZvciA1LjQuCgpTbyB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcg
cGF0Y2hlcyBpbiB0aGlzIHNlcmllczoKCjEuIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJzIGlu
IGFjY2Vzc19vayBhbmQgX191YWNjZXNzX21hc2tfcHRyCjIuIGFybTY0OiBJbnRyb2R1Y2UgcHJj
dGwoKSBvcHRpb25zIHRvIGNvbnRyb2wgdGhlIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBBQkkKMy4g
bGliOiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIHN0cm4qX3VzZXIKNC4gbW06IHVudGFnIHVzZXIg
cG9pbnRlcnMgcGFzc2VkIHRvIG1lbW9yeSBzeXNjYWxscwo1LiBtbTogdW50YWcgdXNlciBwb2lu
dGVycyBpbiBtbS9ndXAuYwo2LiBtbTogdW50YWcgdXNlciBwb2ludGVycyBpbiBnZXRfdmFkZHJf
ZnJhbWVzCjcuIGZzL25hbWVzcGFjZTogdW50YWcgdXNlciBwb2ludGVycyBpbiBjb3B5X21vdW50
X29wdGlvbnMKOC4gdXNlcmZhdWx0ZmQ6IHVudGFnIHVzZXIgcG9pbnRlcnMKOS4gZHJtL2FtZGdw
dTogdW50YWcgdXNlciBwb2ludGVycwoxMC4gZHJtL3JhZGVvbjogdW50YWcgdXNlciBwb2ludGVy
cyBpbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwKMTEuIElCL21seDQ6IHVudGFnIHVzZXIgcG9p
bnRlcnMgaW4gbWx4NF9nZXRfdW1lbV9tcgoxMi4gbWVkaWEvdjRsMi1jb3JlOiB1bnRhZyB1c2Vy
IHBvaW50ZXJzIGluIHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQKMTMuIHRlZS9zaG06IHVu
dGFnIHVzZXIgcG9pbnRlcnMgaW4gdGVlX3NobV9yZWdpc3RlcgoxNC4gdmZpby90eXBlMTogdW50
YWcgdXNlciBwb2ludGVycyBpbiB2YWRkcl9nZXRfcGZuCjE1LiBzZWxmdGVzdHMsIGFybTY0OiBh
ZGQgYSBzZWxmdGVzdCBmb3IgcGFzc2luZyB0YWdnZWQgcG9pbnRlcnMgdG8ga2VybmVsCgoxLCAy
IGFuZCAxNSBoYXZlIGJlZW4gcGlja2VkIGJ5IFdpbGwuCgoxMSBoYXMgYmVlbiBwaWNrZWQgdXAg
YnkgSmFzb24uCgo5LCAxMCwgMTIsIDEzIGFuZCAxNCBoYXZlIGFja3MgZnJvbSB0aGVpciBzdWJz
eXN0ZW0gbWFpbnRhaW5lcnMuCgozIHRvdWNoZXMgZ2VuZXJpYyBsaWIgY29kZSwgSSdtIG5vdCBz
dXJlIGlmIHRoZXJlJ3MgYSBkZWRpY2F0ZWQKbWFpbnRhaW5lciBmb3IgdGhhdC4KClRoZSBvbmVz
IHRoYXQgYXJlIGxlZnQgYXJlIHRoZSBtbSBvbmVzOiA0LCA1LCA2LCA3IGFuZCA4LgoKQW5kcmV3
LCBjb3VsZCB5b3UgdGFrZSBhIGxvb2sgYW5kIGdpdmUgeW91ciBBY2tlZC1ieSBvciBwaWNrIHRo
ZW0gdXAgZGlyZWN0bHk/Cgo+Cj4gTWFrZSBzZW5zZT8KPgo+IENoZWVycywKPgo+IFdpbGwKClRo
YW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
