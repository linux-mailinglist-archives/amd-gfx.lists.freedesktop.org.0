Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4D42732
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A679889612;
	Wed, 12 Jun 2019 13:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911BC8930B
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:18 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id n190so13531936qkd.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Tg03Gniv02ZbxFz4TR6ORKJ5z+YRDkk6YMGCeNMzVJA=;
 b=V9RPEvv0dzyu0kJSBcweklRfkia8t7GwaVQwzDWSqXrgZqdurKY2xOZJtMgk54P9q4
 W9S+ilBRp/ak0yOIuKxhK6v1glcIrgj83X1GJrRqcfHxR2SG3KOkyDLlHNR520eRnh9A
 oR24MyyjXrKM7/wwwMfsR5XzRuWkNkgg6vjdJlLGw31znaW9Wa2je7ztlPk35fEtWKoZ
 IiO4pdvP6ki3dkT/fQL7N8/y6cBzDUvS6gNjG94oMabSmk2eKf7ZYHkH/dGcS+HQ23mv
 tXVuqyyXTjdOKHyqHm7RWxJyL7rRT29amb+A6slAhLC6xkAAhOu69hq4I+M9LuBV7Z+H
 K8Sg==
X-Gm-Message-State: APjAAAUNDdNleX+RtrkKiY8BVIdtjViHJyR6TKhRNyrwuKz0P9tD5ojU
 58XDuzpTSn9erP8G+q52ZI3tChJXdPOI0Lrh
X-Google-Smtp-Source: APXvYqyCeVb0C2VnUmKvZl/NXpmzEb8PXfZVfFDAeRPGCnyVezO7o0ITR/pw5X1cgaGDH/zdBw+sIaHhGO7/u0mq
X-Received: by 2002:ac8:5485:: with SMTP id h5mr67932284qtq.253.1560339857730; 
 Wed, 12 Jun 2019 04:44:17 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:30 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <9d68d9e7f9f89900adb4cb58c34ffe532dfb964a.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 13/15] tee/shm,
 arm64: untag user pointers in tee_shm_register
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
 bh=Tg03Gniv02ZbxFz4TR6ORKJ5z+YRDkk6YMGCeNMzVJA=;
 b=SFF/l4UFcejexpzLF8WLlQfmQ26wur6/Lp5UaETnaEcEawlk3l/6lGLaUMMooAgs8s
 H8BXtM8Po2kTy/ERZiKnsQjpEuZwCfivxhd6SyQ7RL+iB0sQfj/clPfIeMIPz6uKVDLv
 xUHwWlMKGfxD6gcgGhDGYlQ/8FvPYT93r6i2RnedCW6E6xVhUJOencUb8rKP9J6i4iHL
 r+rptZFaLXc6jhn3wSb4NX5Q2zQt78sd6zAnhaXM0vfZ1qtib0qyN9SWZBmopO4jCPUZ
 R6Ny3CDz7f0jULr5eWdVbsgq1nlATw+QzZpUThV+z5VYuwsEypjY/9FNseoLEmXCwIbk
 +Rew==
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
cmd1bWVudHMuCgp0ZWVfc2htX3JlZ2lzdGVyKCktPm9wdGVlX3NobV91bnJlZ2lzdGVyKCktPmNo
ZWNrX21lbV90eXBlKCkgdXNlcyBwcm92aWRlZAp1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vw
cyAodmlhIF9fY2hlY2tfbWVtX3R5cGUoKSksIHdoaWNoIGNhbiBvbmx5IGJ5CmRvbmUgd2l0aCB1
bnRhZ2dlZCBwb2ludGVycy4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4K
ClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6
IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy90
ZWUvdGVlX3NobS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3RlZS90ZWVfc2htLmMgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKaW5k
ZXggMmRhMDI2ZmQxMmM5Li4wOWRkY2QwNmM3MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGVlL3Rl
ZV9zaG0uYworKysgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKQEAgLTI1NCw2ICsyNTQsNyBAQCBz
dHJ1Y3QgdGVlX3NobSAqdGVlX3NobV9yZWdpc3RlcihzdHJ1Y3QgdGVlX2NvbnRleHQgKmN0eCwg
dW5zaWduZWQgbG9uZyBhZGRyLAogCXNobS0+dGVlZGV2ID0gdGVlZGV2OwogCXNobS0+Y3R4ID0g
Y3R4OwogCXNobS0+aWQgPSAtMTsKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKIAlzdGFy
dCA9IHJvdW5kZG93bihhZGRyLCBQQUdFX1NJWkUpOwogCXNobS0+b2Zmc2V0ID0gYWRkciAtIHN0
YXJ0OwogCXNobS0+c2l6ZSA9IGxlbmd0aDsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMy
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
