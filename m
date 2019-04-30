Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78399FA5E
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D478920C;
	Tue, 30 Apr 2019 13:29:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2F891E2
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:43 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id p129so6331444vkd.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4c/fu3qC3Skvw+ZZk7UHJQzalE9hfnOxHloiMgOUfYw=;
 b=Q1dF/aAZFoiLxaL9dsUSsfXGDxl5dmEEypSDWvxHj/2gqehcivekje1sdKKq9+fiee
 PCkRT5PX6aDzk3c1k71o1tt4CQHSSBcA6Dus1QnITwO3S1RHUDa4Aa96qLSoot0if27U
 spUU9HUCMj2HLmu8OMY26B1BsGOFzKcvgc4pthsSazd+0f0ViRWta67PvBFEiK7UeHMd
 lwDmtkKrAyG7h67mysDks9VjztpzLSgJlS6nQIP8luDpnFXjhQpgpJQim4GuegMzHCwx
 WSPdhaTQiSX+UwM0aALnvZ7NDCIylu0Hfw/KCmpitRmQ5IWVt2t4n85b8Z/kTaa0nBG2
 UE7Q==
X-Gm-Message-State: APjAAAW2FhtKDEcyrDlGF8UgW7JYJecg7AvVQFoyXCCZ+O8XZXzvfHrx
 puvhS5l8vZl1ItNOWBWQwTRgzdCzPhWLiqZ9
X-Google-Smtp-Source: APXvYqx4TL4lB6fuuHN3vQZgSBJDs10/R98gvbNQDm51wxIVMnZyNgUuaizbdtdyYw1MeWbTLc+s/luHbNJTgZgZ
X-Received: by 2002:a67:8155:: with SMTP id c82mr6290812vsd.200.1556630742131; 
 Tue, 30 Apr 2019 06:25:42 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:04 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 08/17] mm, arm64: untag user pointers in get_vaddr_frames
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
 bh=4c/fu3qC3Skvw+ZZk7UHJQzalE9hfnOxHloiMgOUfYw=;
 b=wBxzW9uz5sqQEs2k0kS4yhvkUsLQPUol5yYuscC/EhJQq88IJKN51oJN9Ma9N+F87j
 0yaXqLxOKrSBWEzg6TAlDuogkZNA4XMbprAL12kWJ8MdNH7JIvTO8ZRXCqw/W9rKaVTK
 0th2TjbWtiytISvyVjLE74X1hS0zo7K7eSu+m53APk0oWFg+5hHivN//aHp583NOkYkp
 q/Xzdqo7lpDQuozd8M9soPmozGOH2C019sBJyK9gvXzEw1QU7pl845OD9URqwv3Lf0aM
 RmLDFBkc4rSunB/Q4UnHBTaxv0r2wOX1jQXVnW4MBVL+0daNYML4EK5a4hKos8NfLzsy
 dlFw==
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
cmd1bWVudHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBm
b3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2lu
dGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhp
cyBmdW5jdGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbW0vZnJhbWVfdmVjdG9y
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bW0vZnJhbWVfdmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCBjNjRkY2E2ZTI3YzIu
LmM0MzFjYTgxZGFkNSAxMDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKKysrIGIvbW0vZnJh
bWVfdmVjdG9yLmMKQEAgLTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAlpZiAoV0FSTl9PTl9PTkNF
KG5yX2ZyYW1lcyA+IHZlYy0+bnJfYWxsb2NhdGVkKSkKIAkJbnJfZnJhbWVzID0gdmVjLT5ucl9h
bGxvY2F0ZWQ7CiAKKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOworCiAJZG93bl9yZWFk
KCZtbS0+bW1hcF9zZW0pOwogCWxvY2tlZCA9IDE7CiAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0
aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4LWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
