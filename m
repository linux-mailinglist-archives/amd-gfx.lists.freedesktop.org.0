Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291F273B7
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 03:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228E89C61;
	Thu, 23 May 2019 01:02:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4332089C9B
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 23:09:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e13so3620970ljl.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 16:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zo0ta7cFHgMRhNj415CGcWxBRhsPIdMQaFfQkNGZDyg=;
 b=Y6nlX5f/l5ytsW38/qAlpOAKmAHbCEWSj9/Q6xYfP4Y9enAOGRtobhJStTeL3ptNJ3
 xhNiEaC98kZbZB4VD5yjK9l9pvwWhyDgi9Bso//F8v/gWRo13c+/JV6SW6reRpIRaw3g
 vrWczxpR3HpeuCZ9brRdDgz1LzM15tVH0qDyI97WUx6RAYG2NN4fzv770o83aJEu3uV8
 AkfmMZdDjtRPP25gPVpRNE00gyvRr1xHs8H2Gg/dJD8y/Z7tKl56oUCR0l9F9tbsGLrT
 bWleEp6uiQ9sRlj9JM2gh8+bTgqPwAiLRDa4drY1I4SKOYO7WZ0UVh2rnqayL3Es7ame
 eoCg==
X-Gm-Message-State: APjAAAXRUSK7qls7mq8EmgYNOxYRvsPHDvSO72aWhP1P9DaHtGEnrw4s
 X0Q78DiLikEm/fney4xxkEQfBByc7pop9Su2vfogLg==
X-Google-Smtp-Source: APXvYqyzdpKdhtViUHlA5ZulCPuE1mR7dT316mPXUNWFyB1kZFy9VtMEAzPhqeN7WBqyKU4f463JOkqzDuNZUlPEoK8=
X-Received: by 2002:a2e:885a:: with SMTP id z26mr2119940ljj.35.1558566583161; 
 Wed, 22 May 2019 16:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp> <201905221316.865581CF@keescook>
 <CAFKCwrjOjdJAbcABp3qxwyYy+hgfyQirvmqGkDSJVJe5pSz0Uw@mail.gmail.com>
