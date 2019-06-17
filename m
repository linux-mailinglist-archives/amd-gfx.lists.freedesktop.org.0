Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9E48DF0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A35D8940F;
	Mon, 17 Jun 2019 19:17:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4D8893A8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:50 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so6888591qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l2aIzNmuMEIDgGei+8v/F2SYqd9TAjpANtCUzXNdwo=;
 b=clFy02I/iskTTvDnzOOPUaKLP54g/pBIRQXDmRFXoL+wMkbxNwbsIg6nDHJJvi2PK5
 hKzFxim3TLzekA7Zie0rh7mn4oKUGvKcr9zdtHuRr71fYiGR1n7nQVVz/NpDFMsPrc4L
 wUEwdxlng7/IKt8MMSuqMyZUPJ3mgKXitGKU7YYgGa5wIgj3DXG7LuJUy2G5MkVWl09Y
 PFr5HboH3lESLTjlolP9AFRcbBb+P+8gFRo5bP4BMdR3NkqVyuG8q+toPZvN3Eaqibg2
 iptlKeH2/CxbQAwC1JkAA8lPTgkzs3xqIS338fNDH1q7ojo91R9XpO/2ec6DnJW2Blb5
 TaJQ==
X-Gm-Message-State: APjAAAWTXp/UgB6jQ4zu6HYj92woBWiKd7KFennROUQ6rVyo8VSlaEnl
 nnP6pP1IvuDtdXjX/0biy5Ei+gPqdKo=
X-Google-Smtp-Source: APXvYqwkC9UaLL2hGgq3IP0YazXH6133byQHMIkai/vm97k+EK5BMsLfyETj7RDcsGFLgLadOX6w1w==
X-Received: by 2002:ac8:1c7b:: with SMTP id j56mr74718525qtk.247.1560799069367; 
 Mon, 17 Jun 2019 12:17:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 047/459] drm/amdgpu: create mqd for gfx queues on navi10
Date: Mon, 17 Jun 2019 14:10:08 -0500
Message-Id: <20190617191700.17899-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2l2aIzNmuMEIDgGei+8v/F2SYqd9TAjpANtCUzXNdwo=;
 b=UrdyBzxncgbTEA0zKZLc3YAFXjaQkmgWlgYdt2dOrGwIs3ScPjFpqSCSKiRIxaKujB
 WKbgfyBNcUl98W3Vtzuzj8lji5F8ujO/A8QcyhQ7CgHlmtQ1NmzlEgH5fEeI+UK9Pl+Y
 IZuSUnGe0xRmHeeJ22Ktg/yZ6sDPTkl4nP5kb8KOrbygyivwPWUuV4+Z4B5t5T80XBoe
 rx9Qyxf2KtLNDSPei1vzjH/z/G9sYAMpbisNrf12+fJAQckBHEl+GT5mQvrMgg606RxI
 7BgHjD8dvlZsR5j8FhkIyYDkB2Nauh7rPAixMExyFADWFNhHfcj2ZRx0qZtjBx17nt7U
 8nOQ==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFj
ayBYaWFvIDxqYWNrLnhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2Z4LmMKaW5kZXggMGI1OTViNjM1MjBiLi44YzJiODU0M2Q3YmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKQEAgLTM4OSw2ICszODksMjcgQEAgaW50IGFtZGdw
dV9nZnhfbXFkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJZGV2X3dh
cm4oYWRldi0+ZGV2LCAibm8gbWVtb3J5IHRvIGNyZWF0ZSBNUUQgYmFja3VwIGZvciByaW5nICVz
XG4iLCByaW5nLT5uYW1lKTsKIAl9CiAKKwlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFW
STEwICYmIGFtZGdwdV9hc3luY19nZnhfcmluZykgeworCQkvKiBjcmVhdGUgTVFEIGZvciBlYWNo
IEtHUSAqLworCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7IGkrKykg
eworCQkJcmluZyA9ICZhZGV2LT5nZnguZ2Z4X3JpbmdbaV07CisJCQlpZiAoIXJpbmctPm1xZF9v
YmopIHsKKwkJCQlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgbXFkX3NpemUsIFBB
R0VfU0laRSwKKwkJCQkJCQkgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULCAmcmluZy0+bXFkX29i
aiwKKwkJCQkJCQkgICAgJnJpbmctPm1xZF9ncHVfYWRkciwgJnJpbmctPm1xZF9wdHIpOworCQkJ
CWlmIChyKSB7CisJCQkJCWRldl93YXJuKGFkZXYtPmRldiwgImZhaWxlZCB0byBjcmVhdGUgcmlu
ZyBtcWQgYm8gKCVkKSIsIHIpOworCQkJCQlyZXR1cm4gcjsKKwkJCQl9CisKKwkJCQkvKiBwcmVw
YXJlIE1RRCBiYWNrdXAgKi8KKwkJCQlhZGV2LT5nZngubWUubXFkX2JhY2t1cFtpXSA9IGttYWxs
b2MobXFkX3NpemUsIEdGUF9LRVJORUwpOworCQkJCWlmICghYWRldi0+Z2Z4Lm1lLm1xZF9iYWNr
dXBbaV0pCisJCQkJCWRldl93YXJuKGFkZXYtPmRldiwgIm5vIG1lbW9yeSB0byBjcmVhdGUgTVFE
IGJhY2t1cCBmb3IgcmluZyAlc1xuIiwgcmluZy0+bmFtZSk7CisJCQl9CisJCX0KKwl9CisKIAkv
KiBjcmVhdGUgTVFEIGZvciBlYWNoIEtDUSAqLwogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5nZngu
bnVtX2NvbXB1dGVfcmluZ3M7IGkrKykgewogCQlyaW5nID0gJmFkZXYtPmdmeC5jb21wdXRlX3Jp
bmdbaV07CkBAIC0zOTcsNyArNDE4LDcgQEAgaW50IGFtZGdwdV9nZnhfbXFkX3N3X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCQkgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RU
LCAmcmluZy0+bXFkX29iaiwKIAkJCQkJCSAgICAmcmluZy0+bXFkX2dwdV9hZGRyLCAmcmluZy0+
bXFkX3B0cik7CiAJCQlpZiAocikgewotCQkJCWRldl93YXJuKGFkZXYtPmRldiwgImZhaWxlZCB0
byBjcmVhdGUgcmluZyBtcWQgb2IgKCVkKSIsIHIpOworCQkJCWRldl93YXJuKGFkZXYtPmRldiwg
ImZhaWxlZCB0byBjcmVhdGUgcmluZyBtcWQgYm8gKCVkKSIsIHIpOwogCQkJCXJldHVybiByOwog
CQkJfQogCkBAIC00MTYsNiArNDM3LDE2IEBAIHZvaWQgYW1kZ3B1X2dmeF9tcWRfc3dfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBO
VUxMOwogCWludCBpOwogCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCAmJiBh
bWRncHVfYXN5bmNfZ2Z4X3JpbmcpIHsKKwkJZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1f
Z2Z4X3JpbmdzOyBpKyspIHsKKwkJCXJpbmcgPSAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldOworCQkJ
a2ZyZWUoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbaV0pOworCQkJYW1kZ3B1X2JvX2ZyZWVfa2Vy
bmVsKCZyaW5nLT5tcWRfb2JqLAorCQkJCQkgICAgICAmcmluZy0+bXFkX2dwdV9hZGRyLAorCQkJ
CQkgICAgICAmcmluZy0+bXFkX3B0cik7CisJCX0KKwl9CisKIAlmb3IgKGkgPSAwOyBpIDwgYWRl
di0+Z2Z4Lm51bV9jb21wdXRlX3JpbmdzOyBpKyspIHsKIAkJcmluZyA9ICZhZGV2LT5nZnguY29t
cHV0ZV9yaW5nW2ldOwogCQlrZnJlZShhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBbaV0pOwpAQCAt
NDI1LDYgKzQ1Niw4IEBAIHZvaWQgYW1kZ3B1X2dmeF9tcWRfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAl9CiAKIAlyaW5nID0gJmFkZXYtPmdmeC5raXEucmluZzsKKwlpZiAo
YWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEwICYmIGFtZGdwdV9hc3luY19nZnhfcmluZykK
KwkJa2ZyZWUoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbQU1ER1BVX01BWF9HRlhfUklOR1NdKTsK
IAlrZnJlZShhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBbQU1ER1BVX01BWF9DT01QVVRFX1JJTkdT
XSk7CiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZyaW5nLT5tcWRfb2JqLAogCQkJICAgICAgJnJp
bmctPm1xZF9ncHVfYWRkciwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
