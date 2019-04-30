Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953BFA65
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1662889232;
	Tue, 30 Apr 2019 13:29:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2D891D4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:21 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id o17so12745794ywd.22
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Yt+PWI13/w7NMYz3zwPrNGqq+ReXtpTWddPqmKmBKgk=;
 b=SiYNgLhNKFdzH7LpClzl3IxVJA4QdhAh6UQUe0OvZdlfKZsUS+rLJD3yw3VIljSw3M
 JPRvLw7rGIHOTeEJlwY5gUrmK1978OceZp83PvuP/Rcz1sZNg2hvgXrceukObrP1MxGl
 /5nevnRCLLyNs7TPaUJdmSFBI+Tg0TmA9NMWJKDyMTBgaVUyMC/ceNXWZRQnBj0tBkyG
 BevplUFvgQT4VYJjt+7sXYYJ7iRIapleFs2GD4BloaEZt3/F/HQukScgCQBGZ3gfccdd
 lP9jYLCOAshyNMdumn+UmBPc/qHvX4P1o0Ha+7H3R9GqB/PJcGHbMEDMN9Tmg9F0rpfi
 2OEw==
X-Gm-Message-State: APjAAAV0fCmGlk2Ga6mcuvb116zjHrGM2Yi0y/CvCdKCBJJOgo1d4qZk
 hsz+jBM9Y5uIBEsQtlIq7awPKH0h/BSQqksX
X-Google-Smtp-Source: APXvYqzn+VCXcz3/MPYUKI1STEW4oOzSku7o6dMmFF+1zuaxsiuVuMrbdGrvK+1IRDapYK9+TGfb+TbRJGhClYr2
X-Received: by 2002:a81:3d51:: with SMTP id k78mr56599045ywa.106.1556630720203; 
 Tue, 30 Apr 2019 06:25:20 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:24:57 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <c66c15554ff43b09aa97595907d4231be3fb7b31.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 01/17] uaccess: add untagged_addr definition for other
 arches
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
 bh=Yt+PWI13/w7NMYz3zwPrNGqq+ReXtpTWddPqmKmBKgk=;
 b=jG67MQO6uSTq+PQJ7NLS3u3pGPqYxBD6j6Z7zSYau7uP7jvgt3bFEq3faUxv1qOiIb
 Lhjg89Y6A0R/eNow3E4oC26RwU4x5nya0AVoMdWDIBSbYBBhFLCViwOATovkHqYFgw83
 hOVUMM4j6unbJMoC5S4qfPmdZGJuwasxoQN5pLBzNoODYCmMWIdN+DK/0OhTFTFrX99t
 6EDwehqEld5biejrj0QAkLSZAfR6m8nobezuReC4ugk/eXbqiTH4l+ivloQAzM7wUwIe
 NZAar432hbtNkfGtL2tuOjYFn681Ww9UC8SmNz4UpJpUm1tSs7E6peMLsrX4yxW2SbA8
 caHA==
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

VG8gYWxsb3cgYXJtNjQgc3lzY2FsbHMgdG8gYWNjZXB0IHRhZ2dlZCBwb2ludGVycyBmcm9tIHVz
ZXJzcGFjZSwgd2UgbXVzdAp1bnRhZyB0aGVtIHdoZW4gdGhleSBhcmUgcGFzc2VkIHRvIHRoZSBr
ZXJuZWwuIFNpbmNlIHVudGFnZ2luZyBpcyBkb25lIGluCmdlbmVyaWMgcGFydHMgb2YgdGhlIGtl
cm5lbCwgdGhlIHVudGFnZ2VkX2FkZHIgbWFjcm8gbmVlZHMgdG8gYmUgZGVmaW5lZApmb3IgYWxs
IGFyY2hpdGVjdHVyZXMuCgpEZWZpbmUgaXQgYXMgYSBub29wIGZvciBhcmNoaXRlY3R1cmVzIG90
aGVyIHRoYW4gYXJtNjQuCgpBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2lu
Y2x1ZGUvbGludXgvbW0uaAppbmRleCA2YjEwYzIxNjMwZjUuLjQ0MDQxZGY4MDRhNiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtOTks
NiArOTksMTAgQEAgZXh0ZXJuIGludCBtbWFwX3JuZF9jb21wYXRfYml0cyBfX3JlYWRfbW9zdGx5
OwogI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgog
CisjaWZuZGVmIHVudGFnZ2VkX2FkZHIKKyNkZWZpbmUgdW50YWdnZWRfYWRkcihhZGRyKSAoYWRk
cikKKyNlbmRpZgorCiAjaWZuZGVmIF9fcGFfc3ltYm9sCiAjZGVmaW5lIF9fcGFfc3ltYm9sKHgp
ICBfX3BhKFJFTE9DX0hJREUoKHVuc2lnbmVkIGxvbmcpKHgpLCAwKSkKICNlbmRpZgotLSAKMi4y
MS4wLjU5My5nNTExZWMzNDVlMTgtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
