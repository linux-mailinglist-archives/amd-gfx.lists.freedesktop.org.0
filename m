Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4ED42724
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB5894FF;
	Wed, 12 Jun 2019 13:12:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F88930B
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:59 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id b1so7607613otk.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Q196Me2jAIDAnTBGiPK/Cxn0vMZ4fncAn8y7f8WRTyA=;
 b=ciQ5rebsnuhzdmNOEBrn7tRRsz+P3x9kUjJKH69pnilnq6CL21mBxieU6JRbMUFX2l
 2xX5kAhUGyc0cQmDUOtr0QUb9eWj6l/GA/cphNYm5INlHBX+RgMuceE0oe3uLQ1mmSAQ
 xldgkMYnREi/EWzprgGlPb/KZImejDPh8hs3UfzFh9vaBZvH4UYOUIYf1yjrpjqsK8JY
 LDjiERO2q8qxO80noXHl58AN2EAFnleAU/y/ml6mjE3dqdes8cr8aZJPywzy4fJzcbqb
 sH8nNjf2r2Yq1URdIQEK70y4MU+HeRcBS4Af63rxkEpE5HBz8GXV+4027idYi/SjGPrO
 WE0A==
X-Gm-Message-State: APjAAAWIauW2/JoRK54w3gCde1b0ogMhR5Czc9s8ms3QjSiWQJreyF9y
 Ct4AJKO8wcHfIPzlwRZtw3KrDSYMAhOzjmqF
X-Google-Smtp-Source: APXvYqzBV++HnsJqGVA3TkWLFAlh+OLmBH/rJ20EXP8gbe+qklBNVVp+IuIonV1uuXEIF8K1ppBAgAEKJRpWB8lr
X-Received: by 2002:aca:6c6:: with SMTP id 189mr17818209oig.167.1560339838959; 
 Wed, 12 Jun 2019 04:43:58 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:24 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <4ed871e14cc265a519c6ba8660a1827844371791.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 07/15] fs, arm64: untag user pointers in copy_mount_options
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=Q196Me2jAIDAnTBGiPK/Cxn0vMZ4fncAn8y7f8WRTyA=;
 b=crJJXXAC2Ku7R2O4W/i46T8MVMbfUT08MJ41XL5/hHP5V9FjHyo0Uen9LNxuGDN5Vy
 63AWsHkedb9O9JWDh7PX7+icF3+aQrjNm9LMqOxXKSXvWvA1aCADx8vQJIjHIcqFjNdS
 lYpx+uRnlnGYhTQ2lQa8QHdE77x+n4mpr2sUjGrEPZ8RUtGTjRZ6moY6dJvWWn+KRbsY
 dQnCJW3fkugzHDg7Z7YzCoAOi+mpWJRQPWYBzTyBpPkH9NOLOyHd9BCpw34BLqWhA4XL
 4AfxwDFDvKPDrbAnUzBzbdpr67Rfah4zZpcEFIF5+I68PhpwUQ4ynpp9B2e02i2b/LFy
 ttKg==
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
cmd1bWVudHMuCgpJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcg
c3VidHJhY3RlZCBmcm9tIFRBU0tfU0laRS4KSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBU
QVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90CmFsbG93IHRoZSBleGFjdF9j
b3B5X2Zyb21fdXNlcigpIGNhbGwgdG8gY3Jvc3MgVEFTS19TSVpFIGJvdW5kYXJ5LgpIb3dldmVy
IGlmIHRoZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1bGF0
ZWQKaW5jb3JyZWN0bHkuCgpVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCgpS
ZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5
OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZnMvbmFtZXNw
YWNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9mcy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFjZS5jCmluZGV4IGIy
Njc3OGJkYzIzNi4uMmU4NTcxMmExOWVkIDEwMDY0NAotLS0gYS9mcy9uYW1lc3BhY2UuYworKysg
Yi9mcy9uYW1lc3BhY2UuYwpAQCAtMjk5Myw3ICsyOTkzLDcgQEAgdm9pZCAqY29weV9tb3VudF9v
cHRpb25zKGNvbnN0IHZvaWQgX191c2VyICogZGF0YSkKIAkgKiB0aGUgcmVtYWluZGVyIG9mIHRo
ZSBwYWdlLgogCSAqLwogCS8qIGNvcHlfZnJvbV91c2VyIGNhbm5vdCBjcm9zcyBUQVNLX1NJWkUg
ISAqLwotCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZylkYXRhOworCXNpemUgPSBU
QVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRhdGEpOwogCWlmIChzaXpl
ID4gUEFHRV9TSVpFKQogCQlzaXplID0gUEFHRV9TSVpFOwogCi0tIAoyLjIyLjAucmMyLjM4My5n
ZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
