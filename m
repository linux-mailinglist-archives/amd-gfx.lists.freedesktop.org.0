Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B248E2A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF7789760;
	Mon, 17 Jun 2019 19:18:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B2895C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:43 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so12130362qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4tPrFamcRKBz2mMxB4EY4ODAcd02e7qkZUIY6kzfqI=;
 b=EaE/e0JSQJ2sEbVtd/sbofCPIjGHoSRcSvugCcBNC7znVIL2Tp874cK5vtG5yNmAbn
 z/GbiTzQoTA1nuD929HvKd3tzZMM/PbVnZcxn01nFyg+JBJOnGcUD11iQxWDtx7eKNMh
 4uKQCeeaQDzkHkLbvdq9C/IbjeTQkhSGE/OtnfNuULVFjgQkwWNX9FIeVqoCzWiFdOck
 kDtYS4mILKfK8Z+IGykh6jzLgVxjJHOpRiNPLrI6vGpHUcOfDKS1NwQWhF2SDt8P6L2X
 Tx8EQGPFdoSBoXPVgGytoLFByiFuB1e8F54f8saGfYYf6kHH8pqrUFwA1DW5nRHB62Th
 MAIw==
X-Gm-Message-State: APjAAAXnc1pw7mXsiaajlWwuOr6GW+5pZDz+w9kTMcjMsSgXhQ6NX0cf
 BJOwxrJi2Bt55nMNiTbWVFIvM4h3Uv8=
X-Google-Smtp-Source: APXvYqxCCz819ATFJY+zT2e32w8tT8WyYJc7ozVYNRrpT+Ug8rG9e4ftjfxFpZ4VMLwwRvLdw54oSg==
X-Received: by 2002:ac8:520e:: with SMTP id r14mr94179599qtn.50.1560799122184; 
 Mon, 17 Jun 2019 12:18:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 106/459] drm/amdgpu/discovery: add module param for ip
 discovery enablement
Date: Mon, 17 Jun 2019 14:11:07 -0500
Message-Id: <20190617191700.17899-95-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4tPrFamcRKBz2mMxB4EY4ODAcd02e7qkZUIY6kzfqI=;
 b=LiI4fBNgFdiwG67pnZjdXcHEcAh2+fl1RJYY4KaB1p3Sb/4m16dCXofcP/gOciF8Xf
 Zkz98wwYZszk+YpwxKKsnttF94aSYatf5JcXCmqyMfbA06Xwbv+OMqY1J9zR6QlLrVGY
 KLi7V1C/fHN+cvV3k4pjR8HfaphhjN0c4dbCccHbk7XVdlscGGnGcGk1WAVCdTCR+YsB
 QSzVNYhRxPY7MXRlmALqwvT83J5lnrougeXkIz78ew+VQxiJqrRTJ5pj+nLnw6Y2/t8g
 qCPs4g3z/x+QAHZQT/sHai4c7joEMLNy1z2F0szgtkh4Lbr/n3UbDlgkDdP4PCjcmwf/
 x/2w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaCAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgICAgfCAgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCAwMDBlZjJkZGRkN2Uu
LmI0YTg4N2U0MjM3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTE2MSw2
ICsxNjEsNyBAQCBleHRlcm4gaW50IGFtZGdwdV9yYXNfZW5hYmxlOwogZXh0ZXJuIHVpbnQgYW1k
Z3B1X3Jhc19tYXNrOwogZXh0ZXJuIGludCBhbWRncHVfYXN5bmNfZ2Z4X3Jpbmc7CiBleHRlcm4g
aW50IGFtZGdwdV9tY2JwOworZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5OwogCiAjaWZkZWYg
Q09ORklHX0RSTV9BTURHUFVfU0kKIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggMzQ3YTFiYTBhYmU5
Li5mYWNmNmFlNzkwNDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKQEAgLTI1NzcsNiArMjU3NywxNCBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogCWlmIChhbWRncHVfbWNicCkKIAkJRFJNX0lORk8oIk1D
QlAgaXMgZW5hYmxlZFxuIik7CiAKKwlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSkgeworCQlyID0gYW1k
Z3B1X2Rpc2NvdmVyeV9pbml0KGFkZXYpOworCQlpZiAocikgeworCQkJZGV2X2VycihhZGV2LT5k
ZXYsICJhbWRncHVfZGlzY292ZXJ5X2luaXQgZmFpbGVkXG4iKTsKKwkJCXJldHVybiByOworCQl9
CisJfQorCiAJLyogZWFybHkgaW5pdCBmdW5jdGlvbnMgKi8KIAlyID0gYW1kZ3B1X2RldmljZV9p
cF9lYXJseV9pbml0KGFkZXYpOwogCWlmIChyKQpAQCAtMjgzMiw2ICsyODQwLDggQEAgdm9pZCBh
bWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJZGV2aWNlX3Jl
bW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BjaWVfcmVwbGF5X2NvdW50KTsKIAlhbWRn
cHVfdWNvZGVfc3lzZnNfZmluaShhZGV2KTsKIAlhbWRncHVfZGVidWdmc19wcmVlbXB0X2NsZWFu
dXAoYWRldik7CisJaWYgKGFtZGdwdV9kaXNjb3ZlcnkpCisJCWFtZGdwdV9kaXNjb3ZlcnlfZmlu
aShhZGV2KTsKIH0KIAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5k
ZXggMDA3NTNmOWI4YjUyLi5iMjI1OThhMzAxMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKQEAgLTEzOCw2ICsxMzgsNyBAQCB1aW50IGFtZGdwdV9zbXVfbWVtb3J5
X3Bvb2xfc2l6ZSA9IDA7CiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21hc2sgPSAwOwogaW50IGFt
ZGdwdV9hc3luY19nZnhfcmluZyA9IDE7CiBpbnQgYW1kZ3B1X21jYnAgPSAwOworaW50IGFtZGdw
dV9kaXNjb3ZlcnkgPSAwOwogCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7
CiAJLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLApAQCAtNTc5
LDYgKzU4MCwxMCBAQCBNT0RVTEVfUEFSTV9ERVNDKG1jYnAsCiAJIkVuYWJsZSBNaWQtY29tbWFu
ZCBidWZmZXIgcHJlZW1wdGlvbiAoMCA9IGRpc2FibGVkIChkZWZhdWx0KSwgMSA9IGVuYWJsZWQp
Iik7CiBtb2R1bGVfcGFyYW1fbmFtZWQobWNicCwgYW1kZ3B1X21jYnAsIGludCwgMDQ0NCk7CiAK
K01PRFVMRV9QQVJNX0RFU0MoZGlzY292ZXJ5LAorCSJBbGxvdyBkcml2ZXIgdG8gZGlzY292ZXIg
aGFyZHdhcmUgSVBzIGZyb20gSVAgRGlzY292ZXJ5IHRhYmxlIGF0IHRoZSB0b3Agb2YgVlJBTSIp
OworbW9kdWxlX3BhcmFtX25hbWVkKGRpc2NvdmVyeSwgYW1kZ3B1X2Rpc2NvdmVyeSwgaW50LCAw
NDQ0KTsKKwogI2lmZGVmIENPTkZJR19IU0FfQU1ECiAvKioKICAqIERPQzogc2NoZWRfcG9saWN5
IChpbnQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
