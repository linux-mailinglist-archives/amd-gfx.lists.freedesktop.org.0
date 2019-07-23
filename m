Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC871ECA
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932686E32B;
	Tue, 23 Jul 2019 18:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC96E32A
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:49 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id o11so30550982qtq.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IHvI+dZahLSsu4iMw8K110v852ALNB6rzz3nOC21G6Y=;
 b=I4xSRTVqkG3Uj1XWCdjIN6UZRsbjxUBxZBQ4tUHk8TVOI3ACyVNiGbd1h92myeIOCb
 Bc7oPjUfoJLhRnzBBxHRdr1DRY04qzkc9rYnBqd12sUeFbp92RpCDS9QQQLn1pvzWm0s
 Q+7S5QkpgHy8DnWXwKEsYRgQpxeoMfasD6APSrMpDeztXxXi4hMkbKeA4LT0IpLPD4uj
 9FxyD+pTCvD+sjGGYXa+bBn5POsJMbpk5GImPcc/DAOBE69gg9rQzqbl08VB4tL4lafm
 9dGIETzmrLGzbEOOXoiFtUKzz44BfcOaPXdnBd/jzrOShG6v1Bjv//k5MHL8Uu1VviF7
 G0YA==
X-Gm-Message-State: APjAAAUP675MEDQ+88ZqWWd/Lr+Kc/GM7CYW2GfheEQyCU+3P7yiTnp1
 HGmQv6pmODxm1kjUfUSoVRdKjJQfv6XNU37U
X-Google-Smtp-Source: APXvYqzRyHp7WBTqlPGt29onShJXh3Cp/pE5/lej0P3nE1XW0gw1bUQxpG45N1NN4OdbAYc7oUndTzJUESDpF144
X-Received: by 2002:a0c:ffc5:: with SMTP id h5mr55634338qvv.43.1563904788555; 
 Tue, 23 Jul 2019 10:59:48 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:50 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <4b993f33196b3566ac81285ff8453219e2079b45.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 13/15] tee/shm: untag user pointers in tee_shm_register
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:11:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=IHvI+dZahLSsu4iMw8K110v852ALNB6rzz3nOC21G6Y=;
 b=mF8OyWPtPa27KaGkiSCnss6c8b+Y3jxSBp/iDga+MY7c9cKbX9nGHJwK2xlzSk0dvM
 46/b1IA06ke81wJzctvuMT0KvjYlT0hkwU/YFyMD3O3ZkppaxsJ6Qh96lV4fTWRGdGnB
 ViGf78WRhfhot+50mrRcEJP8ehDMTkQZYjXXgXUH6rOFs4T1KVaDzPVU6ktcbKr8zaRJ
 i3A/F+iOLc+6M6QJ7QteIj4THksgVZVnbx5C2fEtCjTVS1TOypq05pLtbtct8EtWO8pG
 Q61f0pOK8VaMaWwFM4favMJo4cb+2j4wmdeEX5CGZBr0ScIwqtpQSHdV7dFwlIUR9Dz4
 yLvg==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgp0ZWVfc2htX3JlZ2lzdGVyKCktPm9wdGVlX3NobV91bnJlZ2lzdGVyKCktPmNoZWNrX21l
bV90eXBlKCkgdXNlcyBwcm92aWRlZAp1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcyAodmlh
IF9fY2hlY2tfbWVtX3R5cGUoKSksIHdoaWNoIGNhbiBvbmx5IGJ5CmRvbmUgd2l0aCB1bnRhZ2dl
ZCBwb2ludGVycy4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4KClJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IEplbnMg
V2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy90ZWUvdGVl
X3NobS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3RlZS90ZWVfc2htLmMgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKaW5kZXggMmRh
MDI2ZmQxMmM5Li4wOWRkY2QwNmM3MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGVlL3RlZV9zaG0u
YworKysgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKQEAgLTI1NCw2ICsyNTQsNyBAQCBzdHJ1Y3Qg
dGVlX3NobSAqdGVlX3NobV9yZWdpc3RlcihzdHJ1Y3QgdGVlX2NvbnRleHQgKmN0eCwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAogCXNobS0+dGVlZGV2ID0gdGVlZGV2OwogCXNobS0+Y3R4ID0gY3R4Owog
CXNobS0+aWQgPSAtMTsKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKIAlzdGFydCA9IHJv
dW5kZG93bihhZGRyLCBQQUdFX1NJWkUpOwogCXNobS0+b2Zmc2V0ID0gYWRkciAtIHN0YXJ0Owog
CXNobS0+c2l6ZSA9IGxlbmd0aDsKLS0gCjIuMjIuMC43MDkuZzEwMjMwMjE0N2ItZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
