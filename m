Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A87E1D6
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E8F6E2F8;
	Thu,  1 Aug 2019 18:00:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546B6E5C6
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 12:48:49 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f17so30025927pfn.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATAFhJly7oayn4QwVxAmF/cKx18eZXYIEq5cLXvpdzg=;
 b=G+kuHIZNziY6FtAutR1pJ+GNLD/7xeLFlsVaeKvVDtXmhxT2KFX+DjUGaJ/NKKnCkW
 KZHQIs7a9TTo2hCfde8uOdCWEmgfw421RRzY8hf5IlpsAion6aDhRPZEF2+EQA+8MVwI
 lIz8dGePOF9MYcgzHJlC3fjTgsQKNW6lmdt4xkaNxhAkdke5bYCWSspKDjPfe8+1diRW
 bhPjOK2U7ixn2HLctK8DoeAnaPLj5Ge9c7I4+WcAG+QlKocWz4kVaUdESs0VwMyo0g88
 BKkc7Rt6g51hSCGU6Ny6HQpq5n1tiz3tiwF0EJjBMKVqg3aY+UtgV54f3vgNH3sTvoA2
 p2gw==
X-Gm-Message-State: APjAAAUISSja893KEZaNLJ59xdoQJRq/OrO1QZPYEHbZrwFPSd9PEH1Y
 Wd1nOlGREJTgDT12NY6BWN8JFtNlBhfO8hLcqA7r1g==
X-Google-Smtp-Source: APXvYqyuYmWo+CP2FzNWYkHFT0ZLT3W5Y5OJQeMQdVh76HiNmdD4jPQ2fznL3kD7gDek9Cqsx8/zBcK9HOnHQgVpStE=
X-Received: by 2002:a65:4b8b:: with SMTP id
 t11mr118476394pgq.130.1564663728917; 
 Thu, 01 Aug 2019 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
 <8c618cc9-ae68-9769-c5bb-67f1295abc4e@intel.com>
 <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
In-Reply-To: <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 1 Aug 2019 14:48:37 +0200
Message-ID: <CAAeHK+zTFqsLiB3Wf0bAi5A8ukQX5ZuvfUg4td-=r5UhBsUBOQ@mail.gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Kevin Brodsky <kevin.brodsky@arm.com>
X-Mailman-Approved-At: Thu, 01 Aug 2019 18:00:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ATAFhJly7oayn4QwVxAmF/cKx18eZXYIEq5cLXvpdzg=;
 b=mjC+j0aaEEkkMHnLNHs9TEJqIdScFWRlkAZG8TbiBl3AyUZ8l5nLaU29ZLHSb7WvwH
 X3OlQDdgsBZjncfM3ONy8Dqcuih1q2WnbLztoEOKMtf5vefqmMIHHwchJuo+ue+DCVka
 b9rui+0AvY5PeeX+qJY2jvBZQab/NzRkSsMupCgkTdlEDxE6K7Nu5zDKiMeGfnD3hicf
 2VPYUTHD9bJKAQWesHnbiPWY9rwW/eF7WIHmcnvL9DkrJEokfA1mnjx39I+4RQdt1WLM
 ieuyPRr8iw6XMHiEGmpinxm+wGAydMTsA6N4zI0Tg/WWtENcJ84NKdjINucR3C9EQWXN
 EQGw==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>, Dave Hansen <dave.hansen@intel.com>,
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

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAyOjExIFBNIEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rz
a3lAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAzMS8wNy8yMDE5IDE3OjUwLCBEYXZlIEhhbnNlbiB3
cm90ZToKPiA+IE9uIDcvMjMvMTkgMTA6NTggQU0sIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4g
Pj4gVGhlIG1tYXAgYW5kIG1yZW1hcCAob25seSBuZXdfYWRkcikgc3lzY2FsbHMgZG8gbm90IGN1
cnJlbnRseSBhY2NlcHQKPiA+PiB0YWdnZWQgYWRkcmVzc2VzLiBBcmNoaXRlY3R1cmVzIG1heSBp
bnRlcnByZXQgdGhlIHRhZyBhcyBhIGJhY2tncm91bmQKPiA+PiBjb2xvdXIgZm9yIHRoZSBjb3Jy
ZXNwb25kaW5nIHZtYS4KPiA+IFdoYXQgdGhlIGhlY2sgaXMgYSAiYmFja2dyb3VuZCBjb2xvdXIi
PyA6KQo+Cj4gR29vZCBwb2ludCwgdGhpcyBpcyBzb21lIGphcmdvbiB0aGF0IHdlIHN0YXJ0ZWQg
dXNpbmcgZm9yIE1URSwgdGhlIGlkZWEgYmVpbmcgdGhhdAo+IHRoZSBrZXJuZWwgY291bGQgc2V0
IGEgdGFnIHZhbHVlIChzcGVjaWZpZWQgZHVyaW5nIG1tYXAoKSkgYXMgImJhY2tncm91bmQgY29s
b3VyIiBmb3IKPiBhbm9ueW1vdXMgcGFnZXMgYWxsb2NhdGVkIGluIHRoYXQgcmFuZ2UuCj4KPiBB
bnl3YXksIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIG5vdCBhYm91dCBNVEUuIEFuZHJleSwgZm9yIHYy
MCAoaWYgYW55KSwgSSB0aGluayBpdCdzCj4gYmVzdCB0byBkcm9wIHRoaXMgbGFzdCBzZW50ZW5j
ZSB0byBhdm9pZCBhbnkgY29uZnVzaW9uLgoKU3VyZSwgdGhhbmtzIQoKPgo+IEtldmluCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
