Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B369DFA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2BC89DD2;
	Mon, 15 Jul 2019 21:24:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7956789DC5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so17251555qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEib4y+gyXA7MVlUm4m2vGm8dQr9wolaxno+lPrcAaE=;
 b=B3k8XcY9mNoYmm0k9uIGLE3YI/SExx8YcW5bagsZfTVPHVNcGBGYxGT2gMt77xbgBe
 X7qQjb+DcvZBWwU8DV+rS5HorLL2gcJYbZEqFtyuWYXgVzXbFXgILW/NwcJE5YnDnQs4
 M/FnsICg+98lZm9B2cMIibRvogpGA6FCAa/QPQe9ER8JT5RIOhMI3YP0mq3K344W8ZGG
 B5ZZQX3u6W0LxGY1SnWZ6aqbFB32EwC7N2tk8CArzSaDOnQ28x7EyQHSuoVzSBQrCS2F
 h5c2HyS1MaALjaQ2Mk2X8U2C4wU42GZWL7H7Y+SYPnVu7S3l/Un/3O87UXmyHimkuqmA
 f7Bw==
X-Gm-Message-State: APjAAAWoNEGnU93SxnwubrpaXIY31K/aMht2TWWisTe/1MsOXgquV8Ra
 wtpqeBZZi8UXGhWCmBtwWZdngy8X
X-Google-Smtp-Source: APXvYqzoxb8z3UcmhDnsTHZVuvJJWkj51DfTzlCw6qPbB0mGpHhkDqcjDeFbtkQ8x62JVKAwLg47vg==
X-Received: by 2002:ac8:28e2:: with SMTP id j31mr19927316qtj.274.1563225891361; 
 Mon, 15 Jul 2019 14:24:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 008/102] drm/amdgpu: add new member in amdgpu_device for vmhub
 counts per asic chip
Date: Mon, 15 Jul 2019 16:23:03 -0500
Message-Id: <20190715212437.31793-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEib4y+gyXA7MVlUm4m2vGm8dQr9wolaxno+lPrcAaE=;
 b=qf7pBpk2XIdbWe6ifpCaf+tupxgrfGNyn47SpfTL44iZ9O4WkNxzZDGPOMsVl9Idll
 AqcKNe/FbsQbzKCmFGUpmPjEHSnb0jcYHMieQZT3Q5JbI5RTCpVNk7u65ukXOF+oB6Ly
 XRaHXJwLgM173GVhg4iKsW3k2urKEUkwNax0YnZAa1XzF/pIiIFqxf8MV+XCVwCiPaYu
 H6V7qqM/5TVXT8BfjQjxL4wDFbVVqwpoTuVOlWO8OBtgiM7sy17ry+Ir13O6uH197tr1
 qIZDV6SxbpIGA7qrfeGbjmACxijjV5tKtaU9cnqHVhnh2q0E63W1j8/ogBzmTu/Dv+5O
 LL1A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpJdCBhaW1zIHRvIHJlcGxhY2UgQU1ER1BVX01B