In-Reply-To: <CAFKCwrjOjdJAbcABp3qxwyYy+hgfyQirvmqGkDSJVJe5pSz0Uw@mail.gmail.com>
From: enh <enh@google.com>
Date: Wed, 22 May 2019 16:09:31 -0700
Message-ID: <CAJgzZorUPzrXu0ysDdKwnqdvgWZJ9tqRjF-9_5CU_UV+c0bRCA@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Evgenii Stepanov <eugenis@google.com>
X-Mailman-Approved-At: Thu, 23 May 2019 01:02:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Zo0ta7cFHgMRhNj415CGcWxBRhsPIdMQaFfQkNGZDyg=;
 b=igi2ZowCRR3eZ9/0nTV8cXZJb9K3GEJ6nM7xrdpCgyuIedU5DlpD8BYtYq2g7fhIK6
 FMPk+pIR3l66HCoBcqnR8RLDUlNVKBoDdSOOKbybJMa8cIyuAzuBD0XVwoayLR91TP1S
 Or9Vm+AM1MqvKUg9+c3gOd7GP47AnzQE07FfPqL0gIQFQsaz6/Wtl6TltaTcvzbkWmzx
 nUHyczH55lHnf4QLfD7YMKsWm2P4/KbXTCsRnYy/LgXeL0UQ2MOisKGH9I79sJSp7fTc
 mCIju+QQoBZwdM0ZHmLkXpay4k0e/6JiSlhqZI0PrF8znz18Mpt9AP9bfE2L3yEv2l8R
 69MQ==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgNDowMyBQTSBFdmdlbmlpIFN0ZXBhbm92IDxldWdlbmlz
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTo0NyBQTSBL
ZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBN
YXkgMjIsIDIwMTkgYXQgMDU6MzU6MjdQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+
ID4gPiBUaGUgdHdvIGhhcmQgcmVxdWlyZW1lbnRzIEkgaGF2ZSBmb3Igc3VwcG9ydGluZyBhbnkg
bmV3IGhhcmR3YXJlIGZlYXR1cmUKPiA+ID4gaW4gTGludXggYXJlICgxKSBhIHNpbmdsZSBrZXJu
ZWwgaW1hZ2UgYmluYXJ5IGNvbnRpbnVlcyB0byBydW4gb24gb2xkCj4gPiA+IGhhcmR3YXJlIHdo
aWxlIG1ha2luZyB1c2Ugb2YgdGhlIG5ldyBmZWF0dXJlIGlmIGF2YWlsYWJsZSBhbmQgKDIpIG9s
ZAo+ID4gPiB1c2VyIHNwYWNlIGNvbnRpbnVlcyB0byBydW4gb24gbmV3IGhhcmR3YXJlIHdoaWxl
IG5ldyB1c2VyIHNwYWNlIGNhbgo+ID4gPiB0YWtlIGFkdmFudGFnZSBvZiB0aGUgbmV3IGZlYXR1
cmUuCj4gPgo+ID4gQWdyZWVkISBBbmQgSSB0aGluayB0aGUgc2VyaWVzIG1lZXRzIHRoZXNlIHJl
cXVpcmVtZW50cywgeWVzPwo+ID4KPiA+ID4gRm9yIE1URSwgd2UganVzdCBjYW4ndCBlbmFibGUg
aXQgYnkgZGVmYXVsdCBzaW5jZSB0aGVyZSBhcmUgYXBwbGljYXRpb25zCj4gPiA+IHdobyB1c2Ug
dGhlIHRvcCBieXRlIG9mIGEgcG9pbnRlciBhbmQgZXhwZWN0IGl0IHRvIGJlIGlnbm9yZWQgcmF0
aGVyCj4gPiA+IHRoYW4gZmFpbGluZyB3aXRoIGEgbWlzbWF0Y2hlZCB0YWcuIEp1c3QgdGhpbmsg
b2YgYSBod2FzYW4gY29tcGlsZWQKPiA+ID4gYmluYXJ5IHdoZXJlIFRCSSBpcyBleHBlY3RlZCB0
byB3b3JrIGFuZCB5b3UgdHJ5IHRvIHJ1biBpdCB3aXRoIE1URQo+ID4gPiB0dXJuZWQgb24uCj4g
Pgo+ID4gQWghIE9rYXksIGhlcmUncyB0aGUgdXNlLWNhc2UgSSB3YXNuJ3QgdGhpbmtpbmcgb2Y6
IHRoZSBjb25jZXJuIGlzIFRCSQo+ID4gY29uZmxpY3Rpbmcgd2l0aCBNVEUuIEFuZCBhbnl0aGlu
ZyB0aGF0IHN0YXJ0cyB1c2luZyBUQkkgc3VkZGVubHkgY2FuJ3QKPiA+IHJ1biBpbiB0aGUgZnV0
dXJlIGJlY2F1c2UgaXQncyBiZWluZyBpbnRlcnByZXRlZCBhcyBNVEUgYml0cz8gKElzIHRoYXQK
PiA+IHRoZSBBQkkgY29uY2Vybj8gSSBmZWVsIGxpa2Ugd2UgZ290IGludG8gdGhlIHdlZWRzIGFi
b3V0IGlvY3RsKClzIGFuZAo+ID4gb25lLW9mZiBidWdzLi4uKQo+ID4KPiA+IFNvIHRoZXJlIG5l
ZWRzIHRvIGJlIHNvbWUgd2F5IHRvIGxldCB0aGUga2VybmVsIGtub3cgd2hpY2ggb2YgdGhyZWUK
PiA+IHRoaW5ncyBpdCBzaG91bGQgYmUgZG9pbmc6Cj4gPiAxLSBsZWF2aW5nIHVzZXJzcGFjZSBh
ZGRyZXNzZXMgYXMtaXMgKHByZXNlbnQpCj4gPiAyLSB3aXBpbmcgdGhlIHRvcCBiaXRzIGJlZm9y
ZSB1c2luZyAodGhpcyBzZXJpZXMpCj4gPiAzLSB3aXBpbmcgdGhlIHRvcCBiaXRzIGZvciBtb3N0
IHRoaW5ncywgYnV0IHJldGFpbmluZyB0aGVtIGZvciBNVEUgYXMKPiA+ICAgIG5lZWRlZCAodGhl
IGZ1dHVyZSkKPiA+Cj4gPiBJIGV4cGVjdCBNVEUgdG8gYmUgdGhlICJkZWZhdWx0IiBpbiB0aGUg
ZnV0dXJlLiBPbmNlIGEgc3lzdGVtJ3MgbGliYyBoYXMKPiA+IGdyb3duIHN1cHBvcnQgZm9yIGl0
LCBldmVyeXRoaW5nIHdpbGwgYmUgdHJ5aW5nIHRvIHVzZSBNVEUuIFRCSSB3aWxsIGJlCj4gPiB0
aGUgc3BlY2lhbCBjYXNlIChidXQgVEJJIGlzIGVmZmVjdGl2ZWx5IGEgcHJlcmVxdWlzaXRlKS4K
PiA+Cj4gPiBBRkFJQ1QsIHRoZSBvbmx5IGRpZmZlcmVuY2UgSSBzZWUgYmV0d2VlbiAyIGFuZCAz
IHdpbGwgYmUgdGhlIHRhZyBoYW5kbGluZwo+ID4gaW4gdXNlcmNvcHkgKGFsbCBvdGhlciBwbGFj
ZXMgd2lsbCBjb250aW51ZSB0byBpZ25vcmUgdGhlIHRvcCBiaXRzKS4gSXMKPiA+IHRoYXQgYWNj
dXJhdGU/Cj4gPgo+ID4gSXMgIjEiIGEgcGVyLXByb2Nlc3Mgc3RhdGUgd2Ugd2FudCB0byBrZWVw
PyAoSSBhc3N1bWUgbm90LCBidXQgcmF0aGVyIGl0Cj4gPiBpcyBhdmFpbGFibGUgdmlhIG5vIFRC
SS9NVEUgQ09ORklHIG9yIGEgYm9vdC10aW1lIG9wdGlvbiwgaWYgYXQgYWxsPykKPiA+Cj4gPiBU
byBjaG9vc2UgYmV0d2VlbiAiMiIgYW5kICIzIiwgaXQgc2VlbXMgd2UgbmVlZCBhIHBlci1wcm9j
ZXNzIGZsYWcgdG8KPiA+IG9wdCBpbnRvIFRCSSAoYW5kIG91dCBvZiBNVEUpLiBGb3IgdXNlcnNw
YWNlLCBob3cgd291bGQgYSBmdXR1cmUgYmluYXJ5Cj4gPiBjaG9vc2UgVEJJIG92ZXIgTVRFPyBJ
ZiBpdCdzIGEgbGlicmFyeSBpc3N1ZSwgd2UgY2FuJ3QgdXNlIGFuIEVMRiBiaXQsCj4gPiBzaW5j
ZSB0aGUgY2hvaWNlIG1heSBiZSAibGF0ZSIgYWZ0ZXIgRUxGIGxvYWQgKHRoaXMgaW1wbGllcyB0
aGUgbmVlZAo+ID4gZm9yIGEgcHJjdGwoKS4pIElmIGl0J3MgYmluYXJ5LW9ubHkgKCJidWlsdCB3
aXRoIEhXS0FTYW4iKSB0aGVuIGFuIEVMRgo+ID4gYml0IHNlZW1zIHN1ZmZpY2llbnQuIEFuZCB3
aXRob3V0IHRoZSBtYXJraW5nLCBJJ2QgZXhwZWN0IHRoZSBrZXJuZWwgdG8KPiA+IGVuZm9yY2Ug
TVRFIHdoZW4gdGhlcmUgYXJlIGhpZ2ggYml0cy4KPiA+Cj4gPiA+IEkgd291bGQgYWxzbyBleHBl
Y3QgdGhlIEMgbGlicmFyeSBvciBkeW5hbWljIGxvYWRlciB0byBjaGVjayBmb3IgdGhlCj4gPiA+
IHByZXNlbmNlIG9mIGEgSFdDQVBfTVRFIGJpdCBiZWZvcmUgc3RhcnRpbmcgdG8gdGFnIG1lbW9y
eSBhbGxvY2F0aW9ucywKPiA+ID4gb3RoZXJ3aXNlIGl0IHdvdWxkIGdldCBTSUdJTEwgb24gdGhl
IGZpcnN0IE1URSBpbnN0cnVjdGlvbiBpdCB0cmllcyB0bwo+ID4gPiBleGVjdXRlLgo+ID4KPiA+
IEkndmUgZ290IHRoZSBzYW1lIHF1ZXN0aW9uIGFzIEVsbGlvdDogYXJlbid0IE1URSBpbnN0cnVj
dGlvbnMganVzdCBOT1AKPiA+IHRvIG9sZGVyIENQVXM/IEkuZS4gaWYgdGhlIENQVSAob3Iga2Vy
bmVsKSBkb24ndCBzdXBwb3J0IGl0LCBpdCBqdXN0Cj4gPiBnZXRzIGVudGlyZWx5IGlnbm9yZWQ6
IGNoZWNraW5nIGlzIG9ubHkgbmVlZGVkIHRvIHNhdGlzZnkgY3VyaW9zaXR5Cj4gPiBvciBiZWhh
dmlvcmFsIGV4cGVjdGF0aW9ucy4KPgo+IE1URSBpbnN0cnVjdGlvbnMgYXJlIG5vdCBOT1AuIE1v
c3Qgb2YgdGhlbSBoYXZlIHNpZGUgZWZmZWN0cyAoY2hhbmdpbmcKPiByZWdpc3RlciB2YWx1ZXMs
IHplcm9pbmcgbWVtb3J5KS4KCm5vLCBpIG1lYW50ICJ0aGV5J3JlIGVuY29kZWQgaW4gYSBzcGFj
ZSB0aGF0IHdhcyBwcmV2aW91c2x5IG5vLW9wcywgc28KcnVubmluZyBvbiBNVEUgY29kZSBvbiBv
bGQgaGFyZHdhcmUgZG9lc24ndCBjYXVzZSBTSUdJTEwiLgoKPiBUaGlzIG9ubHkgbWF0dGVycyBm
b3Igc3RhY2sgdGFnZ2luZywgdGhvdWdoLiBIZWFwIHRhZ2dpbmcgaXMgYSBydW50aW1lCj4gZGVj
aXNpb24gaW4gdGhlIGFsbG9jYXRvci4KPgo+IElmIGFuIGltYWdlIG5lZWRzIHRvIHJ1biBvbiBv
bGQgaGFyZHdhcmUsIGl0IHdpbGwgaGF2ZSB0byBkbyBoZWFwIHRhZ2dpbmcgb25seS4KPgo+ID4g
VG8gbWUsIHRoZSBjb25mbGljdCBzZWVtcyB0byBiZSB1c2luZyBUQkkgaW4gdGhlIGZhY2Ugb2Yg
ZXhwZWN0aW5nIE1URSB0bwo+ID4gYmUgdGhlIGRlZmF1bHQgc3RhdGUgb2YgdGhlIGZ1dHVyZS4g
KEJ1dCB0aGUgaW50ZXJuYWwgY2hhbmdlcyBuZWVkZWQKPiA+IGZvciBUQkkgLS0gdGhpcyBzZXJp
ZXMgLS0gaXMgYSBwcmVyZXEgZm9yIE1URS4pCj4gPgo+ID4gLS0KPiA+IEtlZXMgQ29vawpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
