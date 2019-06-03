Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11033E60
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44D895B6;
	Tue,  4 Jun 2019 05:23:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com
 [IPv6:2607:f8b0:4864:20::249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BE88929C
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:10 +0000 (UTC)
Received: by mail-oi1-x249.google.com with SMTP id 12so5454185oii.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=UdKHGBZnbXnYOdacGwXVLbo2mp7I3OpbNnEy2rn9dE0=;
 b=hMnhXT1Wf0HzKNrKPzC8WOsvZmmAy3xQ4VI2Mzt7JJBLhPM4CVX8SvAnmF1p94HLBs
 S4Kifjf0ixk19G9mdrx+vXqDUlboYrJfpPh35O9oQ+R9ebkQ76gzNcVuQPxfNeSC9BEQ
 +Qu3aCVviWstbmPz2RvaZzf9/Fxzl5OULLrDJw6/uZOMxA1UW2xT+u9hO3I8ZDZw5olr
 SFPUuqPtACumHNJwUxwrNfdXM9wDPsRkwTLcDU5ft8nx/nQijoqvWy8ALwfasJotL5aW
 rqmfwZwEgWwKSm2J4Yn3HcBT9j6roXRXCd/WAlJVzGgczI+IbhOUI28Gh/uKl9sMrJQz
 nnVg==
X-Gm-Message-State: APjAAAUutni2I4rBCTls4FF0uoWv8DqnwK7Rvo5nY09GaGPGxr/xxBR2
 4kALTaqKErLvHpZAhdsQoguCUGA13ZyrX9S1
X-Google-Smtp-Source: APXvYqxMjN/4yHR2ThXEEFJeDuxNxY18SC+MmNXgYJ7rlNGji/L0sGyo9f6aEs2c6lSgFUC7mMKDb3c6mMlyiMDt
X-Received: by 2002:a9d:4109:: with SMTP id o9mr1768838ote.353.1559580969728; 
 Mon, 03 Jun 2019 09:56:09 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:16 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 14/16] tee, arm64: untag user pointers in tee_shm_register
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 05:23:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=UdKHGBZnbXnYOdacGwXVLbo2mp7I3OpbNnEy2rn9dE0=;
 b=aMwQlO/uqKNquhxQCaOybakc925QpZfJO8wh15xEZQIyCg72vlDGXrUg/ROAuoQDUD
 yCBHc/elg2gmmBaFllCt7o9fko/cMYEXNqMBN5Ib8jP974H6cgrFWFCLBOtmTziaRGQQ
 SwI/Xt1vXIDm1HuVmNbFHcArxU2bsmwx6xs/PbNEoDywCtOeBm47QoZ+wae08e7pzq/K
 a7mRKG2GqnFCVji4AY+94HQ5eVsYgsMp8E/PA4r/OPS0psFqvjDQbyz4YEbR/PgBj2Aq
 436HnabGuSm3Rvtg2LN9VhA8Rs2mRcn4xgL77EZC0LMuRu0EvZQAUUg9zFkbP9a8AWHr
 YN2w==
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
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4K
LS0tCiBkcml2ZXJzL3RlZS90ZWVfc2htLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVl
L3RlZV9zaG0uYwppbmRleCA0OWZkNzMxMmUyYWEuLjk2OTQ1ZjRjZWZiOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpAQCAtMjYz
LDYgKzI2Myw3IEBAIHN0cnVjdCB0ZWVfc2htICp0ZWVfc2htX3JlZ2lzdGVyKHN0cnVjdCB0ZWVf
Y29udGV4dCAqY3R4LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJc2htLT50ZWVkZXYgPSB0ZWVkZXY7
CiAJc2htLT5jdHggPSBjdHg7CiAJc2htLT5pZCA9IC0xOworCWFkZHIgPSB1bnRhZ2dlZF9hZGRy
KGFkZHIpOwogCXN0YXJ0ID0gcm91bmRkb3duKGFkZHIsIFBBR0VfU0laRSk7CiAJc2htLT5vZmZz
ZXQgPSBhZGRyIC0gc3RhcnQ7CiAJc2htLT5zaXplID0gbGVuZ3RoOwotLSAKMi4yMi4wLnJjMS4z
MTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
