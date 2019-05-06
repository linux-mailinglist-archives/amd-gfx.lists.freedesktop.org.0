Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773215296
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C277E89AC2;
	Mon,  6 May 2019 17:19:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FEF89AB6
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:29 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id x23so15017182qka.19
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TZHV8An4OEXfkqFgrZuDjdlNeU7w3PdkPz1ZU4+cbAs=;
 b=r61KyrXzhGf25GOjnN64h+P2juWUYw20QoEpmNlLV/PIZ2/UHqvtWHvw+JLWvilLSh
 /NcUBHQ62TNa+ufvpnJqovhFTXkC2qz4CdSob0mMgFbOzEyytnvOwFYfI16e9Xmku3lA
 987YdLW5nPOfn37AP4SiChu3o1oPFC15+0hEpEjAJQjy5+FIQczEELZvAClS83SzNupE
 Tp21bGpADCtGUCjNUPwgsHqoLGqkcpaXicDgafOcVihR+irvMGXTSE4zHBpPp5Rjby2E
 Wpi1zokwTDhMLgEctzpjf3jkASQfhCRTM8Tdjae5y6ZoGkd0PeG/3FbyI9ILVUWVAVJT
 pjrA==
X-Gm-Message-State: APjAAAXxMk7TeJRa7eLGnqbgpGrWMagRtL2xFjygv14no/ZuD96UARBF
 kHvvO9adDbhInZ7YpEEpnZN7XHS0e3GCzv6O
X-Google-Smtp-Source: APXvYqzHIfoRqtGD9gbf6U+p/ZZcVtiOU3rLeCD3rrtZumSW95xfAvgD6n9pasKaBp9DQWdRwfRV+d2riHaf6boR
X-Received: by 2002:a0c:d449:: with SMTP id r9mr16625749qvh.223.1557160288557; 
 Mon, 06 May 2019 09:31:28 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:53 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <d234cd71774f35229bdfc0a793c34d6712b73093.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 07/17] mm, arm64: untag user pointers in mm/gup.c
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
 bh=TZHV8An4OEXfkqFgrZuDjdlNeU7w3PdkPz1ZU4+cbAs=;
 b=lVlAxmmY4nFExOi7qcKMHLUyvk1dgMtcIDWsIxNnuOIKi7SENIWoorvqYx22FhFeiH
 qNv3aCOvVP2Cd8JsXC4f5fwupU4T2PFYzqayLiNCFI9HFlqX4lWPhufSiUZxYZlKJbSP
 xpayFPpaQpM+egkX1gh0HyRA3qPTTcL2EH50qtn8LLi1pPJilWqtH0/kYJiIyAq+8b8K
 r7XbnjhrPxJ/+aU0+7xAQJYRuQVqDAYCQIetrAi8pdeAX3hMSEX83RJtSz7KeAzNa4AL
 TEi4LWr1V919AH8PPG3nTQ8k7FsrBwYY7/UQoSLOaq/gIbNGSmHdWR4W58sdfzeJRSfR
 CtWg==
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
cmd1bWVudHMuCgptbS9ndXAuYyBwcm92aWRlcyBhIGtlcm5lbCBpbnRlcmZhY2UgdGhhdCBhY2Nl
cHRzIHVzZXIgYWRkcmVzc2VzIGFuZAptYW5pcHVsYXRlcyB1c2VyIHBhZ2VzIGRpcmVjdGx5IChm
b3IgZXhhbXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1c2VkCmJ5IHRoZSBmdXRleCBzeXNj
YWxsKS4gU2luY2UgYSB1c2VyIGNhbiBwcm92aWRlZCB0YWdnZWQgYWRkcmVzc2VzLCB3ZSBuZWVk
CnRvIGhhbmRsZSB0aGlzIGNhc2UuCgpBZGQgdW50YWdnaW5nIHRvIGd1cC5jIGZ1bmN0aW9ucyB0
aGF0IHVzZSB1c2VyIGFkZHJlc3NlcyBmb3Igdm1hIGxvb2t1cHMuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbW0vZ3VwLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tbS9n
dXAuYyBiL21tL2d1cC5jCmluZGV4IDkxODE5YjhhZDljYy4uMmY0NzdhMGE3MTgwIDEwMDY0NAot
LS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtNjk2LDYgKzY5Niw4IEBAIHN0YXRpYyBs
b25nIF9fZ2V0X3VzZXJfcGFnZXMoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLAogCWlmICghbnJfcGFnZXMpCiAJCXJldHVybiAwOwogCisJc3RhcnQgPSB1bnRh
Z2dlZF9hZGRyKHN0YXJ0KTsKKwogCVZNX0JVR19PTighIXBhZ2VzICE9ICEhKGd1cF9mbGFncyAm
IEZPTExfR0VUKSk7CiAKIAkvKgpAQCAtODU4LDYgKzg2MCw4IEBAIGludCBmaXh1cF91c2VyX2Zh
dWx0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAl2bV9mYXVsdF90IHJldCwgbWFqb3IgPSAwOwogCisJ
YWRkcmVzcyA9IHVudGFnZ2VkX2FkZHIoYWRkcmVzcyk7CisKIAlpZiAodW5sb2NrZWQpCiAJCWZh
dWx0X2ZsYWdzIHw9IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlk7CiAKLS0gCjIuMjEuMC4xMDIwLmdm
MjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
