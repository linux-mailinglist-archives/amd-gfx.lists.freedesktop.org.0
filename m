Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F442725
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A5E89503;
	Wed, 12 Jun 2019 13:12:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82D89320
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:56 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id q8so16525527ywc.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YVD/WVehggR5Wc73HNU/6Lbl/J+rO7t+BXcE3PMRRDE=;
 b=g19ZlUocNISfN0CnujhfNCOIM1hWmknDddRYzihwsvZFWJcy/pGSPmOyruy9798qSD
 Wd14dbSrnMSuYHuEsrif9Cyf1BnjeeTY5tgD5JvJzkFxTQAPvY69Kzy4VFdONZzzuI5u
 r/64qaLiMIutEOrng+ghBtJtx3RZzy6Qjbh5pz1B1BFu41nH8lF6/vMucAXolqxYrHBc
 iltoWtsLaIyz+GlLQOYiI+1/jNPvI9iPZBHJog3O1/4ECJDVFbi3IGTG/NfOD9DdtBKG
 XyitCS+YbHWiADbNkqMYpCBHnWGKf1eEDka74gnptXQzIjZPUexL5UBUlCdT6k11UXED
 8/pA==
X-Gm-Message-State: APjAAAWczZLfwFtFOkp2DHWKJG7JYXejUL0foO+Ai4kpfvtj28puNSwb
 dt+jCitF2iSb1yZjgyTMgJVocUE2rOleuYol
X-Google-Smtp-Source: APXvYqzC8DIDqxpBDUE3Cs2MqoYPwBYxauFh78Yi9sE2QOVumKFBSV5WM5ycdrw0GZ9JIDvcxx34zgkY7MRSX6GJ
X-Received: by 2002:a81:9947:: with SMTP id q68mr46506819ywg.197.1560339835908; 
 Wed, 12 Jun 2019 04:43:55 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:23 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <4c0b9a258e794437a1c6cec97585b4b5bd2d3bba.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 06/15] mm, arm64: untag user pointers in get_vaddr_frames
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
 bh=YVD/WVehggR5Wc73HNU/6Lbl/J+rO7t+BXcE3PMRRDE=;
 b=hBGTTVG6ghhZ3+0guLELKJ8wGbky2Qh0tZY2BONpI+zCvbTSjhlIF7W0/JokOx5TzR
 VO5Rbf4FBD1McYuvKbubXsd/VFsD/O7BipMIP18RAMdpnsTMlCRbLlZbiP7oKXwSNsh/
 7N4rlsaJS9M2NXxtFUlEJJPsr6p+or/nlT4Zv12ZmDZup6gUVLdgoPgHeFDcpmGNRrjd
 3ALIrSuYojaH/pslqsc0jXMozZhljZkCeYnT4XFg9eFUPMSJzEQdr0RcX9d6uIudOkk2
 t4M2C4U//NS1sNKKoHlt+ReZpRZW4iLnE+17ISBaStJwmRniOrfV+Za5ClmC/tGhrMxn
 H1LA==
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
cmd1bWVudHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBm
b3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2lu
dGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhp
cyBmdW5jdGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpBY2tlZC1ieTogQ2F0YWxpbiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxh
bmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbW0vZnJhbWVfdmVjdG9yLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vZnJhbWVfdmVjdG9y
LmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCBjNjRkY2E2ZTI3YzIuLmM0MzFjYTgxZGFkNSAx
MDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKKysrIGIvbW0vZnJhbWVfdmVjdG9yLmMKQEAg
LTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAlpZiAoV0FSTl9PTl9PTkNFKG5yX2ZyYW1lcyA+IHZl
Yy0+bnJfYWxsb2NhdGVkKSkKIAkJbnJfZnJhbWVzID0gdmVjLT5ucl9hbGxvY2F0ZWQ7CiAKKwlz
dGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOworCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0p
OwogCWxvY2tlZCA9IDE7CiAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKG1tLCBzdGFydCwg
c3RhcnQgKyAxKTsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
