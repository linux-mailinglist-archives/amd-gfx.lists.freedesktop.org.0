Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB442730
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D5689590;
	Wed, 12 Jun 2019 13:12:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3918930F
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:05 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id v5so15162753ybq.17
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=49lyybNUomf5TPPaYx2MdHbLNYXxhntLqw2Vq4fwp4Q=;
 b=JYDb1a9m1OwVMdO8blH3IHFY+8vAA1F6/YOdZWMd5E5Ur1lWvPdtMaWtY2WbGVxyTH
 LLoLsBXej7rOugQpOtEeDVKnUNbrlcosW2iUSOpPCk9/xkbbYjPhkCkS8+VgwJv1IQKf
 zdZhIZmVzIBFb6NH7J7AMEKDlYR56HwLo8BSZP2A+MTEgYmnGHxlK1jVTp41ZSXLplvU
 r4ZHP5EmEDcN/GQ3/U0Joew5qJ/a0h+7j3S2mIR8Ttzr1ID2ZDmRcBVRrlSLIKMn8xJv
 2dn8vDPGU2Lw4QTHVzFeb4GHRt8gX7fu+a2QDXuzPy7W7sjoFNbN1NSE+jkc9GGy5GI9
 nCPA==
X-Gm-Message-State: APjAAAXsiAAcbt+zLY4L0V4ggWE2Z0yIAYdymGQuqq9S/SZxu2qMwx1e
 WS05E0bhzzMFyFzL9v95lOeIDwAjEZTjGVap
X-Google-Smtp-Source: APXvYqxF+/T3yPkem3l6CI+bv3/rmqxcJMbV/vABJbuoyeQcWj2Unps+PKPx2+cODkSgswAOZakXvU9OwOpzOWtl
X-Received: by 2002:a81:2717:: with SMTP id n23mr31165867ywn.423.1560339845094; 
 Wed, 12 Jun 2019 04:44:05 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:26 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <d9cbdcc3c4926bf70fe0014110901a0755e8e869.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 09/15] drm/amdgpu, arm64: untag user pointers
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
 bh=49lyybNUomf5TPPaYx2MdHbLNYXxhntLqw2Vq4fwp4Q=;
 b=ihFwqktAIqrJiTQwTjUhK+MAdfOsiouWKHqO7ZjSSZRmzOCHa96d8VJOaNVIZNxAcO
 AN6aXPp/RE1MrQ6zM8JJXD7nVRwFFfp5nOw9hthmPYYo49089cBtVFaOKAL5CUs7PfyJ
 QVJHzuksJxoSuikR4fgviWI+uxOP0qQaG3AiODD2sa8fpyWPMeWsTelFk8q9IMn10OKD
 +UNh5Ci6TXkOO1z7q/a2BisVOKAv5AoSV7//DSqtdeKoVvYLLBYkbZ3uB0cH3pp+Kewb
 rQGpoPMvtpdogBshUOOc5uWdI95iNZkAb+XnamPk3rh+8KJ/cKljnQO2b6iriftiFlMR
 wRJQ==
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
cmd1bWVudHMuCgpJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbmQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jL2luaXRfdXNlcl9wYWdlcygpCmFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0
aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQKYWRkcmVzcyBzaG91
bGQgYmUgdXNlZCBzbyB0aGF0IE1NVSBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNz
IGdldApjb3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodCBCTy4gVGhpcyBwYXRjaCB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluCmFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUg
R0VNIGNhc2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1fCmFsbG9jX21lbW9yeV9vZl9ncHUo
KSBmb3IgdGhlIEtGRCBjYXNlLiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IGFuCnVudGFnZ2Vk
IHBvaW50ZXIgaXMgcGFzc2VkIHRvIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoKSwgd2hp
Y2ggdXNlcwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpBY2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYwppbmRleCBhNmU1MTg0ZDQzNmMuLjVkNDc2ZTliYmM0MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtMTEw
OCw3ICsxMTA4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dw
dSgKIAkJYWxsb2NfZmxhZ3MgPSAwOwogCQlpZiAoIW9mZnNldCB8fCAhKm9mZnNldCkKIAkJCXJl
dHVybiAtRUlOVkFMOwotCQl1c2VyX2FkZHIgPSAqb2Zmc2V0OworCQl1c2VyX2FkZHIgPSB1bnRh
Z2dlZF9hZGRyKCpvZmZzZXQpOwogCX0gZWxzZSBpZiAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1Nf
RE9PUkJFTEwpIHsKIAkJZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwogCQlhbGxvY19k
b21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9DUFU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmMKaW5kZXggZDRmY2Y1NDc1NDY0Li5lOTFkZjE0MDc2MTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTI4Nyw2ICsyODcsOCBAQCBpbnQgYW1k
Z3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
CiAJdWludDMyX3QgaGFuZGxlOwogCWludCByOwogCisJYXJncy0+YWRkciA9IHVudGFnZ2VkX2Fk
ZHIoYXJncy0+YWRkcik7CisKIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJncy0+YWRkciB8IGFyZ3Mt
PnNpemUpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMw
YzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
