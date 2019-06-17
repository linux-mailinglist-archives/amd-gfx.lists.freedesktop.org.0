Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C549A57
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3E66E0FF;
	Tue, 18 Jun 2019 07:20:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90F9892DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 16:57:49 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id j26so6550440vsn.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 09:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=retltkRYeaxJ6adF3YGzOCqdGSJ+TnMcYlKByHm/5DU=;
 b=NOcAlhx/e9Sbx2QKjPGjPvEoHO46O5hMlXYZYpMPHwZg/lHLMmi6VBeMi0Glz8qKcn
 HPWARdcZLz8YB3rTOwvhESiQK6DUfx1v1eK6a1yU9SsrylSUx1gEJZxQ/2cALKWk7mP4
 K4kctpr19y7cMoyZBWt0JaEif64Kyw7lIl6SXuxCkyRl0XsxD9ZXJfZPUnbS3ZoHz3SP
 37fbt5K0D5Cwgvn5lp6LthQA7Z2iY8ns8GUApk0gGEk1hktRfOiB2IEYtntSz/HmnYQO
 ZmD/8MIdJ9JcBMeGK4giWzSq8fw81s1rswah9OjIo6Eg71gyTJq2BFSXHyWuqtCOUtC2
 q7vg==
X-Gm-Message-State: APjAAAX656HKHVSc3SdSnRtL2mvEHMsdDw6fc357haYHzDJ3ICVoMj8H
 5F98kz+DnY6H3zFV7wW0JWsaGYLVnwq+78fL28UiUw==
X-Google-Smtp-Source: APXvYqzrhGSVJ7DV/F7d51q9N5ZE/3Gdj+PUpdVhrLQtXpA774FgTPlA9JMz0E4zBMsomoYTx9It+Pl+lwBwRCw5EpI=
X-Received: by 2002:a67:de99:: with SMTP id r25mr60881073vsk.215.1560790668543; 
 Mon, 17 Jun 2019 09:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190617135636.GC1367@arrakis.emea.arm.com>
In-Reply-To: <20190617135636.GC1367@arrakis.emea.arm.com>
From: Evgenii Stepanov <eugenis@google.com>
Date: Mon, 17 Jun 2019 09:57:36 -0700
Message-ID: <CAFKCwrjJ+0ijNKa3ioOP7xa91QmZU0NhkO=tNC-Q_ThC69vTug@mail.gmail.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=retltkRYeaxJ6adF3YGzOCqdGSJ+TnMcYlKByHm/5DU=;
 b=HM9XZcRH7jNoUwKtDn/wkkMYYyg9wr6zjYQcvYAYvWF5M1tzrgs41DdFiwwTgvt1O5
 KjOS0GHXaKxXHbuqb3yaHFY6s5m+GgG8jbRV5AKURRu+BUwOFgp4r3kAue00v9koQG1w
 A3M5l+cF/ibNvE8yJCY4E6+A4Wcv9UTKgrtukbJgSFBngoBXKyC/nUsbJSqEshzxgU7v
 OjkzG8cTM1db0z9+CHPRCzJf6yJOwQUirXZIKRWYCQ5D1XOdgX6CDWUq7ZrKtG2PzpGN
 +3DiSEl9lQXDncbHpzuwreL+mokGyGGK7aL+x6DR/HBeGpJarIMjtc91XuMaEVI3t0qt
 MUIA==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNjo1NiBBTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDAxOjQz
OjIwUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBGcm9tOiBDYXRhbGluIE1h
cmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+ID4KPiA+IEl0IGlzIG5vdCBkZXNpcmFi
bGUgdG8gcmVsYXggdGhlIEFCSSB0byBhbGxvdyB0YWdnZWQgdXNlciBhZGRyZXNzZXMgaW50bwo+
ID4gdGhlIGtlcm5lbCBpbmRpc2NyaW1pbmF0ZWx5LiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBw
cmN0bCgpIGludGVyZmFjZQo+ID4gZm9yIGVuYWJsaW5nIG9yIGRpc2FibGluZyB0aGUgdGFnZ2Vk
IEFCSSB3aXRoIGEgZ2xvYmFsIHN5c2N0bCBjb250cm9sCj4gPiBmb3IgcHJldmVudGluZyBhcHBs
aWNhdGlvbnMgZnJvbSBlbmFibGluZyB0aGUgcmVsYXhlZCBBQkkgKG1lYW50IGZvcgo+ID4gdGVz
dGluZyB1c2VyLXNwYWNlIHByY3RsKCkgcmV0dXJuIGVycm9yIGNoZWNraW5nIHdpdGhvdXQgcmVj
b25maWd1cmluZwo+ID4gdGhlIGtlcm5lbCkuIFRoZSBBQkkgcHJvcGVydGllcyBhcmUgaW5oZXJp
dGVkIGJ5IHRocmVhZHMgb2YgdGhlIHNhbWUKPiA+IGFwcGxpY2F0aW9uIGFuZCBmb3JrKCknZWQg
Y2hpbGRyZW4gYnV0IGNsZWFyZWQgb24gZXhlY3ZlKCkuCj4gPgo+ID4gVGhlIFBSX1NFVF9UQUdH
RURfQUREUl9DVFJMIHdpbGwgYmUgZXhwYW5kZWQgaW4gdGhlIGZ1dHVyZSB0byBoYW5kbGUKPiA+
IE1URS1zcGVjaWZpYyBzZXR0aW5ncyBsaWtlIGltcHJlY2lzZSB2cyBwcmVjaXNlIGV4Y2VwdGlv
bnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT4KPgo+IEEgcXVlc3Rpb24gZm9yIHRoZSB1c2VyLXNwYWNlIGZvbGs6IGlmIGFu
IGFwcGxpY2F0aW9uIG9wdHMgaW4gdG8gdGhpcwo+IEFCSSwgd291bGQgeW91IHdhbnQgdGhlIHNp
Z2NvbnRleHQuZmF1bHRfYWRkcmVzcyBhbmQvb3Igc2lnaW5mby5zaV9hZGRyCj4gdG8gY29udGFp
biB0aGUgdGFnPyBXZSBjdXJyZW50bHkgY2xlYXIgaXQgZWFybHkgaW4gdGhlIGFybTY0IGVudHJ5
LlMgYnV0Cj4gd2UgY291bGQgZmluZCBhIHdheSB0byBwYXNzIGl0IGRvd24gaWYgbmVlZGVkLgoK
Rm9yIEhXQVNhbiB0aGlzIHdvdWxkIG5vdCBiZSB1c2VmdWwgYmVjYXVzZSB3ZSBpbnN0cnVtZW50
IG1lbW9yeQphY2Nlc3NlcyB3aXRoIGV4cGxpY2l0IGNoZWNrcyBhbnl3YXkuIEZvciBNVEUsIG9u
IHRoZSBvdGhlciBoYW5kLCBpdAp3b3VsZCBiZSB2ZXJ5IGNvbnZlbmllbnQgdG8ga25vdyB0aGUg
ZmF1bHQgYWRkcmVzcyB0YWcgd2l0aG91dApkaXNhc3NlbWJsaW5nIHRoZSBjb2RlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
