Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4083B6BE
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127A689168;
	Mon, 10 Jun 2019 14:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEB089218
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Jun 2019 04:00:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c5so1532891pll.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 21:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJBSSsNH8TcUO3Ycp4J72yQtEEm/T/jL9xlaGf6pvZI=;
 b=faZlDcyRRaVV/1gjNUi+XS17k3S1a42VSKFtqaG/P3ICjziHuQJJn3pdTXpv8fLHxa
 N1Cvh2mbgBX2/8BKLsMr7FF8asWjc+ZAgiumBMHiMvnnuck9CDeVbzZfzCzuGQOLKZJ/
 QGGHf36L9Ww9X2fevFG6uHfK/4yIBHe36IE95kP4a42XivnIHmzBP8S/uzcezDv7tqN+
 ZsZkz+DCgs+quYfA0FN6x97tGYB/sNAYy7CF29Cvu80YSUMEy7fuyITEdQY4m+wZBXyW
 4try57hN7oQJmempkWKGCmXiOXZCnHAcIjnQnkFhqNhxNjyNUONN7XeOHpeZB/Za3pRo
 vIlA==
X-Gm-Message-State: APjAAAV0+Dx32RxXhQ0pYzsPVe2AUxmk2UqzWhB3w3yWELPrHUHDjeom
 RtJ4YLqFdlNdgAUl0yJXf2eDsQ==
X-Google-Smtp-Source: APXvYqzHeK0TqpcqthfQS0PvnOaTM79D0qX0jOvsUb1vmxMb45KBYDAyFtX8G3vNYgX7ILuQ8oms2A==
X-Received: by 2002:a17:902:a516:: with SMTP id
 s22mr20509311plq.178.1559966427983; 
 Fri, 07 Jun 2019 21:00:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q1sm6873405pfb.156.2019.06.07.21.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 21:00:27 -0700 (PDT)
Date: Fri, 7 Jun 2019 21:00:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 07/16] mm, arm64: untag user pointers in
 get_vaddr_frames
Message-ID: <201906072059.69C8284A0E@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YJBSSsNH8TcUO3Ycp4J72yQtEEm/T/jL9xlaGf6pvZI=;
 b=SIGHIuBbHjdFD2NYvbt1juZyNlfYo8T13G3oRQwScPFyvz27E5QmOWxjQJHoK99WBn
 Ze60epVcGs+lOMqYkRKqCgC9UKlerLVaaZ1FhvQY+1i8DraNj5oIlnKwiTKses761SQn
 gTwBZBGZ3BV+37p5XRC1XuqiURHbiOTUskj5E=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Matthew Wilcox <willy@infradead.org>,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gZ2V0X3ZhZGRyX2ZyYW1lcyB1c2VzIHByb3Zp
ZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiBvbmx5IGJ5IGRv
bmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdp
bmcKPiBhbGwgY2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uLCBwZXJmb3JtIHVudGFnZ2luZyBpbiBp
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2ds
ZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cgot
S2VlcwoKPiAtLS0KPiAgbW0vZnJhbWVfdmVjdG9yLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vZnJhbWVfdmVjdG9yLmMgYi9t
bS9mcmFtZV92ZWN0b3IuYwo+IGluZGV4IGM2NGRjYTZlMjdjMi4uYzQzMWNhODFkYWQ1IDEwMDY0
NAo+IC0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCj4gKysrIGIvbW0vZnJhbWVfdmVjdG9yLmMKPiBA
QCAtNDYsNiArNDYsOCBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAo+ICAJaWYgKFdBUk5fT05fT05DRShucl9mcmFtZXMg
PiB2ZWMtPm5yX2FsbG9jYXRlZCkpCj4gIAkJbnJfZnJhbWVzID0gdmVjLT5ucl9hbGxvY2F0ZWQ7
Cj4gIAo+ICsJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiArCj4gIAlkb3duX3JlYWQo
Jm1tLT5tbWFwX3NlbSk7Cj4gIAlsb2NrZWQgPSAxOwo+ICAJdm1hID0gZmluZF92bWFfaW50ZXJz
ZWN0aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3
NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
