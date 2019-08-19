Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE69247D
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 15:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B089807;
	Mon, 19 Aug 2019 13:16:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E089807
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 13:14:52 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id k21so3061038ywk.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 06:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oNoDUi1hsmNzzodU0R6ojKZvjIC3JQAmU+NA/+7Uaps=;
 b=CrsLjV5IisKUMdh1uaSLO2mmce/GbowzMffejgnJeZ1bZt2rFrf8zrE/SHTCXeaGoI
 /0IbZxyjdOaZhsVLK5Hi+HwS3JfOwNnaNEl+FBOhZueQC2ayjNrMSX1Nf6BoY/wBDWVz
 ihJ2EnVl0gtwWAL82fqwPy51v3XZh/Vlqg6XpW64G2DTiEXWKuRJ2nBYsUbO5h2uDxo1
 bydXSwWcBeoXYcvQ3WSi2vTsi4VaU9NBvCosazUNTjif2wsNFdCsodh9SVhAK1vCcG6m
 AUCZFOF2EJq7dInVmUsSUXhZ8NtSBk25Hj2zBUW50hfuYxXy9QieQMgmeW5cm5uJlfcl
 0jBw==
X-Gm-Message-State: APjAAAVbPK6A2flr5LmT3ZAE7qB8IoUuDb+/sU+C/EqQPK8guQ4t6DNA
 OFeJ0GutWrKpvmNSTSa495nYPcYKTUkjImjg
X-Google-Smtp-Source: APXvYqwFX5U5jD7RsGf0G3vM/9ehnT3AiWsZaEFsyMkoc/hovIoyUTjRlHyWf2f4E//56cQouSUIEdq8hx31clIz
X-Received: by 2002:a81:6c85:: with SMTP id
 h127mr16796224ywc.111.1566220491100; 
 Mon, 19 Aug 2019 06:14:51 -0700 (PDT)
Date: Mon, 19 Aug 2019 15:14:42 +0200
Message-Id: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH ARM] selftests, arm64: fix uninitialized symbol in tags_test.c
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Will Deacon <will.deacon@arm.com>
X-Mailman-Approved-At: Mon, 19 Aug 2019 13:16:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oNoDUi1hsmNzzodU0R6ojKZvjIC3JQAmU+NA/+7Uaps=;
 b=ouW48h7HGbpdNdCReL1nk2+dvRXfxgklc1nbCP+Q9JJOIGCVyS3fqahBo1S2d8316M
 OZxTJFVIgB1yHxwjdFezXxDGLz9wKstEmjea5fp8x0waRP2D4PtWy/8cEd94ITbDy+AB
 ohMM7RCZVEao1hTKwgkNZsuSnXQ52npfKzrCB8hagDJHWUZyqV94tepmovte0/cp0h4L
 SvPXvaVH6Kvmqsu415sDgkqDdnh0pnuy5EbzAZl/JGrx9UiwjWAucl5+kBCOYUeFDUvr
 0QJUC5x7f/83eUXVQvxdzpHaeshvsSjN84YEl5sN0EdVOxlMEIgfFzUzZo6IFB3/q633
 zoEw==
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
 Catalin Marinas <catalin.marinas@arm.com>, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
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
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHRhZ2dlZF9wdHIgbm90IGJlaW5nIGluaXRpYWxpemVkIHdoZW4gVEJJIGlzIG5vdCBlbmFi
bGVkLgoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgfCA4ICsrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKaW5kZXggMjJhMWIyNjZlMzczLi41NzAxMTYzNDYw
ZWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5j
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCkBAIC0xNCwx
NSArMTQsMTcgQEAKIGludCBtYWluKHZvaWQpCiB7CiAJc3RhdGljIGludCB0YmlfZW5hYmxlZCA9
IDA7Ci0Jc3RydWN0IHV0c25hbWUgKnB0ciwgKnRhZ2dlZF9wdHI7CisJdW5zaWduZWQgbG9uZyB0
YWcgPSAwOworCXN0cnVjdCB1dHNuYW1lICpwdHI7CiAJaW50IGVycjsKIAogCWlmIChwcmN0bChQ
Ul9TRVRfVEFHR0VEX0FERFJfQ1RSTCwgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKSA9
PSAwKQogCQl0YmlfZW5hYmxlZCA9IDE7CiAJcHRyID0gKHN0cnVjdCB1dHNuYW1lICopbWFsbG9j
KHNpemVvZigqcHRyKSk7CiAJaWYgKHRiaV9lbmFibGVkKQotCQl0YWdnZWRfcHRyID0gKHN0cnVj
dCB1dHNuYW1lICopU0VUX1RBRyhwdHIsIDB4NDIpOwotCWVyciA9IHVuYW1lKHRhZ2dlZF9wdHIp
OworCQl0YWcgPSAweDQyOworCXB0ciA9IChzdHJ1Y3QgdXRzbmFtZSAqKVNFVF9UQUcocHRyLCB0
YWcpOworCWVyciA9IHVuYW1lKHB0cik7CiAJZnJlZShwdHIpOwogCiAJcmV0dXJuIGVycjsKLS0g
CjIuMjMuMC5yYzEuMTUzLmdkZWVkODAzMzBmLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
