Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABC7CB37
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D3F6E2BD;
	Wed, 31 Jul 2019 17:58:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169C96E1B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:47 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id s16so13797168vke.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZdR4SCZ5sAt5FVPcCnWuF3WRovyBIMKtQQG54KgCwI=;
 b=tKlgSC8MUTGWT39Hi199R4Huz0BvqZ59C20YG77WOYQdvu5uW9u1zaCQmr84eFhtMk
 9BjzrMbSWPYbU4LeqCNQE3bcJ4R/mU2wXxUwPOnUtiOdsGs1144xpjeZ/XBVNc/8rs7r
 aNYLZfAPIqTfYzRZpcFNcIyIpYQ5kgPAzAUpRhAHpH7Zaib2poGPM3ZheHLFbX/rP/WM
 tGQAKEgx8V34FQfWUNmTP3gNbJL7lui+g3fDLxkDZPHYYgkgrQ/YZ+/zeFAiSnxOqQ/Q
 C7eMvaX+KWemv1IPrqJnkoxXKjqhetjFP4NMKOg006BNU8HGdLO23Lc4cBzs/uyOH/sb
 Q4bQ==
X-Gm-Message-State: APjAAAWlBSyT+QTO5M8Jse3pgwwoLegLR98LFIveLdR+qwOe+8c/vYvr
 W/h2uQHjRNQg8XXYSGvyzcShgUDt
X-Google-Smtp-Source: APXvYqz76qfvDiqn4ATgwucDHaYQqoxjO5TlP11A9ppgEBGw9arS/yxyUoieZ7Jh/FPI+muiMsga1Q==
X-Received: by 2002:a1f:b0b:: with SMTP id 11mr48283884vkl.64.1564595925926;
 Wed, 31 Jul 2019 10:58:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/26] drm/amdgpu: update interrupt callback for all ras
 clients
Date: Wed, 31 Jul 2019 12:58:10 -0500
Message-Id: <20190731175818.20159-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZdR4SCZ5sAt5FVPcCnWuF3WRovyBIMKtQQG54KgCwI=;
 b=mTap0IJWjukYgsUKBD2A9D98waMCe+81+eFwe/mKpEaUX0NBVMyvRBFGl7rYTI58ZY
 +8Q9KQSJXONdj7I1Wkh3cDBuO8WblR3bNqDNGIESohBr+tY4GMINkpfET2RZ3tC58Yu7
 CuyqQ0E0GqdknSFxnxOj3haaCkGgkMd4rbHzgr++g60Da9kUGsCE0Q1r3faUUVjQcZpZ
 Htr6h6s2ImNajrFzLA8z42FNCw/ljGlKpJbQEKtTVgvokOoRsLVUq6ujh0iD4Or/npgK
 rfqshvi0P2zOsRkH6lv83KG/bYeFQzqD0OQxl7XDXHeuMYtjjFRd2g/w9xeQu1kkCi4q
 /lMg==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKYWRkIGVycl9kYXRhIHBhcmFtZXRl
ciBpbiBpbnRlcnJ1cHQgY2IgZm9yIHJhcyBjbGllbnRzCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhv
dSA8dGFvLnpob3UxQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEZW5uaXMgTGkgPGRlbm5pcy5saUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgIHwgMiArKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKaW5kZXggYmQ3ZjQzMWEyNGQ5Li4wNDg4MDNjNzUwNDggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMzk1MSw2ICszOTUxLDcgQEAgc3RhdGljIGludCBnZnhf
djlfMF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIH0KIAogc3RhdGljIGludCBnZnhfdjlfMF9w
cm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQlzdHJ1Y3Qg
cmFzX2Vycl9kYXRhICplcnJfZGF0YSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkp
OwogCiBzdGF0aWMgaW50IGdmeF92OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQpAQCAt
NTI2NSw2ICs1MjY2LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9wcml2X2luc3RfaXJxKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogfQogCiBzdGF0aWMgaW50IGdmeF92OV8wX3Byb2Nlc3Nf
cmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCXN0cnVjdCByYXNfZXJy
X2RhdGEgKmVycl9kYXRhLAogCQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKIHsKIAkv
KiBUT0RPIHVlIHdpbGwgdHJpZ2dlciBhbiBpbnRlcnJ1cHQuICovCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwppbmRleCBhMDJiYzYzM2E4OWEuLmVlMDZjYmUyYTdlNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC0yMzksMTIgKzIzOSwxMiBAQCBzdGF0
aWMgaW50IGdtY192OV8wX2VjY19pbnRlcnJ1cHRfc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiB9CiAKIHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJc3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2RhdGEs
CiAJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQogewotCXN0cnVjdCByYXNfZXJyX2Rh
dGEgZXJyX2RhdGEgPSB7MCwgMH07CiAJa2dkMmtmZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5r
ZmQuZGV2KTsKIAlpZiAoYWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCi0J
CWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYsICZlcnJfZGF0YSk7
CisJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYsIGVycl9kYXRh
KTsKIAlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsKIAlyZXR1cm4gQU1ER1BVX1JBU19V
RTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggMzZkYzUwMjVj
NDYxLi4yZmZjOWE0MWQ4YjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
CkBAIC0xNjI0LDYgKzE2MjQsNyBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9lYXJseV9pbml0KHZv
aWQgKmhhbmRsZSkKIH0KIAogc3RhdGljIGludCBzZG1hX3Y0XzBfcHJvY2Vzc19yYXNfZGF0YV9j
YihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJc3RydWN0IHJhc19lcnJfZGF0YSAqZXJy
X2RhdGEsCiAJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KTsKIAogc3RhdGljIGludCBz
ZG1hX3Y0XzBfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKQEAgLTE5NTcsNiArMTk1OCw3IEBAIHN0
YXRpYyBpbnQgc2RtYV92NF8wX3Byb2Nlc3NfdHJhcF9pcnEoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiB9CiAKIHN0YXRpYyBpbnQgc2RtYV92NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCXN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRh
LAogCQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKIHsKIAl1aW50MzJfdCBpbnN0YW5j
ZSwgZXJyX3NvdXJjZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
