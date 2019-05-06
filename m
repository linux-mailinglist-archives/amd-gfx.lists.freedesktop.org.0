Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D215290
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AEC89A9B;
	Mon,  6 May 2019 17:19:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221D89A5E
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:17 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id k134so4198154ywe.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=x8HMVSO2lCP9thpVq0jteC8wa+ruR/qG5sfvMEzcSf4=;
 b=k+n5RM9Nc+UUSViCCix93rlME2fyOhaneEAqnD3fncm/Jmjydu+MsPWX50uSYJ3jbj
 m7pp6RNxkUo129tkG5hDAiO/TS/3swLBzWS1Pr45BlkC3nA9Qi8cVLpIejF3r6GP1F6P
 hLy4xE6jnF22ozr9F35/87YoG8MZCswiqct9vBpJogBiRPcvA4T2yUhWtRLzpjlG445c
 6/zHGkmVj/7t7SKsD4y3HqwFymEK05W1jpmnk2LpruNeg/4YItmwv2U4r+F7EI2Fyxfx
 6rsyjGc4743kdwknrssVXWJDrymHxMBv4RDn0JGOxjGFV8fAoH9DqSuVwvHCEQDEk85S
 AQUA==
X-Gm-Message-State: APjAAAW2JqU8KMnvaFx2nneRWM+kTnwpiLBY0PSQPeVz2ucMMcO3Fmg9
 RyjF65if9mplanFnK9+bZv9zZ79JXX9ZT+qe
X-Google-Smtp-Source: APXvYqyZq8rlWFW4uBLN8C8I3oEaQAU5CNW3HReq+6c5opQ9wp/VGDDqgMMeEo6tOAWNlA3+Gfl3rFVlDcMv6bDq
X-Received: by 2002:a5b:8c2:: with SMTP id w2mr16278460ybq.201.1557160276487; 
 Mon, 06 May 2019 09:31:16 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:49 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 03/17] lib, arm64: untag user pointers in strn*_user
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
 bh=x8HMVSO2lCP9thpVq0jteC8wa+ruR/qG5sfvMEzcSf4=;
 b=e90YIYJEqCjuv0dQNXe7JfByZ3LYw/uoix1gLG6qHxakrZEGoit4yh6fTDsfYia+jH
 wb7igUzrFQvpjJl955zqS3eb64AMNM806CURkcixGS6z1rzCJzMGBiAz82rRhlhjgKjR
 9cdDyeo/3JMugM0eGAxc56H2X/rF/Gu5NZJ6OlTvycYfBxRjWeovYDz5GGyc2/popU6X
 Q4rJTvbhNlqr5zqGtmKCjWUttV6dsKWcbk2qBw0aV1In8VLH8mRF5MiPk8iCO4KWMnPF
 BSI3N1BBXtSHWlnz3+Iji+1TK5JldUspg0pnnlvUCK4PaDa6c2GsK9cElOVCY5yx3kNx
 bcTw==
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
cmd1bWVudHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2Vy
IGFkZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMg
cGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFs
aWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1l
bW9yeSBhY2Nlc3Nlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4KLS0tCiBsaWIvc3RybmNweV9mcm9tX3VzZXIuYyB8IDMgKystCiBsaWIv
c3Rybmxlbl91c2VyLmMgICAgICB8IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvc3RybmNweV9mcm9tX3VzZXIu
YyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCmluZGV4IDU4ZWFjZDQxNTI2Yy4uNjIwOWJiOTUw
N2M3IDEwMDY0NAotLS0gYS9saWIvc3RybmNweV9mcm9tX3VzZXIuYworKysgYi9saWIvc3RybmNw
eV9mcm9tX3VzZXIuYwpAQCAtNiw2ICs2LDcgQEAKICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+
CiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KKyNp
bmNsdWRlIDxsaW51eC9tbS5oPgogCiAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgogI2luY2x1
ZGUgPGFzbS93b3JkLWF0LWEtdGltZS5oPgpAQCAtMTA3LDcgKzEwOCw3IEBAIGxvbmcgc3RybmNw
eV9mcm9tX3VzZXIoY2hhciAqZHN0LCBjb25zdCBjaGFyIF9fdXNlciAqc3JjLCBsb25nIGNvdW50
KQogCQlyZXR1cm4gMDsKIAogCW1heF9hZGRyID0gdXNlcl9hZGRyX21heCgpOwotCXNyY19hZGRy
ID0gKHVuc2lnbmVkIGxvbmcpc3JjOworCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcpdW50YWdn
ZWRfYWRkcihzcmMpOwogCWlmIChsaWtlbHkoc3JjX2FkZHIgPCBtYXhfYWRkcikpIHsKIAkJdW5z
aWduZWQgbG9uZyBtYXggPSBtYXhfYWRkciAtIHNyY19hZGRyOwogCQlsb25nIHJldHZhbDsKZGlm
ZiAtLWdpdCBhL2xpYi9zdHJubGVuX3VzZXIuYyBiL2xpYi9zdHJubGVuX3VzZXIuYwppbmRleCAx
YzFhMWIwZTM4YTUuLjhjYTNkMmFjMzJlYyAxMDA2NDQKLS0tIGEvbGliL3N0cm5sZW5fdXNlci5j
CisrKyBiL2xpYi9zdHJubGVuX3VzZXIuYwpAQCAtMiw2ICsyLDcgQEAKICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC91
YWNjZXNzLmg+CisjaW5jbHVkZSA8bGludXgvbW0uaD4KIAogI2luY2x1ZGUgPGFzbS93b3JkLWF0
LWEtdGltZS5oPgogCkBAIC0xMDksNyArMTEwLDcgQEAgbG9uZyBzdHJubGVuX3VzZXIoY29uc3Qg
Y2hhciBfX3VzZXIgKnN0ciwgbG9uZyBjb3VudCkKIAkJcmV0dXJuIDA7CiAKIAltYXhfYWRkciA9
IHVzZXJfYWRkcl9tYXgoKTsKLQlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXN0cjsKKwlzcmNf
YWRkciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3RyKTsKIAlpZiAobGlrZWx5KHNy
Y19hZGRyIDwgbWF4X2FkZHIpKSB7CiAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIgLSBz
cmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7Ci0tIAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
