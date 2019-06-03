Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCF33E53
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC96894A7;
	Tue,  4 Jun 2019 05:23:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x34a.google.com (mail-ot1-x34a.google.com
 [IPv6:2607:f8b0:4864:20::34a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DAD89057
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:34 +0000 (UTC)
Received: by mail-ot1-x34a.google.com with SMTP id b64so6122039otc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=20y1HOjqXQjYCoZ3FMKXhe3A/P2l0vyHswuOkJrBoHc=;
 b=SvPwBJ0ll+nt6Pg2qRJGPM5MYBDQipMo/9HhfxfHO6vYXzSmKcffS0Ybn+yFBYLTbV
 yW1S4QrMxcxWljnUwVGWWHOMrA6OYSyzU0WWtr/Zo+fu9LxAs9lODfCpxkYILs3ti+9f
 IYAZ4iEbkv80L8ZkESfqm3kLxMwTBKn/L88DbvHe5i2V+myG3qanlx6LX9UAand+3pid
 uWSlOuMLctPvE06IXmbGmqlyjYwHd0iz5qyNmH9z38o/IOwVYgoZ9qbkVaM/iEloo59k
 N8d14lYFbofl7Bf4ZajJb7tU02TIT5zYHw8YesbUifbDUFl5XDg30uECddMmC2Xep8aH
 rYRw==
X-Gm-Message-State: APjAAAUsjyKfyybnI6Xl8lyKex7JAj6OLPklSPjXPXCqPmp9rx+eoiR5
 VLLWOChLd5kOhpMVZbbks7ryczGu76f9RbAV
X-Google-Smtp-Source: APXvYqzHKkB2rM9PXXWgsahc+U06gQo0dW3SgxcQRqFmx6XqPzOJDdvsIYpt6xPWzmKaja2zBdl1velx+1PVZjyJ
X-Received: by 2002:a9d:62d5:: with SMTP id z21mr1888837otk.202.1559580933129; 
 Mon, 03 Jun 2019 09:55:33 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:05 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <14f17ef1902aa4f07a39f96879394e718a1f5dc1.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 03/16] lib, arm64: untag user pointers in strn*_user
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
 bh=20y1HOjqXQjYCoZ3FMKXhe3A/P2l0vyHswuOkJrBoHc=;
 b=LglK5GIUUx/pUH7d33srSrOdoxDJcf6k8RPUUYHzql61oC+wNFESJd5PKVtebHfEHg
 K4rjnwnmDpgmbEhEStseFjNPEkvS+OI72qtgGhLpDEtxWhTvC3aTgCw5FcWPqu/H8YrI
 EsZSEg5fuJNLUqDTf1Y4yx6ojgmyvktu2GiIy1cCbapuFQIW/4LxM06f8+NqNbEgrvNM
 UWcCXb3C0eM0WuvLRS+mPfo8NHHpXEwFgU2WjcbOUcfYUWB+71yFOhi1U1i0mgtvoovy
 MA4D4byZDDLHTtN4PLwPL3K21wgXq++wadXcb7ohaA0PX/0lh5439vbzfphRZaAPKsSb
 Z6iw==
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
cmd1bWVudHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2Vy
IGFkZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMg
cGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFs
aWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1l
bW9yeSBhY2Nlc3Nlcy4KClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZs
QGdvb2dsZS5jb20+Ci0tLQogbGliL3N0cm5jcHlfZnJvbV91c2VyLmMgfCAzICsrLQogbGliL3N0
cm5sZW5fdXNlci5jICAgICAgfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMg
Yi9saWIvc3RybmNweV9mcm9tX3VzZXIuYwppbmRleCAwMjNiYTlmM2I5OWYuLmRjY2I5NWFmNjAw
MyAxMDA2NDQKLS0tIGEvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMKKysrIGIvbGliL3N0cm5jcHlf
ZnJvbV91c2VyLmMKQEAgLTYsNiArNiw3IEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgog
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CisjaW5j
bHVkZSA8bGludXgvbW0uaD4KIAogI2luY2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KICNpbmNsdWRl
IDxhc20vd29yZC1hdC1hLXRpbWUuaD4KQEAgLTEwOCw3ICsxMDksNyBAQCBsb25nIHN0cm5jcHlf
ZnJvbV91c2VyKGNoYXIgKmRzdCwgY29uc3QgY2hhciBfX3VzZXIgKnNyYywgbG9uZyBjb3VudCkK
IAkJcmV0dXJuIDA7CiAKIAltYXhfYWRkciA9IHVzZXJfYWRkcl9tYXgoKTsKLQlzcmNfYWRkciA9
ICh1bnNpZ25lZCBsb25nKXNyYzsKKwlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2Vk
X2FkZHIoc3JjKTsKIAlpZiAobGlrZWx5KHNyY19hZGRyIDwgbWF4X2FkZHIpKSB7CiAJCXVuc2ln
bmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIgLSBzcmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7CmRpZmYg
LS1naXQgYS9saWIvc3Rybmxlbl91c2VyLmMgYi9saWIvc3Rybmxlbl91c2VyLmMKaW5kZXggN2Yy
ZGIzZmUzMTFmLi4yOGZmNTU0YTFiZTggMTAwNjQ0Ci0tLSBhL2xpYi9zdHJubGVuX3VzZXIuYwor
KysgYi9saWIvc3Rybmxlbl91c2VyLmMKQEAgLTIsNiArMiw3IEBACiAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvdWFj
Y2Vzcy5oPgorI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAKICNpbmNsdWRlIDxhc20vd29yZC1hdC1h
LXRpbWUuaD4KIApAQCAtMTA5LDcgKzExMCw3IEBAIGxvbmcgc3Rybmxlbl91c2VyKGNvbnN0IGNo
YXIgX191c2VyICpzdHIsIGxvbmcgY291bnQpCiAJCXJldHVybiAwOwogCiAJbWF4X2FkZHIgPSB1
c2VyX2FkZHJfbWF4KCk7Ci0Jc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZylzdHI7CisJc3JjX2Fk
ZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHN0cik7CiAJaWYgKGxpa2VseShzcmNf
YWRkciA8IG1heF9hZGRyKSkgewogCQl1bnNpZ25lZCBsb25nIG1heCA9IG1heF9hZGRyIC0gc3Jj
X2FkZHI7CiAJCWxvbmcgcmV0dmFsOwotLSAKMi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29v
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
