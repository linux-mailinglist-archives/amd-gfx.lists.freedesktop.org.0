Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AB48E1D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B34789624;
	Mon, 17 Jun 2019 19:18:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FB3896C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:33 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so12129572qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4eoHcdG0pBESXjCbux4SP7s6Kzmi0oT/X9Ohnhr2DU=;
 b=X+6SgXzIJCMNDi5gGSRjz2WwwEmCYf86pmb1mlcPZoaA0tgANxmfFTzcXtLpxnwyjO
 7/Rz6EI2ogVkRoust1WUCA5xHuvW5pze0Y1xk26Y4xwQAJCy67cG8jSp4HPZKsMbDYD4
 WwfMzVinlelXrTh9UQAL/xd3bZSMTM3THh1z5IduyVyJIa1V5jqQAvmPLdYiZ9U/xfrO
 wPNHHeWrGmN7HXVXIy6bzgEKfqbwGOvB0osx0vk9rfneXM71FGRtS4LwbXTIkPLaKXnh
 N3qvKAa0X4t4WC7qi6+LaAjdNzq3jv0rI7f44SobwL20Jg1TXwTp8bac0dBakRmOxVLw
 Xw/g==
X-Gm-Message-State: APjAAAXND/Bwylz5rRixXco42Fyj/eR8NxQjLg/5mx2TthXkuW85MyVP
 FHIWSzYwCCu6otz9CiJ3gOS8ugnHnZI=
X-Google-Smtp-Source: APXvYqyZKqPPdhkz3FwT72quSdFtFo7iDzYlP5fBTxXqPiamVhFPzEsEpKy02terFBsTo1Hmvwvsuw==
X-Received: by 2002:ac8:3037:: with SMTP id f52mr96272959qte.364.1560799110939; 
 Mon, 17 Jun 2019 12:18:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 093/459] drm/amdgpu/sdma: allocate CSA per sdma ring
Date: Mon, 17 Jun 2019 14:10:54 -0500
Message-Id: <20190617191700.17899-82-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4eoHcdG0pBESXjCbux4SP7s6Kzmi0oT/X9Ohnhr2DU=;
 b=oSaHJg0Yi1jO1fX09JBaAsnC54eRmbNwgEd/NbnxOB1VyI+3qXKUqCXzahbEOZMmg9
 nND9024sS9oZMwpaZI4/FP52Ytc20yiPJrP0ZRDwVNrVmnKvyx1EHvY14D4DO9kvuqjc
 NVVYsphm8Ey8f5w7yzd6VgdSfTVxzEQUprnfTdtsUWgfnpcfAfjObttLGSIQiwrqCZkZ
 5BDd1wS/r3UGbczxsPCzI7JpUmahcmnjSFdNVQE8wfEiSB17VqmMOZkOtMzWPaMwsYHp
 LvarIVYF7PDJXKsDnHWSTS2Lfn8ey3bdkg/tnwTzWf3m9Sx0LX8oWz7Oi1jsOx5/hBf4
 oCyA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFsbG9jYXRlIENTQSBmb3IgdGhl
IGdpdmVuIHNkbWEgcmluZy4KCkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5jIHwgMjcgKysrKysrKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5o
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5jCmluZGV4IDExNWJiMGM5
OWIwZi4uN2RkZmZiZjY1OTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfc2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9z
ZG1hLmMKQEAgLTI0LDYgKzI0LDEwIEBACiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAi
YW1kZ3B1X3NkbWEuaCIKIAorI2RlZmluZSBBTURHUFVfQ1NBX1NETUFfU0laRSA2NAorLyogU0RN
QSBDU0EgcmVzaWRlIGluIHRoZSAzcmQgcGFnZSBvZiBDU0EgKi8KKyNkZWZpbmUgQU1ER1BVX0NT
QV9TRE1BX09GRlNFVCAoNDA5NiAqIDIpCisKIC8qCiAgKiBHUFUgU0RNQSBJUCBibG9jayBoZWxw
ZXJzIGZ1bmN0aW9uLgogICovCkBAIC01NiwzICs2MCwyNiBAQCBpbnQgYW1kZ3B1X3NkbWFfZ2V0
X2luZGV4X2Zyb21fcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90ICppbmRl
eCkKIAogCXJldHVybiAtRUlOVkFMOwogfQorCit1aW50NjRfdCBhbWRncHVfc2RtYV9nZXRfY3Nh
X21jX2FkZHIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAorCQkJCSAgICAgdW5zaWduZWQgdm1p
ZCkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CisJdWludDY0
X3QgY3NhX21jX2FkZHI7CisJdWludDMyX3QgaW5kZXggPSAwOworCWludCByOworCisJaWYgKHZt
aWQgPT0gMCB8fCAhYW1kZ3B1X21jYnApCisJCXJldHVybiAwOworCisJciA9IGFtZGdwdV9zZG1h
X2dldF9pbmRleF9mcm9tX3JpbmcocmluZywgJmluZGV4KTsKKworCWlmIChyIHx8IGluZGV4ID4g
MzEpCisJCWNzYV9tY19hZGRyID0gMDsKKwllbHNlCisJCWNzYV9tY19hZGRyID0gYW1kZ3B1X2Nz
YV92YWRkcihhZGV2KSArCisJCQlBTURHUFVfQ1NBX1NETUFfT0ZGU0VUICsgCisJCQlpbmRleCAq
IEFNREdQVV9DU0FfU0RNQV9TSVpFOworCisJcmV0dXJuIGNzYV9tY19hZGRyOworfQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmgKaW5kZXggMWJhOWJhM2I1NGY3Li4zNWRk
MTUyZjlkNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9z
ZG1hLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaApAQCAt
OTcsNSArOTcsNSBAQCBzdHJ1Y3QgYW1kZ3B1X2J1ZmZlcl9mdW5jcyB7CiBzdHJ1Y3QgYW1kZ3B1
X3NkbWFfaW5zdGFuY2UgKgogYW1kZ3B1X3NkbWFfZ2V0X2luc3RhbmNlX2Zyb21fcmluZyhzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOwogaW50IGFtZGdwdV9zZG1hX2dldF9pbmRleF9mcm9tX3Jp
bmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCAqaW5kZXgpOwotCit1aW50NjRf
dCBhbWRncHVfc2RtYV9nZXRfY3NhX21jX2FkZHIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1
bnNpZ25lZCB2bWlkKTsKICNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
