Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5FB14B85
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 16:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFEE8999E;
	Mon,  6 May 2019 14:07:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D838997E
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 13:53:13 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z26so6816580pfg.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfsikH3ADmgNVGOW8dVHffAJXBPBy/1Drd0IdtpjjJ8=;
 b=kBACL9jC13qQ5XQmSfH+FkXiW6RAXCuwfmswJZlWQHhRz5dUYGsRHwgVW0k/tdA7UC
 CqBts5Zr9r43OzTM1YeHfCljW8T5R0zwnePL60suvrugY3yMBrTxHSSweusr5r7Ofb1O
 j140gv9KGQISDIvHO1+PfTr3I8YC6uEewfj8Ta5e2ftmKJ/r4/qP6Eq7iKCZiDoJoR6g
 GLpkIU0tZaDwjVkNVjMtFfpFuiqgto3YfS9VWqbDEwK+8yMgENXBI0PD1h9WltUaFJe1
 y32D6UyHFKdTZd1zgsKEowzlOdkIv9XfNf69rSTiWZKR2u8z24XDSKH0fbm+8pTuA8Cs
 2KQg==
X-Gm-Message-State: APjAAAWr+ZpvgwcZfwPXKfXvk7begahLeVPqRbzugG2g095oHEQXOq2r
 8inK6soy9Xe6z3oJ9maRxPlWvP35am6rlPMnXVffhA==
X-Google-Smtp-Source: APXvYqz1fgwxD3Q1L0PJp0GBoiDCnAmVuD+UduBO6dKustad4HqnmYC98uMKFLNp2x7D5yl19BVMVIT9EGy2Pg34Ktk=
X-Received: by 2002:aa7:9116:: with SMTP id 22mr33262822pfh.165.1557150792655; 
 Mon, 06 May 2019 06:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
 <20190503165113.GJ55449@arrakis.emea.arm.com>
In-Reply-To: <20190503165113.GJ55449@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 15:53:01 +0200
Message-ID: <CAAeHK+wCyCa-5=bPNwfivP6sEODOXKE1bPjcjc2y_T4rN+-6gA@mail.gmail.com>
Subject: Re: [PATCH v14 08/17] mm,
 arm64: untag user pointers in get_vaddr_frames
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Mon, 06 May 2019 14:07:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DfsikH3ADmgNVGOW8dVHffAJXBPBy/1Drd0IdtpjjJ8=;
 b=kv7aGbZwowOP86IiNXKGTzv02HGdI2dS555U/AmH12LgQOZnKLK39c4sVdRuufn96A
 qthFKSfdn7G60uj86be1sn6Yz08bEym7ZdQPS1mHAwXca2PX4G4xwzBsumjfQSNalrzf
 yL5bwTZ9P03pKULjLPyCJCemso/1RN2dFNxsJkh8Db8dDQ4uyTu4XB2OtIwgRdUtOIbE
 AyYkrbplUjKWiH4tJjgIH/K5mFuPdBD8NVSdZa64NURA8ieEyhpOBhaJlBUr1GIoMIGp
 v2ptbSyS2qLsf62uamUc0COAt9buSU1YrXxFbkm18U+53rgjezb09axtZoHwZgv8hVgU
 L1Yg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>, Felix <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuehling@google.com, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA2OjUxIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6
MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggaXMgYSBw
YXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRv
Cj4gPiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8g
c29tZXRoaW5nIGVsc2Ugb3RoZXIKPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMu
Cj4gPgo+ID4gZ2V0X3ZhZGRyX2ZyYW1lcyB1c2VzIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9y
IHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiA+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBv
aW50ZXJzLiBJbnN0ZWFkIG9mIGxvY2F0aW5nIGFuZCBjaGFuZ2luZwo+ID4gYWxsIGNhbGxlcnMg
b2YgdGhpcyBmdW5jdGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiAgbW0vZnJhbWVfdmVjdG9yLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tbS9mcmFtZV92ZWN0b3IuYyBiL21tL2Zy
YW1lX3ZlY3Rvci5jCj4gPiBpbmRleCBjNjRkY2E2ZTI3YzIuLmM0MzFjYTgxZGFkNSAxMDA2NDQK
PiA+IC0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCj4gPiArKysgYi9tbS9mcmFtZV92ZWN0b3IuYwo+
ID4gQEAgLTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKPiA+ICAgICAgIGlmIChXQVJOX09OX09OQ0Uo
bnJfZnJhbWVzID4gdmVjLT5ucl9hbGxvY2F0ZWQpKQo+ID4gICAgICAgICAgICAgICBucl9mcmFt
ZXMgPSB2ZWMtPm5yX2FsbG9jYXRlZDsKPiA+Cj4gPiArICAgICBzdGFydCA9IHVudGFnZ2VkX2Fk
ZHIoc3RhcnQpOwo+ID4gKwo+ID4gICAgICAgZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+ID4g
ICAgICAgbG9ja2VkID0gMTsKPiA+ICAgICAgIHZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbiht
bSwgc3RhcnQsIHN0YXJ0ICsgMSk7Cj4KPiBJcyB0aGlzIHNvbWUgYnVmZmVyIHRoYXQgdGhlIHVz
ZXIgbWF5IGhhdmUgbWFsbG9jJ2VkPyBJIGdvdCBsb3N0IHdoZW4KPiB0cnlpbmcgdG8gdHJhY2sg
ZG93biB0aGUgcHJvdmVuaWVuY2Ugb2YgdGhpcyBidWZmZXIuCgpUaGUgY2FsbGVyIHRoYXQgSSBm
b3VuZCB3aGVuIEkgd2FzIGxvb2tpbmcgYXQgdGhpczoKCmRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9nMmQuYzo0ODIKZXh5bm9zX2cyZF9zZXRfY21kbGlzdF9pb2N0bCgpLT5nMmRf
bWFwX2NtZGxpc3RfZ2VtKCktPmcyZF91c2VycHRyX2dldF9kbWFfYWRkcigpLT5nZXRfdmFkZHJf
ZnJhbWVzKCkKCj4KPiAtLQo+IENhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
