Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E615293
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3889AB5;
	Mon,  6 May 2019 17:19:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6F89AB5
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:35 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id o34so15882775qte.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RiesdCLpp+R0f3O9XnLGGd6rw9hYPfKFlydZlXAyMMc=;
 b=ujmxveEeON4/aW+NXpL+wHr8P3ejezj3f5FgpAmAk49nUA4MQlc3ZiCv7iDGnGVvwi
 iAZY3jhaAX9W/G3S6wZ68kCMO53Te19lUm3NUkgzCtXMLCwNJJx5W7Z0iaE+3ecqTG/2
 Qd5CJQPuDjV4Epi6NepL0svq0euXu8Cf6A1/uCd85M3+bMeCQ34cN4EUU36SGKRmoP1p
 4mJpIh0jx7nxJZJyRm3IQTMQYXUgjZAMcFzvSqzRBgTyQ83ISvTLfVi+BCw5gj1PeIMH
 sgx/hZVFY3CSixgnYbmSZ//+oVwblxGY7F+Y6M0PutM9Yqp8D2OqYaH2HhR8sL2/nV/c
 qJJQ==
X-Gm-Message-State: APjAAAVbUnCnAfOVsizkdtEriuxwjrZfxzi7GQV/baQXFjvNfJpK72BR
 ggfXgy39lfberSd5fvzdixQtPmoA3zImHryx
X-Google-Smtp-Source: APXvYqxNt6uYI1SB2jQypHitLB3ZO6cfBHn8QWvA0b8eMRqYbeBN0u2XyLJdNX/EJB3bCPY6PcnOySobJPUt2l9F
X-Received: by 2002:a37:9ed6:: with SMTP id h205mr2433459qke.152.1557160294772; 
 Mon, 06 May 2019 09:31:34 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:55 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <ac2ca3454b1ae8856ea2e29a1316fea50a30c788.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 09/17] fs, arm64: untag user pointers in copy_mount_options
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
 bh=RiesdCLpp+R0f3O9XnLGGd6rw9hYPfKFlydZlXAyMMc=;
 b=Q6QAvdDCFNZuLS9ja3NkrMR3RvJ0S09G7HKj9q0ktYjp11DSu6sbwte4Z+MCgpdXSa
 OGL0kcCil/ti4co+BeFvhTmmJ7+RXsHFsfK1hhHv1eec6VZbNopqVkjLet50ydoaeiwT
 XvmlmBaXIzsx1T6Dyaajg7Bz5pq9Axsw6cJNm2DtIdCFs4IeQzb8CYH1eWRXRhTqPi8L
 9AZ0ieEA2P7xzH+IK3hHC6FzJl7z9XjQD9wvxFqfvRNHuz4Kvz+PKDcTznem4kO3i/YF
 7eAO6TlPEh3PGwlYJ/3xngzxB39JPbQ+aqDHIcDB8TtrzW/euZk2kR1+K4+g3OqdGfdF
 qJTQ==
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
cmd1bWVudHMuCgpJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcg
c3VidHJhY3RlZCBmcm9tIFRBU0tfU0laRS4KSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBU
QVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90CmFsbG93IHRoZSBleGFjdF9j
b3B5X2Zyb21fdXNlcigpIGNhbGwgdG8gY3Jvc3MgVEFTS19TSVpFIGJvdW5kYXJ5LgpIb3dldmVy
IGlmIHRoZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1bGF0
ZWQKaW5jb3JyZWN0bHkuCgpVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0t
LQogZnMvbmFtZXNwYWNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFj
ZS5jCmluZGV4IGM5Y2FiMzA3ZmE3Ny4uYzI3ZTU3MTNiZjA0IDEwMDY0NAotLS0gYS9mcy9uYW1l
c3BhY2UuYworKysgYi9mcy9uYW1lc3BhY2UuYwpAQCAtMjgyNSw3ICsyODI1LDcgQEAgdm9pZCAq
Y29weV9tb3VudF9vcHRpb25zKGNvbnN0IHZvaWQgX191c2VyICogZGF0YSkKIAkgKiB0aGUgcmVt
YWluZGVyIG9mIHRoZSBwYWdlLgogCSAqLwogCS8qIGNvcHlfZnJvbV91c2VyIGNhbm5vdCBjcm9z
cyBUQVNLX1NJWkUgISAqLwotCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZylkYXRh
OworCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRhdGEp
OwogCWlmIChzaXplID4gUEFHRV9TSVpFKQogCQlzaXplID0gUEFHRV9TSVpFOwogCi0tIAoyLjIx
LjAuMTAyMC5nZjI4MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
