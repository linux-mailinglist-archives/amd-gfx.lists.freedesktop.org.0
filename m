Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888C42729
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB5A8951B;
	Wed, 12 Jun 2019 13:12:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669789320
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:09 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id b1so7607726otk.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9qcG2BgTwk3XlX0RcWVeDPHI8lhK5DjmwRDy1FE/sPA=;
 b=tlaLQ2OhprFJdH0d6QAQT4N2YSw+Htkv4HGQRWYjWuQSr5vHi0tWyqDfLoH+MD3CiV
 roU4F2+8pkpj4rKw9u686T/gfd+DtHqvJTgb5ABRrrOQzyRwdP4axxF8P5rm/JWZ+uxY
 QAMzCvOu4nA5WjtOS5qJKojCzNOfv9E3lTW6LhMCqs9ghePsMHhhlS28bWQg5cQ6w/qs
 BaZEfre8vrNV1jQAULW2JSOMnPiSdV1YpL35WV3jJj1WRBG4hiXHx5evDl3GSCi76HmY
 2SdPBuV29yRm1eymg+6/1eabVWTOt+0Anl6fvATLkExX1qTTbFJZgYf0NeGPJb0BGTET
 ZhRg==
X-Gm-Message-State: APjAAAUzFZd6I7CGldQPhZ6OzitsXuvLMHGGvIu/vwapr/knOEfCegG1
 P9lWjEbkGGEjG0vAmBCuq+WZrcMJdqyirAW9
X-Google-Smtp-Source: APXvYqwmn5LtjaTY+f4hsmtZfAoqdCdKYyyJ3TA1JpFnaOV6Nu/BG+R38vnyWSwcum180MP3Ic/YmQmm8bwHU1r3
X-Received: by 2002:a05:6830:119:: with SMTP id
 i25mr175410otp.288.1560339848209; 
 Wed, 12 Jun 2019 04:44:08 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:27 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <9ba6199f01b8e941404b18bf8f7079ff384fb60b.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 10/15] drm/radeon,
 arm64: untag user pointers in radeon_gem_userptr_ioctl
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=9qcG2BgTwk3XlX0RcWVeDPHI8lhK5DjmwRDy1FE/sPA=;
 b=NtLJcSSFMHHu317AevzAQ/30ZKEUOStp0YqobtwksbYseFWqgtaBTFdiHMGyyyf7At
 YDJhLaCkyHoSzl2vKPQ0kqczt1dgoIP6M4Ipn73b/OGJITm9/nwiI3El0EdSAptKyxy3
 b89x7f/UmAMLYhahbGWtvHAEQvqe/KEbHnD9FTBIwA/5CD9mYyTGMXM5MGTE55QAL6sy
 I3ZLX4P7OcoVJPIKw9PZDhGTJmKOWHMHOrsjABMEwlErwDLgIe9+iGkSdgcah0pP/nqE
 b30uAgSnuW/RhTjVNWI3Kw8grpBZAvIwRQ2tzxM9A7fFKVadA2sdBJN3nJtOltKf1dPe
 uUMA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpJbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbiBNTVUgbm90aWZpZXIg
aXMgc2V0IHVwIHdpdGggYSAodGFnZ2VkKQp1c2Vyc3BhY2UgcG9pbnRlci4gVGhlIHVudGFnZ2Vk
IGFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUKbm90aWZpZXJzIGZvciB0aGUgdW50
YWdnZWQgYWRkcmVzcyBnZXQgY29ycmVjdGx5IG1hdGNoZWQgdXAgd2l0aCB0aGUgcmlnaHQKQk8u
IFRoaXMgZnVuY2F0aW9uIGFsc28gY2FsbHMgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cigpLCB3
aGljaCB1c2VzCnByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBj
YW4gb25seSBieSBkb25lIHdpdGgKdW50YWdnZWQgcG9pbnRlcnMuCgpUaGlzIHBhdGNoIHVudGFn
cyB1c2VyIHBvaW50ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bCgpLgoKU3VnZ2VzdGVk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZ2VtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwppbmRleCA0NDYxN2RlYzgxODMuLjkw
ZWI3OGZiNWViMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2Vt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKQEAgLTI5MSw2ICsy
OTEsOCBAQCBpbnQgcmFkZW9uX2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCiAJdWludDMyX3QgaGFuZGxlOwogCWludCByOwogCisJYXJncy0+YWRk
ciA9IHVudGFnZ2VkX2FkZHIoYXJncy0+YWRkcik7CisKIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJn
cy0+YWRkciB8IGFyZ3MtPnNpemUpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yMi4wLnJj
Mi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
