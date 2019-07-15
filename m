Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61312698D3
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 18:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C45988FE2;
	Mon, 15 Jul 2019 16:04:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737A789A1E
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 16:01:41 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i8so7906785pgm.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lChEEghQFkJA0ae9eAwhZ0QJmvdqy/WLUOFz361BXCQ=;
 b=W1kJvygl6LEIxjlq1eemr4g4s5vIHN6KVWDQ2YZevdA2PN3tZ2A7+BRNMQ1VatzMqC
 giY8j86w2hjRSSgpLiBOzoYR4I68p7jkGeO06K1RHlasaEHh196axzQbqeIi8NGTtyDk
 ODRrl6q7RA1We6T4fpxI7DfFlWqMkvr+MB7bP1d7VoCX5hkNxHnXl9GZKP4/7iJww6bL
 mBHSIIqf5SeSbVMZgNZofKollBvePxU3eM/vUKCTRhLQaLU9gI4BaEVZQXFkzj6wrPet
 sy+qjJSzfkIBknsMNBcarNJ5hBa3U7u6Xr23jENRLjJJpRT7I66hhuFiWEtvgFwK/j2T
 fpTQ==
X-Gm-Message-State: APjAAAUUdnheQbl5/Z/SQw99NO9Yc6CTxWa1b78RLBIZO70lJ4DRNwcj
 2v9zMsE3neWQ8k8MJUUPFF59zYqKKkvPYlgBE6OaZA==
X-Google-Smtp-Source: APXvYqyLZ0wS0QgBngEcy3YbbCLzw5RatJ3FtyfhyqUYHKhFv456jIze9R6yuxvC6+RP9cmNsJEN8HfxXPuILyhJ/1w=
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr29861239pjp.47.1563206500702; 
 Mon, 15 Jul 2019 09:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
In-Reply-To: <20190624174015.GL29120@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 15 Jul 2019 18:01:29 +0200
Message-ID: <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Mon, 15 Jul 2019 16:04:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lChEEghQFkJA0ae9eAwhZ0QJmvdqy/WLUOFz361BXCQ=;
 b=m3ylaWA1nfDKOLFQBZbi5lVR91/hvH9n6ddTo7/UGe/KLQTke6nfJGGnTYTOxi8VCA
 HfS0hKS7p+bVQo6gCnikJZrIRnFAsBOo76vo66MNNR76VN9RpCPaB5uiN9mXzb/wKBaC
 2YPMCtyHAVUy8c0n2Hy0noVhGDDAso8pOP+OWaQofcmHPvFQjxyIKXwz5wkCf0bTrn7S
 NzX5/+eAUp4zqkWQrLjg7UELrWGHhufD8/uShStHD6i3q1aY9KquzAKDzGkmcTnssS5F
 Z3nCiKnfqdcqBaEFScvEV6fXgwg7XscQvG1/2qeAbDEIc8Yoj5aguZfuLCcnlHXlWZQG
 m73g==
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo0MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDA0OjMy
OjU2UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNz
Cj4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0
aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4K
PiA+IG1seDRfZ2V0X3VtZW1fbXIoKSB1c2VzIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZt
YSBsb29rdXBzLCB3aGljaCBjYW4KPiA+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgo+ID4KPiA+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIHwgNyArKysrLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+Cj4g
VGhpcyBwYXRjaCBhbHNvIG5lZWRzIGFuIGFjayBmcm9tIHRoZSBpbmZpbmliYW5kIG1haW50YWlu
ZXJzIChKYXNvbikuCgpIaSBKYXNvbiwKCkNvdWxkIHlvdSB0YWtlIGEgbG9vayBhbmQgZ2l2ZSB5
b3VyIGFja2VkLWJ5PwoKVGhhbmtzIQoKPgo+IC0tCj4gQ2F0YWxpbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