WF9WTUhVQlMgaW4gZm9yIGxvb3AgdG8gaW5pdGlhbGl6ZSByZWdpc3RlcnMuCgpTaWduZWQtb2Zm
LWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAg
MSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICB8IDEwICsrKysrKyst
LS0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggMmNkZjQ2YmJlZGRmLi5hZWNiNGY3Zjlj
NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC04MzksNiArODM5LDcgQEAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgewogCWRtYV9hZGRyX3QJCQlkdW1teV9wYWdlX2FkZHI7CiAJ
c3RydWN0IGFtZGdwdV92bV9tYW5hZ2VyCXZtX21hbmFnZXI7CiAJc3RydWN0IGFtZGdwdV92bWh1
YiAgICAgICAgICAgICB2bWh1YltBTURHUFVfTUFYX1ZNSFVCU107CisJdW5zaWduZWQJCQludW1f
dm1odWJzOwogCiAJLyogbWVtb3J5IG1hbmFnZW1lbnQgKi8KIAlzdHJ1Y3QgYW1kZ3B1X21tYW4J
CW1tYW47CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IDhjZmMzYWEz
MjM5MS4uYTBiZDE0ZTliOGZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAu
YwpAQCAtNjAzLDYgKzYwMyw3IEBAIHN0YXRpYyBpbnQgZ21jX3YxMF8wX3N3X2luaXQodm9pZCAq
aGFuZGxlKQogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoK
IAljYXNlIENISVBfTkFWSTE0OgorCQlhZGV2LT5udW1fdm1odWJzID0gMjsKIAkJLyoKIAkJICog
VG8gZnVsZmlsbCA0LWxldmVsIHBhZ2Ugc3VwcG9ydCwKIAkJICogdm0gc2l6ZSBpcyAyNTZUQiAo
NDhiaXQpLCBtYXhpbXVtIHNpemUgb2YgTmF2aTEwL05hdmkxNCwKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jCmluZGV4IGFmMmE0MzA1ZDZiYy4uNmQ0MjEyNDA2YzFjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTI4MCw3ICsyODAsNyBAQCBzdGF0aWMg
aW50IGdtY192OV8wX3ZtX2ZhdWx0X2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAogCXN3aXRjaCAoc3RhdGUpIHsKIAljYXNlIEFNREdQVV9JUlFfU1RBVEVfRElT
QUJMRToKLQkJZm9yIChqID0gMDsgaiA8IEFNREdQVV9NQVhfVk1IVUJTOyBqKyspIHsKKwkJZm9y
IChqID0gMDsgaiA8IGFkZXYtPm51bV92bWh1YnM7IGorKykgewogCQkJaHViID0gJmFkZXYtPnZt
aHViW2pdOwogCQkJZm9yIChpID0gMDsgaSA8IDE2OyBpKyspIHsKIAkJCQlyZWcgPSBodWItPnZt
X2NvbnRleHQwX2NudGwgKyBpOwpAQCAtMjkxLDcgKzI5MSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5
XzBfdm1fZmF1bHRfaW50ZXJydXB0X3N0YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQl9CiAJCWJyZWFrOwogCWNhc2UgQU1ER1BVX0lSUV9TVEFURV9FTkFCTEU6Ci0JCWZvciAoaiA9
IDA7IGogPCBBTURHUFVfTUFYX1ZNSFVCUzsgaisrKSB7CisJCWZvciAoaiA9IDA7IGogPCBhZGV2
LT5udW1fdm1odWJzOyBqKyspIHsKIAkJCWh1YiA9ICZhZGV2LT52bWh1YltqXTsKIAkJCWZvciAo
aSA9IDA7IGkgPCAxNjsgaSsrKSB7CiAJCQkJcmVnID0gaHViLT52bV9jb250ZXh0MF9jbnRsICsg
aTsKQEAgLTQxNSw3ICs0MTUsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVfdGxi
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWNvbnN0IHVuc2lnbmVkIGVuZyA9IDE3Owog
CXVuc2lnbmVkIGksIGo7CiAKLQlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9WTUhVQlM7ICsr
aSkgeworCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1fdm1odWJzOyArK2kpIHsKIAkJc3RydWN0
IGFtZGdwdV92bWh1YiAqaHViID0gJmFkZXYtPnZtaHViW2ldOwogCQl1MzIgdG1wID0gZ21jX3Y5
XzBfZ2V0X2ludmFsaWRhdGVfcmVxKHZtaWQsIGZsdXNoX3R5cGUpOwogCkBAIC05NzYsNiArOTc2
LDggQEAgc3RhdGljIGludCBnbWNfdjlfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlhZGV2LT5n
bWMudnJhbV90eXBlID0gYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV90eXBlKGFkZXYpOwog
CXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1JBVkVOOgorCQlhZGV2LT5u
dW1fdm1odWJzID0gMjsKKwogCQlpZiAoYWRldi0+cmV2X2lkID09IDB4MCB8fCBhZGV2LT5yZXZf
aWQgPT0gMHgxKSB7CiAJCQlhbWRncHVfdm1fYWRqdXN0X3NpemUoYWRldiwgMjU2ICogMTAyNCwg
OSwgMywgNDgpOwogCQl9IGVsc2UgewpAQCAtOTg4LDYgKzk5MCw4IEBAIHN0YXRpYyBpbnQgZ21j
X3Y5XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENI
SVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CisJCWFkZXYtPm51bV92bWh1YnMgPSAyOwor
CiAJCS8qCiAJCSAqIFRvIGZ1bGZpbGwgNC1sZXZlbCBwYWdlIHN1cHBvcnQsCiAJCSAqIHZtIHNp
emUgaXMgMjU2VEIgKDQ4Yml0KSwgbWF4aW11bSBzaXplIG9mIFZlZ2ExMCwKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
