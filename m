Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C255BFA63
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0D58921B;
	Tue, 30 Apr 2019 13:29:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42FF891AB
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:39 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id d39so8570431qtc.15
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=buRPOjJBA3ZIe0xT2AqduI9dnmEg9opX2ORFfRDPnW0=;
 b=J6qY0FjqJba2VtSK8dC60TW9ardLeRC9Xb/0mNtyC/HXAsZpLD4L28dN28PYrOw/qa
 YW+jwJXE9xvbuve89xJCyTRjtanuZWKVnHfh5n9lIKw5+UN3elAx+zSaGz1kFAechcct
 e1UjTlrRlIsYQSHXhKAPLFa8X0BGUsn217+tj658pjxF8Lw7L6Xx/TzwMZ4qImS+MMCN
 ipe8gRB9IxWOPV/iPuhGRkWPaUP4eIW39K4gsglc3Y1hO+NSKtBv9ZNcT37yFDApzfV9
 ucOFgb3UeSzjVraX2hzc6yrJQDSNuhiI1+uHuYEZBLfpMMb9iqA6U6thfWX1rqCYSeEi
 p9pg==
X-Gm-Message-State: APjAAAW1XOn0kGlMN6nqIDhoQIz/jDfpwqGrYS8KFeTo5sgioOh/3jUN
 KLo6dC3cnNcSsPnkK1FqwUnBssJDYbfO9hFJ
X-Google-Smtp-Source: APXvYqzAjOcf9MQ3Z/Pp48cxI+z95y8oMsVd6n1et+BqzlTkjxro8PcOOzrVkSjDVN6zaY8gkVAdj4JwROetfHnZ
X-Received: by 2002:a37:78f:: with SMTP id 137mr13240464qkh.66.1556630738975; 
 Tue, 30 Apr 2019 06:25:38 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:03 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <373d33e4cb0087da32ad019fd212414292ce04c8.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 07/17] mm, arm64: untag user pointers in mm/gup.c
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
 bh=buRPOjJBA3ZIe0xT2AqduI9dnmEg9opX2ORFfRDPnW0=;
 b=MSiPsDRD20G5RApt1tKO2qR1lu+49IUxbNva1JnuQQuFWBLmYjGsyYMIbTfczh9PgZ
 LZDjXLLUSTuHLQNcWT+JZ9uqhm42MotSkIywGhSEtO5Qo/efiUjRdnETJ9HiPnIEMC0G
 Psfny8eMA3Hhr5M3y/dGxBagnarVCzNzCOPBE7unSjVZRyN7RZGPxN+EiQrIg6TYKayd
 TbH8puePOyzHgUDHu0r16X0QIZiy8sIilI5NkVuEFwagLhwm1Doy6sj5Nc20vSi1QEC6
 U4ZuKp24KxWFzfXdfPQJckkIwH9zeR4BqyMjbNu7gnM8XYqQKJF/hqcaAUToZRnS5F/8
 +rFw==
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
dWx0X2ZsYWdzIHw9IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlk7CiAKLS0gCjIuMjEuMC41OTMuZzUx
MWVjMzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
