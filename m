Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431E15298
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5621889ACC;
	Mon,  6 May 2019 17:19:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F7189A59
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:32 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id l20so12860845qtq.21
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9noxdAH/DJOJ2FYayyiyYQz8DnKHvszaUU/XpncZrgo=;
 b=EGSd1YBe2FFR+Qgh5UIydG+cQi2ASSvOXcIHppEIJAadMm6z5uwextiERJcehAfv7k
 ZQYKla0jliBqL7Ws7nOfYgs8uZfIF0DHjrtZsk3PdJBebuPcXFUSeIgR96uyJEcN365P
 MjbE6mCjg8W8G+/z6WevF0wIh6A5GMa+oEHonfQMulAUlYD50FRmGcEAv4V+JDBAwTdG
 6IDuU8QgWOmH2Pq+qZ6XL+ABsErynmfc0GWRJl4PCP8rlibJ1NdQxnC2BeYSzgR8EQuz
 ov23a5/edY7uf/r8S5jfpthU3qRdidDonyww2O3w62aA8iZDfGskxh1Peg4KvkwQSI2S
 UQFA==
X-Gm-Message-State: APjAAAXRjO0a/4o3EuBpup1OdEP1Xju6L21VzpfmL3gL2q2rA9IvXzMZ
 ORolk+ielF9y/TNUuwJKy1LBssc1tqTyxyKB
X-Google-Smtp-Source: APXvYqxoF+XMyoqlEFPsaust8CXG+VIOr8CluDz21rRB5hrxS5C2Phu1lQB5er/vngGdw0Qf3GTM8MJuymHjvFcO
X-Received: by 2002:ad4:540b:: with SMTP id f11mr5876305qvt.42.1557160291702; 
 Mon, 06 May 2019 09:31:31 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:54 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <b658f78360e65a7045e4f071b29f921885e72048.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 08/17] mm, arm64: untag user pointers in get_vaddr_frames
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
 bh=9noxdAH/DJOJ2FYayyiyYQz8DnKHvszaUU/XpncZrgo=;
 b=Gh9uHUEwhI8X3KH3oum4TP3+K5YcLVeFgNxy28sxooe9hD0KxqO+/9bu9ASe+gwO9m
 +npnzk9MzBx/G95AnHz8npJA2JLqfUYczohkOpf1cDAEGWB/X7jH7ATuoeQyoUMeyaJE
 M+s2UJpwoXBo6kJQ8MvPZRd/OM9IAl3ZUMX+L/PvePvsqcjFIcb/KoU1n2dvqK/g4dyS
 WX9LAM4MfJzSphXX3HTjOHZ2WfucwXBSdBhXaGaeltxjREoqu7g25XXVhrt4uPYNQRup
 Pi925C63hraEJZZpZwP5S6UZPdegfoPkW1yuXxVcy9QEkU3hg9EUu8QmKcerWhcvmd7i
 pz0w==
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
aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
