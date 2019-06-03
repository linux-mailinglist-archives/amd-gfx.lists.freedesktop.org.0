Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8133E4A
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B43D8945A;
	Tue,  4 Jun 2019 05:23:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE3889007
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:43 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id b7so1003624qkk.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8pgHCk5wEiyaTFCxwJKfncM1f+2WF9g+TqLFqNfWufQ=;
 b=BJQaMbcXSBt8YGRh4Xs9L8Qf8vQgqTVpBkZO6rY8RUKZVHB8yIWA4vjSDHmr4PJTCF
 wMBQG8GoAu80Tr87OjG+aGB3ADbrnDYWu4+YslcDiS/mEC1mtM0zvpJCYUUTaSZbkfRK
 HYuqHW/U5E5Um/J94zhAxmFOHbNDoXZPZcCcf1wcsEjX7xI9frQDeihiALinnV/zCOP7
 saJAnQ/Rpaiwul+AjmxaU1unMRYWPoJ2LQp7sfUi4+xrU2CVH+7J5rxLIsapJiW+0Cyl
 sh2RTUPoSY1pKUFF2mE2Nqb+Fb0CQ+c2dtJkbMx++kbiShbYKtlNgPTn1witKRpIzEIj
 mqug==
X-Gm-Message-State: APjAAAX7iqXgINmG3Q+zxayDfL3MJJEBVxKLpq3piJ4LWEKWzc+T/k80
 wXt1uAzqdJIovmkhYddLoveNLX2BklRgQzZ7
X-Google-Smtp-Source: APXvYqyNatgo8rHVRn4VlhemarHIUF3AdcvyBy1EVpeL8RHKUhqmEsOqMc7TMbe6ArCDJ95BM6gVWf7qKnPTt9YN
X-Received: by 2002:a0c:9233:: with SMTP id a48mr6236042qva.66.1559580942841; 
 Mon, 03 Jun 2019 09:55:42 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:08 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <e1f6d268135f683fd70c2af27e75f694d7ffaf48.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 06/16] mm, arm64: untag user pointers in mm/gup.c
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
 bh=8pgHCk5wEiyaTFCxwJKfncM1f+2WF9g+TqLFqNfWufQ=;
 b=eM3yvxS7rzZ2nnFYrRtwMpVwIimBA7OeBVGUKG05qqQOYpi+Zis4iOHoCqOn+3sjDh
 2SabES8eFCAsnon36EZg8qxjmj+CW/08eSPui+O8M8q9qj9EihXzk/kg7mFnv1ofmO2L
 6gdrPpvdTVeWEXirSohkSFcGd3CTquZjzaE1d3uIrVhOjCiqBdkigRuAKI8/ID1Mi6ud
 zk8tRRsd3G4px7QGEmRqWs1oq4KZBZQ84TPIW2/PRqcP/P9TeozrBt0HPw3seUNx6jqU
 wgzokqzg3Z9TB08A/q6k7ggwnJy6GtgW83uc4Qh4qCVWwdITo0WCqdd0x9WCtndSuvUL
 /u8A==
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
cmd1bWVudHMuCgptbS9ndXAuYyBwcm92aWRlcyBhIGtlcm5lbCBpbnRlcmZhY2UgdGhhdCBhY2Nl
cHRzIHVzZXIgYWRkcmVzc2VzIGFuZAptYW5pcHVsYXRlcyB1c2VyIHBhZ2VzIGRpcmVjdGx5IChm
b3IgZXhhbXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1c2VkCmJ5IHRoZSBmdXRleCBzeXNj
YWxsKS4gU2luY2UgYSB1c2VyIGNhbiBwcm92aWRlZCB0YWdnZWQgYWRkcmVzc2VzLCB3ZSBuZWVk
CnRvIGhhbmRsZSB0aGlzIGNhc2UuCgpBZGQgdW50YWdnaW5nIHRvIGd1cC5jIGZ1bmN0aW9ucyB0
aGF0IHVzZSB1c2VyIGFkZHJlc3NlcyBmb3Igdm1hIGxvb2t1cHMuCgpSZXZpZXdlZC1ieTogQ2F0
YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIG1tL2d1cC5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vZ3Vw
LmMgYi9tbS9ndXAuYwppbmRleCBkZGRlMDk3Y2Y5ZTQuLmMzN2RmM2Q0NTVhMiAxMDA2NDQKLS0t
IGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTgwMiw2ICs4MDIsOCBAQCBzdGF0aWMgbG9u
ZyBfX2dldF91c2VyX3BhZ2VzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwKIAlpZiAoIW5yX3BhZ2VzKQogCQlyZXR1cm4gMDsKIAorCXN0YXJ0ID0gdW50YWdn
ZWRfYWRkcihzdGFydCk7CisKIAlWTV9CVUdfT04oISFwYWdlcyAhPSAhIShndXBfZmxhZ3MgJiBG
T0xMX0dFVCkpOwogCiAJLyoKQEAgLTk2NCw2ICs5NjYsOCBAQCBpbnQgZml4dXBfdXNlcl9mYXVs
dChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJdm1fZmF1bHRfdCByZXQsIG1ham9yID0gMDsKIAorCWFk
ZHJlc3MgPSB1bnRhZ2dlZF9hZGRyKGFkZHJlc3MpOworCiAJaWYgKHVubG9ja2VkKQogCQlmYXVs
dF9mbGFncyB8PSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZOwogCi0tIAoyLjIyLjAucmMxLjMxMS5n
NWQ3NTczYTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
