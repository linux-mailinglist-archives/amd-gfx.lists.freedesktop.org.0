Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE40E1528C
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69989A83;
	Mon,  6 May 2019 17:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x34a.google.com (mail-ot1-x34a.google.com
 [IPv6:2607:f8b0:4864:20::34a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EAB89AB6
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:48 +0000 (UTC)
Received: by mail-ot1-x34a.google.com with SMTP id b5so7768730otq.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BvoYtYVsULamnYvbwO19c3h5oHA1gsMsAv5tZYbLYtI=;
 b=dXbHrLrTJ8FpRuVVNVh5pcxpSMdbTW2pB44y1qnZdObRdK4yCZBIYD8sLcjQH0JNYg
 lArPPTs2bhRQeV2MLtLkoo7/3Yzl0ncoMyPYCUfV1aZrzPqF8FPZOxZjZXAVaRNeEhD9
 +GWb6VvGBmN2H7+mXzXFHx3Cx2lBHSfT4kmUqLf6tPssacGHiVQFuF0kHr5t0mSApqtJ
 YqXYA0rd+zlXkZkxIkWzInYkwrpsvbSYUyIMHhqbnuSBVa1mdWfTXK2KKOsEQy6P9WIo
 JE7rSn7ivNw+cVkqtGHMWff4oplP4hpZr/3lSjZf+Ekd7tRtdosmbuHEwmSNt/p9mU1i
 rQYA==
X-Gm-Message-State: APjAAAXdhTKD93VThlWkiIWHcKbOh7pa3LQ8+yBewqAZaocx1fXFrA89
 5t1UVTPSwJK+DShT9pgMqLw9pbJSAZvJXQZB
X-Google-Smtp-Source: APXvYqy3zk1gAf1HD3ERPdP+fu/IbJWPYjnwXEpH7KM/4Kolrw9tSDmooPMwqXT4nvIVhZWlBkow5/TqTCzeTPOv
X-Received: by 2002:a9d:6008:: with SMTP id h8mr18251374otj.55.1557160307352; 
 Mon, 06 May 2019 09:31:47 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:59 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 13/17] IB,
 arm64: untag user pointers in ib_uverbs_(re)reg_mr()
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 06 May 2019 17:19:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=BvoYtYVsULamnYvbwO19c3h5oHA1gsMsAv5tZYbLYtI=;
 b=hn4rH9KTek8R37jjBWMcf/SnTi9wO6imyjbK43Qo3YFFy0w0QB9ppRC7K8TE7v3vlN
 nPLbzWoXhcOl9RZZTW0CT+GOCLOJRZHlTgH0IFE90/0mo3gA6Benvmv0xM9qlEM2L7iM
 a5/5EdryhXK5o1zmP38+JskPbuvRNi2KBDqgGoYwdgZckW/t0t3zXYlgA28tCgQWx38p
 zeMjQt/2TKtd8YWaOZqpDqkiV1tfPRGdf11R4Vmzgti01WpJ/ug4M22kRPfo4KNLvnrQ
 G8KQ2Dx3TZLoioP3vZYIMjrpzIYzmaefwwMqniR4qNzu+AscTWd9F/aHBCgCKh66bnIf
 LcNw==
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
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgppYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50
ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAplLmcuIG1seDRfZ2V0X3VtZW1fbXIoKSksIHdo
aWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KClVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gdGhlc2UgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92
YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3V2ZXJic19jbWQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyBiL2RyaXZl
cnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwppbmRleCAwNjJhODZjMDQxMjMuLjM2ZTdi
NTI1NzdkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5j
CisrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwpAQCAtNzA4LDYgKzcw
OCw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlZ19tcihzdHJ1Y3QgdXZlcmJzX2F0dHJfYnVu
ZGxlICphdHRycykKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJY21kLnN0YXJ0ID0gdW50
YWdnZWRfYWRkcihjbWQuc3RhcnQpOworCiAJaWYgKChjbWQuc3RhcnQgJiB+UEFHRV9NQVNLKSAh
PSAoY21kLmhjYV92YSAmIH5QQUdFX01BU0spKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNzkw
LDYgKzc5Miw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlcmVnX21yKHN0cnVjdCB1dmVyYnNf
YXR0cl9idW5kbGUgKmF0dHJzKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwljbWQuc3Rh
cnQgPSB1bnRhZ2dlZF9hZGRyKGNtZC5zdGFydCk7CisKIAlpZiAoY21kLmZsYWdzICYgfklCX01S
X1JFUkVHX1NVUFBPUlRFRCB8fCAhY21kLmZsYWdzKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAK
Mi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
