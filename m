Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCB50E84
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F1689B99;
	Mon, 24 Jun 2019 14:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90D89B69
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:24 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id i6so3947295vsp.15
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6wOlIN9RCqtC4EMjbsO9NIyMZhz6XW377zGYJAhhjSw=;
 b=SeEHH1YtHdzY2j2X9eOfj2D2IaY9WFap9p8WfNrko6XWlJixGA8xYpY/KwtvAIvMVt
 /X+DEA/QK78M8V380V2F26z6M2W54w5gGzMlXSWEktfqkIGyHvP5zLpM2G3GHSwa9GSk
 4wQCu1rGdnBe0md52N/WKatLh/b+fnYWplXJM2WSLTcXgFs7vOTKNW7hjjz7xox61sZU
 AlEsAqd7eUZWnUVXrxdQ1LV4nm2Hm5nR6e9ni+ACyoKas2D+RF7DMAktRt6K4H3nTLXh
 axuHDxSUGCfPZa9eI7v+jTAdnKZp/VC34gMLWLOKZeTZHjETcToV0O5dXXw+i/BhL5Sg
 LYyw==
X-Gm-Message-State: APjAAAW5CgHSAjwgP3knelnqlecqUxo5MivrsE6PzcedH8pjLsGv0XqF
 Qiz92N1Q8qGula/s+Hm75c3wWTxzqyivFNP6
X-Google-Smtp-Source: APXvYqypfx2HThdGezp/oUedjYKv44Fb8n5lNK45oyS/vOtxc58Rwt4c9Y+yK17e0xs6J7fV+AYN9l/kG2KmENab
X-Received: by 2002:ab0:5c8:: with SMTP id e66mr54849002uae.10.1561386803022; 
 Mon, 24 Jun 2019 07:33:23 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:51 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <cf7bc20a86d45f690c211ebf284e9ecdaf6d4869.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 06/15] mm: untag user pointers in get_vaddr_frames
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:36:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=6wOlIN9RCqtC4EMjbsO9NIyMZhz6XW377zGYJAhhjSw=;
 b=EdyxEJFnWG9rQS7GXNgeJyNTxEu5LtqPTYYbN/QLe+5zlbDexboGyDqBC815Hrokjj
 qfAzqSeaTKPFvVv9WWYIndqnAPiRljjB3TIDjGP/0IMssQbdVP4BzrpsfzCXDKI9BDHt
 WeSswvJDxczfbCTt3IQqYPH1jX0VOQ5O+GZOEn825FLst0HqKs8RjnFS0DrDqqOlKlcm
 +N5mzxkUilj5uw0wDqYjDhK1/db8t8dLQzbwnNuEhal4y8tjJfxP9svgAu0LB4ORTyVD
 OZMU426HgS0vYo8hjqCwVk8ERda/jHZQ5JXLr2v38JKqFFajbtzb+/rl5BB+KXJN5rjD
 80IA==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1h
IGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4g
SW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhpcyBmdW5j
dGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXog
PGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8
dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgotLS0KIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIvbW0vZnJh
bWVfdmVjdG9yLmMKaW5kZXggYzY0ZGNhNmUyN2MyLi5jNDMxY2E4MWRhZDUgMTAwNjQ0Ci0tLSBh
L21tL2ZyYW1lX3ZlY3Rvci5jCisrKyBiL21tL2ZyYW1lX3ZlY3Rvci5jCkBAIC00Niw2ICs0Niw4
IEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGlu
dCBucl9mcmFtZXMsCiAJaWYgKFdBUk5fT05fT05DRShucl9mcmFtZXMgPiB2ZWMtPm5yX2FsbG9j
YXRlZCkpCiAJCW5yX2ZyYW1lcyA9IHZlYy0+bnJfYWxsb2NhdGVkOwogCisJc3RhcnQgPSB1bnRh
Z2dlZF9hZGRyKHN0YXJ0KTsKKwogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAlsb2NrZWQg
PSAxOwogCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbihtbSwgc3RhcnQsIHN0YXJ0ICsgMSk7
Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
