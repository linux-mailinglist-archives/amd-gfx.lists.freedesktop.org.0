Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A231FA62
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0B189218;
	Tue, 30 Apr 2019 13:29:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326A2891AB
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:49 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id p43so13451017qtf.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pQaENO1QgY/e9MwQ0ENVfJipTlkpkaPmrD1twTVYLJ0=;
 b=q8skXU8eSDDI5kLWcROwQH+iV6so9m114ZtEK8uMYTonEvfQ7ZKM8r1F6gMVE+P/ww
 5Yp17bWausdvPTLIJihyI4B6peo023CwFI/Bi2IWJve6X4LlrOo+cUMxmHOLvSrHYTwn
 AX2JeCJjfxg2Og9aQZ4WL6mTGlgYGjFR3+CFMY9j4/tLdYOOfF4tg+pRdhn52t5ug1nF
 M29Dg8XYuaIjw0tNbzaZnDz7XF241TR1Hrnxni9mjMaLpcaVHbJh9XJ7IWWwZtnFouqN
 AahQLOiQ3zUyzsENdWkwphtCJ+ah11KH5XpsJ4ERXG4Qc/lqpWCKb52ZLjpuNHGivXA8
 KRtw==
X-Gm-Message-State: APjAAAXkbmCBCzeQgyuElJ2Gwy4qJXkYVSaVXENp52RIVwZK4ed80C7M
 TlMbvkzEJOzRBM7BuBKNgN+9BGAByjTFsjho
X-Google-Smtp-Source: APXvYqzXVakUsCoJZt28GHuUY2fVSxrYrmmdkh7uTay5rLBg9HnfxGjKEfUnDj0v5eIkWQX2umWuPHIlib2dmYL6
X-Received: by 2002:aed:2a0c:: with SMTP id c12mr9957100qtd.232.1556630748252; 
 Tue, 30 Apr 2019 06:25:48 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:06 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <7d3b28689d47c0fa1b80628f248dbf78548da25f.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 10/17] fs, arm64: untag user pointers in fs/userfaultfd.c
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
 bh=pQaENO1QgY/e9MwQ0ENVfJipTlkpkaPmrD1twTVYLJ0=;
 b=DQlymDAakXGN/s4aLv8FvnKDxFM3vFWe0ntwkbEht00uRZJyqzxLv2z+v+0YWcHIgB
 sKEjfbgI8NGPishfLFVkzFtit1j8To4k9tOzAqlClb7eaOmN2puCzEFRoWDOow3x6abM
 kF5rtq7WeiaNC1bvr93O8cSv4wiLQYr7p1i1gibkW3E+uyrFOpeeQawgxMfeq7+k8NA+
 lhqPJjcIYupZYzc0GZblGzb4ejeI2t/6j/U8CyZxFUtArO4WewVdwtuEJHeP7D/0QDFm
 3J0WxXCQ6Yi/AJW67UTm3sBwIOkc0wcf7BPZUgJdkZ1LyiC4qY/JaOc6zgNq+gGsc78b
 WDtw==
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
cmd1bWVudHMuCgp1c2VyZmF1bHRmZF9yZWdpc3RlcigpIGFuZCB1c2VyZmF1bHRmZF91bnJlZ2lz
dGVyKCkgdXNlIHByb3ZpZGVkIHVzZXIKcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBj
YW4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQgcG9pbnRlcnMuCgpVbnRhZyB1c2VyIHBvaW50
ZXJzIGluIHRoZXNlIGZ1bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3Yg
PGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBmcy91c2VyZmF1bHRmZC5jIHwgNSArKysrKwog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3VzZXJmYXVs
dGZkLmMgYi9mcy91c2VyZmF1bHRmZC5jCmluZGV4IGY1ZGUxZTcyNjM1Ni4uZmRlZTBkYjBlODQ3
IDEwMDY0NAotLS0gYS9mcy91c2VyZmF1bHRmZC5jCisrKyBiL2ZzL3VzZXJmYXVsdGZkLmMKQEAg
LTEzMjUsNiArMTMyNSw5IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoc3RydWN0
IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogCQlnb3RvIG91dDsKIAl9CiAKKwl1ZmZkaW9fcmVnaXN0
ZXIucmFuZ2Uuc3RhcnQgPQorCQl1bnRhZ2dlZF9hZGRyKHVmZmRpb19yZWdpc3Rlci5yYW5nZS5z
dGFydCk7CisKIAlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3JlZ2lzdGVyLnJhbmdl
LnN0YXJ0LAogCQkJICAgICB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2UubGVuKTsKIAlpZiAocmV0KQpA
QCAtMTUxNCw2ICsxNTE3LDggQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0
cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191
bnJlZ2lzdGVyLCBidWYsIHNpemVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQogCQlnb3RvIG91dDsK
IAorCXVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0ID0gdW50YWdnZWRfYWRkcih1ZmZkaW9fdW5yZWdp
c3Rlci5zdGFydCk7CisKIAlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3VucmVnaXN0
ZXIuc3RhcnQsCiAJCQkgICAgIHVmZmRpb191bnJlZ2lzdGVyLmxlbik7CiAJaWYgKHJldCkKLS0g
CjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
