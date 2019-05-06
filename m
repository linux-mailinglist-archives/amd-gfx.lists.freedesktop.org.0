Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24E1528B
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8F89A6D;
	Mon,  6 May 2019 17:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED7589A61
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:14 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id q15so7748443otl.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/Xcm/dv07E6tB6Fg+Bd1uLrNx0q2WagwUZqys5y8XCQ=;
 b=SQtZPFJsSYDSIh5NPytwx9pQF7eUx8xXbq3QvCePfmtxqA2QpdF6TI5TYMYG3/4J+Z
 sQNDj9bZnaZ5aENqEA42Fa1q9SFL3IVeQ+kwPq1dIbHKRRg0Rqzs5b5OxicDxRooa+ND
 CnM2LkDAcNuLWX/YQGH4pgTb9p7xWa6MPs2D4gflZMfH3NmN5ZQSKHYIMLUF1mJvWAb8
 Vew9UJWLSXkcTeYzGjBS/QrRxx0R4js1D0iCWI26DNSt+nqw4YWeE2JwT+enXlBa/0mF
 w9zO0SVRnOmydOLQTfwfNpJ8/s9+QYWEZIsAWEJcqDkk7+4iMc2neRvsnfMr5FrXryGL
 ljgw==
X-Gm-Message-State: APjAAAXjjynK8hNVHsJhpo0aQzYC57cpUUduEKlwCVQ/NeaNshObOyOq
 AmdYWZ8X0LHRZdevoO4DtA5C3Txv/u1vr0oi
X-Google-Smtp-Source: APXvYqwsU29/a5rUuddp5tcfbPS3CQhzs1NWwE9FVJC7oUUpeYui7bu7Qsrr1jpZGFt27bCra6fHy1EBLcG5J9Rk
X-Received: by 2002:a9d:4917:: with SMTP id e23mr17423724otf.63.1557160273461; 
 Mon, 06 May 2019 09:31:13 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:48 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <02e1242715cc1bf23a139e5e8152fb4feaa4b41d.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 02/17] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
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
 bh=/Xcm/dv07E6tB6Fg+Bd1uLrNx0q2WagwUZqys5y8XCQ=;
 b=rAOt6QkMD/QKlKVog82fKw84EsQnaASzO/nI8W5EIDbrmmjV3gr6+15mZ10SMb6Rf5
 i/ZniLNvWV//CPRfADxSnSKtN/6Gg017m4Gik6Cenllh7RN6CfI/AKj72maW2yKQfmpN
 GrE1GcO1EKZaX0U+I3FWYiw4misL8V2knxuMTZnhd7+ifYq/drNNa4087ayYcqsu4RzV
 YnDg0sSjmZfX/PgQJ/vdVYIZT3u95MTKmAQy8Dfp2UhL6OXfBsqkSnVsPRCgY0ZcNTeM
 d3f8I7eWT+VKLfqWWZufhZUUDge/eC39ycIbKQ1fqVyQEg05Z5H0MBzHuW0wC/j81BOZ
 a7SA==
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
ZGRyKHB0cikpCiAJOiAiY2MiKTsKIAogCWNzZGIoKTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNm
MDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
