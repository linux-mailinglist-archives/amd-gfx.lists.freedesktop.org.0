Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6EFA5A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E8B89208;
	Tue, 30 Apr 2019 13:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6464C891AB
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:55 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id x77so1449317vke.14
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/erHdYVyxDvhPu3v7RMhd3dO9bpNIdyHyuRFKthPw/o=;
 b=KupzscVhmqtYijiLisYd7KCVX8bhITANclAOW6r3XLPcyiavUfB6ZAkzPOU51LxH3b
 B8E1DIlJrrp5tBpGVXPxbXeOhFJ39r+Zizh0ZZWshUaTObGzAnknJFJ5RY0C0Cb7hNv7
 sqfPnnl2fMdjKrz1JURmzyDEZ5ueVToV1X9zXt04aATiNyj8a3MX6FvIgoWK9PxSgJWW
 bQXWYAHbp3qO7OKK/CN6BfG5SUMvXd+tpw2y5cFwLCQEzcQh6tfqqRvyFHa1vWNYjd0z
 eGNyeuO4pz+pmxN9M6Tjn9cAaL14hMIRpTWpEH2sYjQ3R7Gk+YrmIFJwo5mV8Wwnfdnz
 9X1g==
X-Gm-Message-State: APjAAAV1YrzvCEA18911eeKTf9EEJ3tN6Qu4grzf54u2N1GRa8qRiBd4
 +umBf+dc2k/zdiE+EDw/p1agtzr/KpNz4Ueo
X-Google-Smtp-Source: APXvYqz67px3tLUaZFP489IW2cHQSs+LvJjC7bfPcwFfPsiBelEm070ukqvUpFmAC3UEaQxQ+Sud/QNcvCPvUR/K
X-Received: by 2002:a67:82c8:: with SMTP id e191mr36596964vsd.24.1556630754448; 
 Tue, 30 Apr 2019 06:25:54 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:08 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <9a50ef07d927cbccd9620894bda825e551168c3d.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 12/17] drm/radeon, arm64: untag user pointers
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 30 Apr 2019 13:29:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=/erHdYVyxDvhPu3v7RMhd3dO9bpNIdyHyuRFKthPw/o=;
 b=eEiOGFetYWxih+SqIZFzGNfWcb2WG27fgr8umX6U99zGn9TVk7qoyvUJvyLbyO9646
 My6AFQXfx+E54pBbdCbbmUTy552nSiekbu8p+Z3EjOZkkRzKh6/KPKq2xMXR6PGCbeOC
 fF7Wnybo7p7oNGCxEtdGcC/SjUjb33krZmpxfplFBazN0BgfioX0FSzySTA4N97gTFrT
 W6ijBCliSwnkOOpdiWk5kSemwYixok6PKUQxZHW6VplcdEwGvrCZqCKdW+XjRywAL4b4
 tr3KgVn6nyJgYRcK+gwURasQznomoMLJd50NL8tFT/I0TUKbeATfwfeLLEXDX2wH0kWJ
 cXSQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpyYWRlb25fdHRtX3R0X3Bpbl91c2VycHRyKCkgdXNlcyBwcm92aWRlZCB1c2Vy
IHBvaW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVu
dGFnZ2VkIHBvaW50ZXJzLiBUaGlzIHBhdGNoCnVudGFncyB1c2VyIHBvaW50ZXJzIHdoZW4gdGhl
eSBhcmUgYmVpbmcgc2V0IGluCnJhZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoKS4KCkluIGFtZGdw
dV9nZW1fdXNlcnB0cl9pb2N0bCgpIGFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0aCBhICh0
YWdnZWQpCnVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQgYWRkcmVzcyBzaG91bGQgYmUg
dXNlZCBzbyB0aGF0IE1NVQpub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNzIGdldCBj
b3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodApCTy4gVGhpcyBwYXRjaCB1bnRhZ3Mg
dXNlciBwb2ludGVycyBpbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKS4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYyB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3R0bS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCmluZGV4IDQ0NjE3
ZGVjODE4My4uOTBlYjc4ZmI1ZWIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwpA
QCAtMjkxLDYgKzI5MSw4IEBAIGludCByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAl1aW50MzJfdCBoYW5kbGU7CiAJaW50IHI7CiAK
KwlhcmdzLT5hZGRyID0gdW50YWdnZWRfYWRkcihhcmdzLT5hZGRyKTsKKwogCWlmIChvZmZzZXRf
aW5fcGFnZShhcmdzLT5hZGRyIHwgYXJncy0+c2l6ZSkpCiAJCXJldHVybiAtRUlOVkFMOwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCmluZGV4IDk5MjBhNmZjMTFiZi4uZGNlNzIyYzQ5
NGMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtNzQyLDcgKzc0Miw3IEBA
IGludCByYWRlb25fdHRtX3R0X3NldF91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSwgdWludDY0
X3QgYWRkciwKIAlpZiAoZ3R0ID09IE5VTEwpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZ3R0LT51
c2VycHRyID0gYWRkcjsKKwlndHQtPnVzZXJwdHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOwogCWd0
dC0+dXNlcm1tID0gY3VycmVudC0+bW07CiAJZ3R0LT51c2VyZmxhZ3MgPSBmbGFnczsKIAlyZXR1
cm4gMDsKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
