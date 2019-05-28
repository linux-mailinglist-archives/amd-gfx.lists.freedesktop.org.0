Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ABE2C9B3
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 17:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCE189E47;
	Tue, 28 May 2019 15:10:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88FE89E39
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 14:14:58 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u17so11568933pfn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uILrnXKlYf2xjYbSzuRjxVZ/GKBRZG6iBlNh5FVzNqg=;
 b=WAqbOCyUbxbaPwUbxd0FUg+uSU9XoBO51FGtD8s/rWBUQtq6bM+FjM2bnorjjXXO4X
 Zxw/toOlZgDWVutYlNUbDzGHuPTf4m1xklddMlhHEos/LOB08Zs5GaH9w6lWakFyXlg1
 F/n8VFZ8ZDtngfy5CwnpCO5mrgxYdNNLamvu2+9JNRI8Zym7D/tqSLEFYcn9zVT1+eex
 VEW4u4QgTE1BOkbbrRRluBvXWaCyUWqD8QsAfLgS5IAvUX38JakIV1xQUEnnHSvKzoqf
 bF4xkTqo+1pm0zBu5LHDpV0hggXIN3EVGkLRuBohMS43uJw2C36KxqXklU9BSHY/lgjP
 apIA==
X-Gm-Message-State: APjAAAUFJJTyG24ZKFSw4iNme9rokzVkNY7kX7RwMJ7VhL6ldv57kSZ6
 q7wRJINdIaT32GM4lstdLG0tMwuGD1f0WwX5yf/8dw==
X-Google-Smtp-Source: APXvYqyOX9PeZsCaqURSrIEWPGIBd1WFVQ7exVP3S114miK0Cy+gUD/uDqW5wGxUjPG0aHqJLJFWW3mMb6YG8JIQdRk=
X-Received: by 2002:a65:64d9:: with SMTP id
 t25mr132418776pgv.130.1559052897854; 
 Tue, 28 May 2019 07:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
In-Reply-To: <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 28 May 2019 16:14:45 +0200
Message-ID: <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>,
 Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Tue, 28 May 2019 15:10:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uILrnXKlYf2xjYbSzuRjxVZ/GKBRZG6iBlNh5FVzNqg=;
 b=tL4iRhDxBHlVQ+tyr45nAjSTrWm4FGkpU9/gqgAOrFY5B7cJ7oOHLY740uFY6v9Apt
 FqrRnmxExj3iQTQYzs/PenqdbelZVqX7ImfSm34SI3kUWnaFv2Pd1vXHqDLGJYPgxvw8
 7KLV8hWWHlsDJ/UwTZYLqE3rqDzmSrpBL95BUyqXducEuzu32sr8cYoLi6lrm/VHbu19
 kGodX0/6n5OKGvwKCkqnvqlMkPVgQ7D246As7ltK/sqPD0kwVjhXWCNgzf39x95m1k16
 0eXP9QfKOUXReSvTh9f0l8fCYrSWQokxzY+jcITzAkXcdghBa76eI6mVVXYUH34oj3Ib
 qnwQ==
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
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

VGhhbmtzIGZvciBhIGxvdCBvZiB2YWx1YWJsZSBpbnB1dCEgSSd2ZSByZWFkIHRocm91Z2ggYWxs
IHRoZSByZXBsaWVzCmFuZCBnb3Qgc29tZXdoYXQgbG9zdC4gV2hhdCBhcmUgdGhlIGNoYW5nZXMg
SSBuZWVkIHRvIGRvIHRvIHRoaXMKc2VyaWVzPwoKMS4gU2hvdWxkIEkgbW92ZSB1bnRhZ2dpbmcg
Zm9yIG1lbW9yeSBzeXNjYWxscyBiYWNrIHRvIHRoZSBnZW5lcmljCmNvZGUgc28gb3RoZXIgYXJj
aGVzIHdvdWxkIG1ha2UgdXNlIG9mIGl0IGFzIHdlbGwsIG9yIHNob3VsZCBJIGtlZXAKdGhlIGFy
bTY0IHNwZWNpZmljIG1lbW9yeSBzeXNjYWxscyB3cmFwcGVycyBhbmQgYWRkcmVzcyB0aGUgY29t
bWVudHMKb24gdGhhdCBwYXRjaD8KCjIuIFNob3VsZCBJIG1ha2UgdW50YWdnaW5nIG9wdC1pbiBh
bmQgY29udHJvbGxlZCBieSBhIGNvbW1hbmQgbGluZSBhcmd1bWVudD8KCjMuIFNob3VsZCBJICJh
ZGQgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS91c2VyLWFkZHJlc3Nlcy5yc3QgdG8gZGVzY3JpYmUK
cHJvcGVyIGNhcmUgYW5kIGhhbmRsaW5nIG9mIHVzZXIgc3BhY2UgcG9pbnRlcnMgd2l0aCB1bnRh
Z2dlZF9hZGRyKCksCndpdGggZXhhbXBsZXMgYmFzZWQgb24gYWxsIHRoZSBjYXNlcyBzZWVuIHNv
IGZhciBpbiB0aGlzIHNlcmllcyI/CldoaWNoIGV4YW1wbGVzIHNwZWNpZmljYWxseSBzaG91bGQg
aXQgY292ZXI/CgpJcyB0aGVyZSBzb21ldGhpbmcgZWxzZT8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
