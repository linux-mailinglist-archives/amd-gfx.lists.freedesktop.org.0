Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D676A33E4B
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0749E89491;
	Tue,  4 Jun 2019 05:23:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B88929D
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:30 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id q13so4405289qtj.15
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TMNTkBlmDGgOOZrctIfCYuVqOYCJYB+OoUZL57F6fkg=;
 b=uQxMRXCWAGGcTeeS7D1XKnU3KX2+vReTuPOs94gb4ZPlzaPPq+u+eiVgs5VyQbKfou
 3mLNf2/ngYsyy0hZt8kh/2ov3Cb//mr7+tmJ7E+I/KAy3U5evMik6wvi7JyMJkrvUomU
 swhxnhSe118XhA0qsn+WBhURLPTh7mqob+vw6QehbLDhpeeoxbB4DihKTzGdjGISEbtI
 6DgfbU92fpcTtq8jqpVAqN0PtwkX6LeOtOOa+pI/WzBDv8aAYBUnwR7oHKJIhb7mIK9Y
 Ya3+skav8RCS2A9zQmqmuTmsajoQk6Ne0LpxxPJzbGJxdtcBT6XZWuyJ9Jd2QZ3JFwrF
 4iPQ==
X-Gm-Message-State: APjAAAU8PowfiX8dRNvrEPvpnPQ6HNlGOg9VQrupa5hHH3KHTb02fzf7
 Hzd/7CnIJAetRz4oViXemYNSsn0EDtYut/wV
X-Google-Smtp-Source: APXvYqyPiXiZoks5Ggp2WbCYXPXwRsXJyBinTtF4q2J+DeL6YZqEYLLUcsyCdMKT9rkSKMCpecR3goEaERoY/ZM9
X-Received: by 2002:a0c:d013:: with SMTP id u19mr1987564qvg.136.1559580929777; 
 Mon, 03 Jun 2019 09:55:29 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:04 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 05:23:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=TMNTkBlmDGgOOZrctIfCYuVqOYCJYB+OoUZL57F6fkg=;
 b=KWmY1/MTf2lCSA8LP774r8p0/RElUafoWRXpiTV5M0FssBvd2DR+JnorkPH/h4Y5+f
 yR9XiiiNdq2i4QfOjofZ58b2UAQfK20Q+cucasNJuK58SVUF0twT9Bg5tEaVarSUnpM0
 CkXfb2ETfWkZvMjhhmX2MfDgGW4xKH4IotNUPi45ZU95oK+BdGaJ73sBg/cX0kzx4m8b
 MubK1pKIg9ehFkgM51KidZa6DmQaV4zELWE1kuJ9QUfecA/WQ31VKLS+QtHdLvI4uobs
 geOOZXZ26xHTUKbG4mCrjgzhEEUQSTlmmrjiggpRSIEqoJXM210SSB6rrtJIQUmyJUQs
 1hHw==
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
cmd1bWVudHMuCgpjb3B5X2Zyb21fdXNlciAoYW5kIGEgZmV3IG90aGVyIHNpbWlsYXIgZnVuY3Rp
b25zKSBhcmUgdXNlZCB0byBjb3B5IGRhdGEKZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJu
ZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KcHJvdmlkZWQgYSB0YWdn
ZWQgcG9pbnRlciB0byBvbmUgb2YgdGhlIHN5c2NhbGxzIHRoYXQgdXNlIGNvcHlfZnJvbV91c2Vy
LAp3ZSBuZWVkIHRvIGNvcnJlY3RseSBoYW5kbGUgc3VjaCBwb2ludGVycy4KCkRvIHRoaXMgYnkg
dW50YWdnaW5nIHVzZXIgcG9pbnRlcnMgaW4gYWNjZXNzX29rIGFuZCBpbiBfX3VhY2Nlc3NfbWFz
a19wdHIsCmJlZm9yZSBwZXJmb3JtaW5nIGFjY2VzcyB2YWxpZGl0eSBjaGVja3MuCgpOb3RlLCB0
aGF0IHRoaXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBl
cmZvcm0gdGhlCmNoZWNrcywgYnV0IHRoZW4gcGFzc2VzIHRoZW0gYXMgaXMgaW50byB0aGUga2Vy
bmVsIGludGVybmFscy4KClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZs
QGdvb2dsZS5jb20+Ci0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAxMCAr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXggZTVkNWYzMWM2ZDM2Li45MTY0ZWNiNWZl
Y2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisrKyBiL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCkBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBfX3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1
bnNpZ25lZCBsb25nIHNpCiAJcmV0dXJuIHJldDsKIH0KIAotI2RlZmluZSBhY2Nlc3Nfb2soYWRk
ciwgc2l6ZSkJX19yYW5nZV9vayhhZGRyLCBzaXplKQorI2RlZmluZSBhY2Nlc3Nfb2soYWRkciwg
c2l6ZSkJX19yYW5nZV9vayh1bnRhZ2dlZF9hZGRyKGFkZHIpLCBzaXplKQogI2RlZmluZSB1c2Vy
X2FkZHJfbWF4CQkJZ2V0X2ZzCiAKICNkZWZpbmUgX0FTTV9FWFRBQkxFKGZyb20sIHRvKQkJCQkJ
CVwKQEAgLTIyNiw3ICsyMjYsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdWFjY2Vzc19lbmFibGVf
bm90X3Vhbyh2b2lkKQogCiAvKgogICogU2FuaXRpc2UgYSB1YWNjZXNzIHBvaW50ZXIgc3VjaCB0
aGF0IGl0IGJlY29tZXMgTlVMTCBpZiBhYm92ZSB0aGUKLSAqIGN1cnJlbnQgYWRkcl9saW1pdC4K
KyAqIGN1cnJlbnQgYWRkcl9saW1pdC4gSW4gY2FzZSB0aGUgcG9pbnRlciBpcyB0YWdnZWQgKGhh
cyB0aGUgdG9wIGJ5dGUgc2V0KSwKKyAqIHVudGFnIHRoZSBwb2ludGVyIGJlZm9yZSBjaGVja2lu
Zy4KICAqLwogI2RlZmluZSB1YWNjZXNzX21hc2tfcHRyKHB0cikgKF9fdHlwZW9mX18ocHRyKSlf
X3VhY2Nlc3NfbWFza19wdHIocHRyKQogc3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAqX191YWNj
ZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQgX191c2VyICpwdHIpCkBAIC0yMzQsMTAgKzIzNSwxMSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX191c2VyICpfX3VhY2Nlc3NfbWFza19wdHIoY29uc3Qgdm9p
ZCBfX3VzZXIgKnB0cikKIAl2b2lkIF9fdXNlciAqc2FmZV9wdHI7CiAKIAlhc20gdm9sYXRpbGUo
Ci0JIgliaWNzCXh6ciwgJTEsICUyXG4iCisJIgliaWNzCXh6ciwgJTMsICUyXG4iCiAJIgljc2Vs
CSUwLCAlMSwgeHpyLCBlcVxuIgogCTogIj0mciIgKHNhZmVfcHRyKQotCTogInIiIChwdHIpLCAi
ciIgKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdCkKKwk6ICJyIiAocHRyKSwgInIi
IChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFkZHJfbGltaXQpLAorCSAgInIiICh1bnRhZ2dlZF9h
ZGRyKHB0cikpCiAJOiAiY2MiKTsKIAogCWNzZGIoKTsKLS0gCjIuMjIuMC5yYzEuMzExLmc1ZDc1
NzNhMTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
