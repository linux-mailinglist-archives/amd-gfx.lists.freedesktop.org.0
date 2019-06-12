Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577042739
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419E989650;
	Wed, 12 Jun 2019 13:12:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C52E8930C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:12 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id r57so14389666qtj.21
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eb4SnUCHaoFPTU0EqMrx7H6L5ANcvzM3zwsiyq0FV40=;
 b=tbiNxLD/921Of4CQel3rGEk50HlongLccGFqWRAfLm//7auwyjmgikpu/sINCybAwR
 f/MiYvabvsDlrCZYT0DMCq7M9spFixyULOg83/RNEvAEyCwO7U6nDdn5+HqHOu2u3pMM
 zW3Qt11mUL8aZLN1//ZHIHxzRolN2yim7yyvA6ZesSF46JzqUVxsgjNwrMTpGQ8vZo9K
 cDfsoaUv3fJt9suWvRu1pBNjhsUzwRA5LTFB8Uu/Bq5SlhhUPuL9YOTP7NOJzB0dxfh/
 NQUaG4R3wOabSW0UbP83alYcNCebNrJ0aWhivUKz+dTv9PcWlcVVEcctmIeO876R+0dL
 A5Pw==
X-Gm-Message-State: APjAAAVaRor+lRayHlG275FV8ACNRSijGYzVlipbRX03x2PArSVkxXHL
 wNVm86FdXvII1FrAcbr8mgpLKH0TpvKiEOiP
X-Google-Smtp-Source: APXvYqziQbsGJB+s1a1ziaRcl+e8Gmo6MzSM6gFLtwRxsTnl2K0xyr2RS7DkrrH2w0nPz/f56zeYNt9ix1U3jsHZ
X-Received: by 2002:ae9:f107:: with SMTP id k7mr2472892qkg.215.1560339851579; 
 Wed, 12 Jun 2019 04:44:11 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:28 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <50293fea168d5252f79ee0bf160c64c72edbf270.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 11/15] IB/mlx4,
 arm64: untag user pointers in mlx4_get_umem_mr
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
 bh=eb4SnUCHaoFPTU0EqMrx7H6L5ANcvzM3zwsiyq0FV40=;
 b=UD79Ay48r+Qt/fUB4eQQS+u7jB3BFWRYtdLCt6Qa95VfLfmvvw7Hya/RkyTUwkhx0D
 +1vmB8M4RBQZbJNIhwkYxv5AEL21ErrNvQCQ8+lOs4BCA4LMOTjJTuV8BlTNIfNEsvvi
 S8RTYx74gNWKftQMTjEJ+kHo6ZnD8masl8ZG8ezS9xy8uaiMn8te593VaiscKSGKojp2
 e5Cc4FqtUoN3q8YTe+OydLtjYtDNOm5Wm5t/bbuGQhbg9sf44AZgifS6zPiIE4WlbsCF
 2CX+HbBHE4vO/HCGylKIpSsIsXiK8frsZe8Lb15lkTfFpYP5OsKznhL91S0FrbJQy23X
 yoqw==
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
cmd1bWVudHMuCgptbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJz
IGZvciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBv
aW50ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZl
cnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZp
bmliYW5kL2h3L21seDQvbXIuYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKaW5k
ZXggMzU1MjA1YTI4NTQ0Li4xM2Q5ZjkxN2YyNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5p
YmFuZC9ody9tbHg0L21yLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwpA
QCAtMzc4LDYgKzM3OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9t
cihzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJICogYWdhaW4KIAkgKi8KIAlp
ZiAoIWliX2FjY2Vzc193cml0YWJsZShhY2Nlc3NfZmxhZ3MpKSB7CisJCXVuc2lnbmVkIGxvbmcg
dW50YWdnZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKIAkJc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWE7CiAKIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwpAQCAt
Mzg2LDkgKzM4Nyw5IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihz
dHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJCSAqIGNvdmVyIHRoZSBtZW1vcnks
IGJ1dCBmb3Igbm93IGl0IHJlcXVpcmVzIGEgc2luZ2xlIHZtYSB0bwogCQkgKiBlbnRpcmVseSBj
b3ZlciB0aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBwaW5ncy4KIAkJICovCi0JCXZtYSA9IGZpbmRf
dm1hKGN1cnJlbnQtPm1tLCBzdGFydCk7Ci0JCWlmICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gc3Rh
cnQgKyBsZW5ndGggJiYKLQkJICAgIHZtYS0+dm1fc3RhcnQgPD0gc3RhcnQpIHsKKwkJdm1hID0g
ZmluZF92bWEoY3VycmVudC0+bW0sIHVudGFnZ2VkX3N0YXJ0KTsKKwkJaWYgKHZtYSAmJiB2bWEt
PnZtX2VuZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxlbmd0aCAmJgorCQkgICAgdm1hLT52bV9zdGFy
dCA8PSB1bnRhZ2dlZF9zdGFydCkgewogCQkJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkK
IAkJCQlhY2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNTX0xPQ0FMX1dSSVRFOwogCQl9IGVsc2Ugewot
LSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
