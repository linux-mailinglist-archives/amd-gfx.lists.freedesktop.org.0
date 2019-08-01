Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEB7E431
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1997D6E7EA;
	Thu,  1 Aug 2019 20:30:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF736E7E6
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d79so53056407qke.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZA6iharJ/OBnImI38BGMfDstZo0rkpQG0XM4qhC+zi4=;
 b=mNlkPsbWk8HpyxFkoOD/QYrr2jDwkS0vOk52XcZRvC3h+TXGGvXFYtv2BjmtULaPbK
 pRP/xu9K2JwBZbbOOcwF1XNlPePj4L+/erGgA2k9VVIqQnd1rUqZuqCaaT9qCiz+Ab3r
 NzYcvmTtNJnikR8KkMc0dpNCvSir+Fu2H+8H1nekVNqUYq4UL/LMiypfBZqxlff2LP98
 SC6HRx82/B9rDmcK0XiS3bgxL7UNo4i3lDhF/d7dW3J5lKKIVpttql09cDhvlmad3U2d
 U8lJ1qO6baMFqGtO0v8qJqxcNNZqzG7p1/RyVL+xg5HXfpMVbNnmViAzeAGcqnXUssZr
 3Zeg==
X-Gm-Message-State: APjAAAV+MFsahEcqP0EG/1rg4wHeMQ62urZsoKC8dY8oRD0RZyaITAgS
 sbhM9mfkqzT5Qq7LCwDUVBzVfmgT
X-Google-Smtp-Source: APXvYqxMmLxHhdV225aJtO7d/J5N8s62YNQLE76Aq/ebBMV6mioAy9KwHOrG6bvXna2AKfxkSvEGAQ==
X-Received: by 2002:a37:a14e:: with SMTP id k75mr88643927qke.65.1564691427627; 
 Thu, 01 Aug 2019 13:30:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/36] drm/amdgpu/smu11: add smu support for navi12
Date: Thu,  1 Aug 2019 15:29:46 -0500
Message-Id: <20190801202957.29791-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZA6iharJ/OBnImI38BGMfDstZo0rkpQG0XM4qhC+zi4=;
 b=T2Kog90T8itpILDtJ7zn7Qs798jyhcgpnxxYlzJZV1RxgNA9E7worDRpkCSoDerFe/
 dWa6S0eJnbnNS/qm8AJZb0r/r78d37mwdrZ6Z0Egh9ZrsvGf27gyahWPcJYZbLhDGUKT
 +gWsIYqlelVfBk+D77YPpz7Rr9vr45ZDIGB+jbDQlF0yoWx0iCjg/baKL7NDCwBfpMrU
 VTU7jnBqeiVFWxQUD8XI0XEy4bhAkdpDFoqvt8Zr3Mk7CNfKDnC7JSi/77KJO4b6PGra
 AyuvKRxJxefgcl9MJphd/J1Pb+hZ5aSDIB/xBWD9sL4xJ7Qtz+ksoVG+kcq+vOtuud4C
 LzgQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Evan Quan <evan.quan@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgb3RoZXIg
TmF2aSBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKaW5kZXggNDY5NzZjOTA4NDNiLi41YTYxM2RmMTc0ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTcyMCw2ICs3MjAsNyBAQCBzdGF0aWMgaW50
IHNtdV9zZXRfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBDSElQX1ZF
R0EyMDoKIAljYXNlIENISVBfTkFWSTEwOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CisJY2FzZSBDSElQ
X05BVkkxMjoKIAljYXNlIENISVBfQVJDVFVSVVM6CiAJCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJl
ICYgUFBfT1ZFUkRSSVZFX01BU0spCiAJCQlzbXUtPm9kX2VuYWJsZWQgPSB0cnVlOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA0M2ZjYmRiYmE2MzAuLjg0
ZWIxNGE2NjUwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMK
QEAgLTQ2LDYgKzQ2LDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvdmVnYTIwX3NtYy5iaW4i
KTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVzX3NtYy5iaW4iKTsKIE1PRFVMRV9G
SVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9zbWMuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdw
dS9uYXZpMTRfc21jLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEyX3NtYy5i
aW4iKTsKIAogI2RlZmluZSBTTVUxMV9WT0xUQUdFX1NDQUxFIDQKIApAQCAtMTYzLDYgKzE2NCw5
IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211KQogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOwogCQli
cmVhazsKKwljYXNlIENISVBfTkFWSTEyOgorCQljaGlwX25hbWUgPSAibmF2aTEyIjsKKwkJYnJl
YWs7CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQpAQCAtMTMzMSw2ICsxMzM1LDcgQEAgc3RhdGlj
IGludCBzbXVfdjExXzBfZ2Z4X29mZl9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBi
b29sIGVuYWJsZSkKIAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBfTkFW
STE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWlmICghKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQ
UF9HRlhPRkZfTUFTSykpCiAJCQlyZXR1cm4gMDsKIAkJbXV0ZXhfbG9jaygmc211LT5tdXRleCk7
CkBAIC0xNzU0LDYgKzE3NTksNyBAQCB2b2lkIHNtdV92MTFfMF9zZXRfc211X2Z1bmNzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgogCWNhc2Ug
Q0hJUF9OQVZJMTQ6CisJY2FzZSBDSElQX05BVkkxMjoKIAkJbmF2aTEwX3NldF9wcHRfZnVuY3Mo
c211KTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
