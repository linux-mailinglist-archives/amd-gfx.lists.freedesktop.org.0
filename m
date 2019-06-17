Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CF48ED9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86189A1F;
	Mon, 17 Jun 2019 19:28:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4289996
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b18so6928468qkc.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YrWsglx4RYNVdhOskt55tJ3iMLrm3/RY92Cwn2qEiA=;
 b=crwYQLW5Wc42pC4ptHGenO8QV3SfPHjRjU74Q06wEqBbiSiVfBvSdxEBgiVkQeC/OF
 uySqYQG7jPEowK35IY6rB2gqEjoTvsVgSCKUai+TZ1crodIoGVIl5/59aBGf6Ed9eh7B
 o/qghQsK3DFfXGP++wiHQe/6ZFSWVS81lpNFriTUFNZaoZmhPYeA+Kk1m6IUqP9mN+62
 ZduIqjpXqGpcnTz7dZjAqx0vAPYedgGq1SiAdELk4ps+rsRd66aNiKPaSnkJ0b2+pUDy
 K/JqnHC+YDkHOaMVudMAbNPmSgD7QNrvZTyYBWRooewhgEdD5D+HMMURO8x27Xq/EiGD
 AnMQ==
X-Gm-Message-State: APjAAAVih1DA/ZcWgLl1J9J/4RlsXifKJISTFcnmDtiO5rsU/7lQlf82
 8+cj0lI/HX2syqBfbJUxcYQ3JP8XgzQ=
X-Google-Smtp-Source: APXvYqy52uBiHQoctfbnlV2WmKPCH4gsaVdURBHpuZ6ahXy6cT4GBufDaSUVmRa8gwCitgYM3wN5VA==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr32468086qki.24.1560799678221; 
 Mon, 17 Jun 2019 12:27:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 148/459] drm/amd/powerplay: enable backdoor smu fw loading (v2)
Date: Mon, 17 Jun 2019 14:26:13 -0500
Message-Id: <20190617192704.18038-49-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YrWsglx4RYNVdhOskt55tJ3iMLrm3/RY92Cwn2qEiA=;
 b=jZMHCS2B4/7XjuP5haOrJVioBDm/rFAjgIOPOQYyO7ZlHErQdY+TcC9Uzs1RKQ1hYi
 h95fApTbB99RDEVP6UJVPa8kU3zXIu1XWRXx9bajz+6eOzw2qp1x+TsBehUl8+ftW1yT
 rX9cura/cBBnk+blGNtTCDS1Y6MTjC8rBP3AP9cjmhIQiRERlsQjklyg4okh0OqD1Unn
 GkgGJN8+a7mURgaPapcWXoK67ugc9fytBAxveGYaqbT2aPxBKZ7i2QJeEqIfakarsOnM
 yJ88QGUEmTVWZAXXA/TtBBgVaYU1r7OdAejxBv+E5UpmAG7e/aAdKBn/eD5/baV0nio7
 rJMg==
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
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCmVuYWJsZSBiYWNrZG9v
ciBzbXUgZncgbG9hZGluZyBvbiBuYXZpMTAKCnYyOiBzcXVhc2ggaW4gZGVmaW5lIGZpeCAoQWxl
eCkKClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggfCAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgfCAzMyArKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgKaW5kZXggMDJjOTY1ZDY0MjU2Li5j
ZDVlNjZiODJjZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9zbXVfdjExXzAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211
X3YxMV8wLmgKQEAgLTMwLDYgKzMwLDcgQEAKICNkZWZpbmUgTVAwX1NSQU0JCQkweDAzOTAwMDAw
CiAjZGVmaW5lIE1QMV9QdWJsaWMJCQkweDAzYjAwMDAwCiAjZGVmaW5lIE1QMV9TUkFNCQkJMHgw
M2MwMDAwNAorI2RlZmluZSBNUDFfU01DX1NJWkUJCTB4NDAwMDAKIAogLyogYWRkcmVzcyBibG9j
ayAqLwogI2RlZmluZSBzbW5NUDFfRklSTVdBUkVfRkxBR1MJCTB4MzAxMDAyNApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA0ZGNiZjZlZTdlOGUuLjJkNTVi
ODI1NDk3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAg
LTIwNyw2ICsyMDcsMzkgQEAgc3RhdGljIGludCBzbXVfdjExXzBfaW5pdF9taWNyb2NvZGUoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIHN0YXRpYyBpbnQgc211X3YxMV8wX2xvYWRfbWljcm9j
b2RlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogeworCXN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2ID0gc211LT5hZGV2OworCWNvbnN0IHVpbnQzMl90ICpzcmM7CisJY29uc3Qgc3RydWN0IHNt
Y19maXJtd2FyZV9oZWFkZXJfdjFfMCAqaGRyOworCXVpbnQzMl90IGFkZHJfc3RhcnQgPSBNUDFf
U1JBTTsKKwl1aW50MzJfdCBpOworCXVpbnQzMl90IG1wMV9md19mbGFnczsKKworCWhkciA9IChj
b25zdCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92MV8wICopCWFkZXYtPnBtLmZ3LT5kYXRh
OworCXNyYyA9IChjb25zdCB1aW50MzJfdCAqKShhZGV2LT5wbS5mdy0+ZGF0YSArCisJCWxlMzJf
dG9fY3B1KGhkci0+aGVhZGVyLnVjb2RlX2FycmF5X29mZnNldF9ieXRlcykpOworCisJZm9yIChp
ID0gMTsgaSA8IE1QMV9TTUNfU0laRS80IC0gMTsgaSsrKSB7CisJCVdSRUczMl9QQ0lFKGFkZHJf
c3RhcnQsIHNyY1tpXSk7CisJCWFkZHJfc3RhcnQgKz0gNDsKKwl9CisKKwlXUkVHMzJfUENJRShN
UDFfUHVibGljIHwgKHNtbk1QMV9QVUJfQ1RSTCAmIDB4ZmZmZmZmZmYpLAorCQkxICYgTVAxX1NN
Tl9QVUJfQ1RSTF9fUkVTRVRfTUFTSyk7CisJV1JFRzMyX1BDSUUoTVAxX1B1YmxpYyB8IChzbW5N
UDFfUFVCX0NUUkwgJiAweGZmZmZmZmZmKSwKKwkJMSAmIH5NUDFfU01OX1BVQl9DVFJMX19SRVNF
VF9NQVNLKTsKKworCWZvciAoaSA9IDA7IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgewor
CQltcDFfZndfZmxhZ3MgPSBSUkVHMzJfUENJRShNUDFfUHVibGljIHwKKwkJCShzbW5NUDFfRklS
TVdBUkVfRkxBR1MgJiAweGZmZmZmZmZmKSk7CisJCWlmICgobXAxX2Z3X2ZsYWdzICYgTVAxX0ZJ
Uk1XQVJFX0ZMQUdTX19JTlRFUlJVUFRTX0VOQUJMRURfTUFTSykgPj4KKwkJCU1QMV9GSVJNV0FS
RV9GTEFHU19fSU5URVJSVVBUU19FTkFCTEVEX19TSElGVCkKKwkJCWJyZWFrOworCQl1ZGVsYXko
MSk7CisJfQorCisJaWYgKGkgPT0gYWRldi0+dXNlY190aW1lb3V0KQorCQlyZXR1cm4gLUVUSU1F
OworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
