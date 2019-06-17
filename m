Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FAB48DE3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFA28935A;
	Mon, 17 Jun 2019 19:17:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C90689308
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:41 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so12134814qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CkPzIw5s3BD0Zgt40djIZsqAAWZoKTAXvtbb0J7L1yI=;
 b=BNnCrNj2mSLtMAcIXjQNh/JO/cvAG0BrZeN0+TwSl/UCuAtevsJzG/dZfozPOvjkq9
 1T/QpsKLToL5IGprmwdoZhH897nZEybfFdpJpUm1S6O/QrEtZyia8Tm8ROg1Vgowpn8P
 pb4FVRa025aSzvqpO2t/FdLQACVkjVrdCwDWNqLAc2XlzTUKMVU6Fl/cw2q9ruVSBvcm
 v47bZp1rz6eRPhrvjWv/cifLacBbdXZZnCtkl5udilFiDBfHmb6oCnEbn6aN7YZN8rIC
 +LDTdQrxlwjy3KAI+WB2aDf3TIXgY6xpAnYOkbG1L7BG4oMTFQAjpuk/jzXfh6XF7cbT
 rgnQ==
X-Gm-Message-State: APjAAAUfThgD/qvjR4onn5lg6TIttFAzxKvXDXY/SfE/V0FKfG8ZIsxW
 sDRLFuhugxyBSiGUbYcK06RQxa3bq1E=
X-Google-Smtp-Source: APXvYqyXzX3ndp4Ont5lbB9xPYp54x3wVSs+voQU4KeSD++m8B3bx+d8rGhnoIxuza3giDTv/PmUwg==
X-Received: by 2002:a0c:91ef:: with SMTP id r44mr4612539qvr.113.1560799060553; 
 Mon, 17 Jun 2019 12:17:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 037/459] drm/amdgpu: acquire available gfx queues
Date: Mon, 17 Jun 2019 14:09:58 -0500
Message-Id: <20190617191700.17899-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkPzIw5s3BD0Zgt40djIZsqAAWZoKTAXvtbb0J7L1yI=;
 b=TCRMsNZS87gSHc13Bj51xnmFAUchrL6e03k0EuiDkMImr3xQWTuw5z2z4I5BGRXrI/
 NNBnG2/M5TxB3cSmRZmUPSlCNgTSWL7oRZf4Ra92mFpB1FebCO8l8OldPHobSWwOf73O
 1XTiA6Iys+BMUc4GKpktLZbpWDX1+V3fherOU0QLQn1DqqaN+oO+aC+z9wpee26Op2Af
 3FPYJ64h8zrLsl07gbbbuivu/VMhjmmMAijgMJuLi+Q1HsrHVMBfdn4NKL3D01tc3qNx
 jG/ti8JsanOLRlLWvfZhIBL2qbYItnwv8o+p7pzhotBBigX3Yhp6X6JyEQAaOIYp8Swp
 Ev1g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <jack.xiao@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKY3VycmVudGx5LCBh
bWRncHUgd2lsbCBvd25zIHRoZSBmaXJzdCBnZnggcXVldWUgb2YgZWFjaCBwaXBlCnRoZXkgYXJl
OgptZTowIHBpcGU6MCBxdWV1ZTowCm1lOjAgcGlwZToxIHF1ZXVlOjAKClNpZ25lZC1vZmYtYnk6
IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sg
WGlhbyA8amFjay54aWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dmeC5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwppbmRleCA5OTc5MzJlYmJi
ODMuLjg1NWVmZjgzNGUyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YwpAQCAtMTk5LDYgKzE5OSwzMCBAQCB2b2lkIGFtZGdwdV9nZnhfY29tcHV0ZV9xdWV1ZV9hY3F1
aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlhZGV2LT5nZngubnVtX2NvbXB1dGVf
cmluZ3MgPSBBTURHUFVfTUFYX0NPTVBVVEVfUklOR1M7CiB9CiAKK3ZvaWQgYW1kZ3B1X2dmeF9n
cmFwaGljc19xdWV1ZV9hY3F1aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWlu
dCBpLCBxdWV1ZSwgcGlwZSwgbWU7CisKKwlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9HRlhf
UVVFVUVTOyArK2kpIHsKKwkJcXVldWUgPSBpICUgYWRldi0+Z2Z4Lm1lLm51bV9xdWV1ZV9wZXJf
cGlwZTsKKwkJcGlwZSA9IChpIC8gYWRldi0+Z2Z4Lm1lLm51bV9xdWV1ZV9wZXJfcGlwZSkKKwkJ
CSUgYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Blcl9tZTsKKwkJbWUgPSAoaSAvIGFkZXYtPmdmeC5t
ZS5udW1fcXVldWVfcGVyX3BpcGUpCisJCSAgICAgIC8gYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Bl
cl9tZTsKKworCQlpZiAobWUgPj0gYWRldi0+Z2Z4Lm1lLm51bV9tZSkKKwkJCWJyZWFrOworCQkv
KiBwb2xpY3k6IGFtZGdwdSBvd25zIHRoZSBmaXJzdCBxdWV1ZSBwZXIgcGlwZSBhdCB0aGlzIHN0
YWdlCisJCSAqIHdpbGwgZXh0ZW5kIHRvIG11bGl0cGxlIHF1ZXVlcyBwZXIgcGlwZSBsYXRlciAq
LworCQlpZiAobWUgPT0gMCAmJiBxdWV1ZSA8IDEpCisJCQlzZXRfYml0KGksIGFkZXYtPmdmeC5t
ZS5xdWV1ZV9iaXRtYXApOworCX0KKworCS8qIHVwZGF0ZSB0aGUgbnVtYmVyIG9mIGFjdGl2ZSBn
cmFwaGljcyByaW5ncyAqLworCWFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzID0KKwkJYml0bWFwX3dl
aWdodChhZGV2LT5nZngubWUucXVldWVfYml0bWFwLCBBTURHUFVfTUFYX0dGWF9RVUVVRVMpOwor
fQorCiBzdGF0aWMgaW50IGFtZGdwdV9nZnhfa2lxX2FjcXVpcmUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJCQkJICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiB7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggNjhmN2QzY2Y0ZmEyLi4xYzVkMTJlYWU1
YTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTMzNSw2ICsz
MzUsOCBAQCBpbnQgYW1kZ3B1X2dmeF9jb21wdXRlX21xZF9zd19pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogdm9pZCBhbWRncHVfZ2Z4X2NvbXB1dGVfbXFkX3N3X2Zpbmkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCiB2b2lkIGFtZGdwdV9nZnhfY29tcHV0ZV9xdWV1ZV9h
Y3F1aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKK3ZvaWQgYW1kZ3B1X2dmeF9ncmFw
aGljc19xdWV1ZV9hY3F1aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwogaW50IGFt
ZGdwdV9nZnhfcXVldWVfdG9fYml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbWVj
LAogCQkJICAgIGludCBwaXBlLCBpbnQgcXVldWUpOwogdm9pZCBhbWRncHVfZ2Z4X2JpdF90b19x
dWV1ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGJpdCwKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
