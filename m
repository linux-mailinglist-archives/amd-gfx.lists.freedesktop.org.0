Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BD1529C
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C582C89AE6;
	Mon,  6 May 2019 17:19:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577289A5E
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:41 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id a70so23281455ywe.21
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=djVJuNgpi4hl4AvZn47gmwsvHOuvfT3jzvA6F10IO5w=;
 b=cYyYpfI/8SKKmsjI+rA1SbZNXk7NrnPH5oH2U0qhO70LU7yadVJKPsHrEsRpmanWxF
 RrcoC66ow0ACqCpBXwmDk+H4x7b+TBirqugC79Wux7N3EXH+s7U9LS3fDb5nA46Gb97H
 ExnxFCf3+kl1mVkhwo6KNi9Q84pMcmsbYlPOCBmZyD6R+N8jcALlimXLtXGzzO/buREw
 iOZYrMVJS6FvxDcFIx9xeGHyD8Wr5PXxZrvaEOtYLT3iJlO0iWucaT43ulS5TFx+gS2O
 RkEqQwRnAFXzv7jBCeraST81kmdUZbZwM/FKq84wLAqDuQDurkjkGaGxcczpI65PEC2Q
 XjnQ==
X-Gm-Message-State: APjAAAU9V80hKaLJsDOj66Meyl8ks/Zzf1ceQ6xco9N6A3TpzDh0Tune
 NZ7wAFjD7mfNW8dR7z0pF5/wfzyePwRoYEYn
X-Google-Smtp-Source: APXvYqw1IXBcBTBvqlPhK0DepGTPQ34Nul5KO/wJ08CLzILZcvtlszbJT4QAmRZRcoo1MWPuYSMoe4MfIRPtaEwV
X-Received: by 2002:a0d:e60d:: with SMTP id p13mr8305580ywe.155.1557160301102; 
 Mon, 06 May 2019 09:31:41 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:57 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <84676a97cec129eb7a10559ceae2bec526160ad6.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 11/17] drm/amdgpu, arm64: untag user pointers
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
 bh=djVJuNgpi4hl4AvZn47gmwsvHOuvfT3jzvA6F10IO5w=;
 b=fxyQnlZpVUSYjQyqKRvVjTFbSpnAaN40vHoDyTt86Wr9XkiWv6H47O5fV6+YfqSjKb
 ya9LAHunO5tkq38NxGwIBHRUa8t3xRmbLIMp/Ei/Ay4bKwx0V2sP2cpbt1VZJxkDe/I+
 9QcnUwoNsbvRkE6TQ1eqETcSj1FHDhcRF+86nS+29Dm7yx2+fQzWUL/UiXGimZGBqjEk
 x92RLHdIO29i4yL8cPFFrUa5OfqGP4F8w4+T2ndS2TLCjkCTICe9DBa54uexWvxllQFG
 iUS8CZcMLYnxYz/mG/GVZOcto/nPYEof7WD9aPSyYBI6CjVI7kE5mMY0QntuPkboh2oc
 AONw==
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
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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
cmd1bWVudHMuCgpJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbmQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jL2luaXRfdXNlcl9wYWdlcygpCmFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0
aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQKYWRkcmVzcyBzaG91
bGQgYmUgdXNlZCBzbyB0aGF0IE1NVSBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNz
IGdldApjb3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodCBCTy4gVGhpcyBwYXRjaCB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluCmFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUg
R0VNIGNhc2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1fCmFsbG9jX21lbW9yeV9vZl9ncHUo
KSBmb3IgdGhlIEtGRCBjYXNlLiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IGFuCnVudGFnZ2Vk
IHBvaW50ZXIgaXMgcGFzc2VkIHRvIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoKSwgd2hp
Y2ggdXNlcwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEt1ZWhsaW5nLCBGZWxp
eCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxv
diA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYyAgICAgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDE5MjFkZWMzZGY3YS4uMjBjYWM0NGVkNDQ5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
CkBAIC0xMTIxLDcgKzExMjEsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1v
cnlfb2ZfZ3B1KAogCQlhbGxvY19mbGFncyA9IDA7CiAJCWlmICghb2Zmc2V0IHx8ICEqb2Zmc2V0
KQogCQkJcmV0dXJuIC1FSU5WQUw7Ci0JCXVzZXJfYWRkciA9ICpvZmZzZXQ7CisJCXVzZXJfYWRk
ciA9IHVudGFnZ2VkX2FkZHIoKm9mZnNldCk7CiAJfSBlbHNlIGlmIChmbGFncyAmIEFMTE9DX01F
TV9GTEFHU19ET09SQkVMTCkgewogCQlkb21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9HVFQ7CiAJ
CWFsbG9jX2RvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0NQVTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCBkMjFkZDJmMzY5ZGEuLjk4NWNiODJiMmFhNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAtMjg2LDYgKzI4Niw4IEBA
IGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAl1aW50MzJfdCBoYW5kbGU7CiAJaW50IHI7CiAKKwlhcmdzLT5hZGRyID0gdW50
YWdnZWRfYWRkcihhcmdzLT5hZGRyKTsKKwogCWlmIChvZmZzZXRfaW5fcGFnZShhcmdzLT5hZGRy
IHwgYXJncy0+c2l6ZSkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0tIAoyLjIxLjAuMTAyMC5nZjI4
MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
