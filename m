Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F948EF4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F7B89A94;
	Mon, 17 Jun 2019 19:28:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443EE89AFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:32 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id m29so12252273qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laDRHEotLc/Ki4yW6xJJ5cL3ejokoHfdxWkVXltuvHU=;
 b=as+ZKuFqtGiPjPy/VDOkkaRVDjLXgS9acJbIrM1N1k8HOu1y1oD0/nW4uYfSjv5X6c
 bXCxtDGUDNbiyxyXqgMFsMe7RkSLFu65iffgKj1Pif0guTbcun6A0eEvQ15YbbfXiQBR
 yeb/JjGCW7r9HoA7qJrXYm3wsfkWxpWx06I1R0dN7OGQtOXQZA/hM58F4Gj947TRh0kq
 t3RslDS16L1y4hn/AfhL2+Qaf4U/3LaWCfvsYww5fjZlR7OPcso5iB9YGAkpnjchS5qx
 5YNAue2wHe/9/ucrH6Oh11EgGeMkrt5Nrgl9SsMnkfXI2JSqRpBskI/xBexrzdwTCWdU
 aOKA==
X-Gm-Message-State: APjAAAXSrQqye5tK+8r1o2chHJQtBlIA7amF6twOyZxvdclmk7C/uvXm
 Q9Auifed5bbo4DVW5Fj4Egvw0jzqOGE=
X-Google-Smtp-Source: APXvYqyA6B34V6i9Fe1vHCQBzy4alNIi8obpWCl91qWQwB9+47xANkX72lLqcfs0+LKNMF8PVmfYQw==
X-Received: by 2002:a0c:d238:: with SMTP id m53mr22062838qvh.161.1560799710431; 
 Mon, 17 Jun 2019 12:28:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 184/459] drm/amd/powerplay: move getting MAX_FAN_RPM value to
 asic level
Date: Mon, 17 Jun 2019 14:26:49 -0500
Message-Id: <20190617192704.18038-85-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laDRHEotLc/Ki4yW6xJJ5cL3ejokoHfdxWkVXltuvHU=;
 b=QxpiRDpeobjE01/P+2NbRAJRWlA/tPHa7KROyH6p+YwUUaLVyPwzG27Ec9FW4eElUs
 PQEObfqccnHIDyTw/qYtl6SMmmszAglgWVuzUhNekSPdXqbd0sixpfdKKUGOHelxotFo
 5NguUnWcUsYapqbMqUCv+xGXLg/Tf9snaCr2oGSkHHM8HUr8IpyEZOmyKehkKiEqkcGr
 S6imVUc4g7HY8huLqvZJzFVEM9UKbaU41vFRFNfWgWaM515cWvxcjpOWPQXppBsJVxQ8
 uLa8I0m7fTFRJqtLBiMHLW9IUluSkBAiXBsvmbpuxI6YE7W/esWxAZOGFQNSHlp3NjNQ
 l1aw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkdldHRpbmcgTUFYX0ZBTl9SUE0g
dmFsdWUgbmVlZHMgdG8gYmUgcmVhZCBieSBwcHRhYmxlLCBzbyBpdCBzaG91bGQgYmUgbW92ZWQg
dG8KYXNpYyBsZXZlbC4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgIHwgNiAtLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDI0M2YwZWE5MjU5Zi4uZTRmYmY4ZGQ1N2IyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMTMwMiw4ICsxMzAy
LDYgQEAgc3RhdGljIGludCBzbXVfdjExXzBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiAJCQkJIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAogCQkJCSB2b2lkICpkYXRh
LCB1aW50MzJfdCAqc2l6ZSkKIHsKLQlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxlX2Nv
bnRleHQgPSAmc211LT5zbXVfdGFibGU7Ci0JUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29u
dGV4dC0+ZHJpdmVyX3BwdGFibGU7CiAJaW50IHJldCA9IDA7CiAJc3dpdGNoIChzZW5zb3IpIHsK
IAljYXNlIEFNREdQVV9QUF9TRU5TT1JfR1BVX0xPQUQ6CkBAIC0xMzM5LDEwICsxMzM3LDYgQEAg
c3RhdGljIGludCBzbXVfdjExXzBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAJCSoodWludDMyX3QgKilkYXRhID0gMDsKIAkJKnNpemUgPSA0OwogCQlicmVhazsKLQljYXNl
IEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06Ci0JCSoodWludDMyX3QgKilkYXRhID0gcHB0
YWJsZS0+RmFuTWF4aW11bVJwbTsKLQkJKnNpemUgPSA0OwotCQlicmVhazsKIAlkZWZhdWx0Ogog
CQlyZXQgPSBzbXVfY29tbW9uX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKTsK
IAkJYnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5k
ZXggNTdlZmUxNDVlNmZlLi5lOWYwMjMwZmMyNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTI5NTAsNiArMjk1MCw4IEBAIHN0YXRpYyBpbnQgdmVn
YTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJICAgICAgdm9pZCAq
ZGF0YSwgdWludDMyX3QgKnNpemUpCiB7CiAJaW50IHJldCA9IDA7CisJc3RydWN0IHNtdV90YWJs
ZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+c211X3RhYmxlOworCVBQVGFibGVfdCAq
cHB0YWJsZSA9IHRhYmxlX2NvbnRleHQtPmRyaXZlcl9wcHRhYmxlOwogCiAJc3dpdGNoIChzZW5z
b3IpIHsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfVVZEX1BPV0VSOgpAQCAtMjk2MCw2ICsyOTYy
LDEwIEBAIHN0YXRpYyBpbnQgdmVnYTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LAogCQkqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBT
TVVfRkVBVFVSRV9EUE1fVkNFX0JJVCkgPyAxIDogMDsKIAkJKnNpemUgPSA0OwogCQlicmVhazsK
KwljYXNlIEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06CisJCSoodWludDMyX3QgKilkYXRh
ID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKKwkJKnNpemUgPSA0OworCQlicmVhazsKIAlkZWZh
dWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
