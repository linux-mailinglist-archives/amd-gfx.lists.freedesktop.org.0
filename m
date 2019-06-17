Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBF48DE9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE7F893C9;
	Mon, 17 Jun 2019 19:17:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912AA89388
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:46 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c11so6915606qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kSG+R645llJK4u5u1w0ZU/gVU8EICdq215zU2RrQ92w=;
 b=HDSCKyrWftgoFEgXeP+A24MPtki1aU1G3KiZgTNJZRoaHvTflZlPER2lRdEpMaeaJq
 eoUPeGuB9aNdA7cX8oeCryAd+sIbPWlGkegnD1GPadEWauCzEuv6LP+DDd/FPDTDzB8u
 U0nE7q/99jZUk282bEkLDWGfVX4j1VUgGbGTLad2M0wGscUblciyT5Atb0wRrv/yTKPU
 iVN/e1MTxaWyaGVeHQD4kYCnOBumxg7uqMyTGHABFuWC8li5/Xs23B0gFfJb3i1Eqvpp
 p/sDq6fCiI3YpoifUx7S5SBeRVJk4RX70PEkWu1bYGCuRjfjN0hevDHCO4n4jwhQaSDI
 s21Q==
X-Gm-Message-State: APjAAAV9R1r8E+YHFoaFnVhwSQdtJQJyKt5beBf3f38HOh7Thg9qkJ/q
 bEpMCXx/yDBlx9vgnSxxMD7dT/lJTJw=
X-Google-Smtp-Source: APXvYqwxiRBBgxLEkmxOTq4+3hZUXTwK2CFZI0X1vaLHi0BUwBp9JlG8Zz/VpaGB3g7PtjxOd1HUFw==
X-Received: by 2002:a37:a890:: with SMTP id
 r138mr71646783qke.218.1560799065111; 
 Mon, 17 Jun 2019 12:17:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 042/459] drm/amdgpu: Move common code to amdgpu_gfx.c
Date: Mon, 17 Jun 2019 14:10:03 -0500
Message-Id: <20190617191700.17899-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kSG+R645llJK4u5u1w0ZU/gVU8EICdq215zU2RrQ92w=;
 b=ibZIZKERoZpiPCdwwP9uKQHtj742wtDB7XyAyjDqOQ2MS5ruVxrDUP+TfGdxO+pYgT
 xRJYpMXilyOZY4Y7pQDG4eGG9Nnfwy+o51JaADpXNgn2b6hjPO8sL9G4XqVjPhDazHJc
 RwllbeLR0xLVD784IcE4/xsfvnUqKnhcnpoa2qoEYg0f16qTq003U2DSkwzA4DuVpknt
 lmW9UoihD5J6cf+E+DFXxQu7NO6a+JE4A++3v10cJTHxbOCWR1fP39YxjsA3Ah8M5FLl
 p9QMpIfj5tzhpFnV8FA7mVNdtHhu1tI4CDVhK+rhljL5LpsHBrNuMax7FPqEqWJvcnP9
 rcpQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKbW92ZSBjb21tb24g
Y29kZSB0byBhbWRncHVfZ2Z4X2VuYWJsZV9rY3Esc28KdGhpcyBmdW5jdGlvbiBjYW4gYmUgc2hh
cmVkIHdpdGggZ2Z4OCBhbmQgZ2Z4OQoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBSZXggWmh1IDxSZXguWmh1QGFtZC5j
b20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggfCAg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmMKaW5kZXggYWQxNTllMDZjZmIyLi5jNzkzYjY5MTQ5NTcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKQEAgLTQ1MCw2ICs0NTAsNTMg
QEAgaW50IGFtZGdwdV9nZnhfZGlzYWJsZV9rY3Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJcmV0dXJuIGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhraXFfcmluZyk7CiB9CiAKK2ludCBhbWRn
cHVfZ2Z4X2VuYWJsZV9rY3Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJc3RydWN0
IGFtZGdwdV9raXEgKmtpcSA9ICZhZGV2LT5nZngua2lxOworCXN0cnVjdCBhbWRncHVfcmluZyAq
a2lxX3JpbmcgPSAmYWRldi0+Z2Z4LmtpcS5yaW5nOworCXVpbnQ2NF90IHF1ZXVlX21hc2sgPSAw
OworCWludCByLCBpOworCisJaWYgKCFraXEtPnBtZiB8fCAha2lxLT5wbWYtPmtpcV9tYXBfcXVl
dWVzIHx8IWtpcS0+cG1mLT5raXFfc2V0X3Jlc291cmNlcykKKwkJcmV0dXJuIC1FSU5WQUw7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9DT01QVVRFX1FVRVVFUzsgKytpKSB7CisJCWlm
ICghdGVzdF9iaXQoaSwgYWRldi0+Z2Z4Lm1lYy5xdWV1ZV9iaXRtYXApKQorCQkJY29udGludWU7
CisKKwkJLyogVGhpcyBzaXR1YXRpb24gbWF5IGJlIGhpdCBpbiB0aGUgZnV0dXJlIGlmIGEgbmV3
IEhXCisJCSAqIGdlbmVyYXRpb24gZXhwb3NlcyBtb3JlIHRoYW4gNjQgcXVldWVzLiBJZiBzbywg
dGhlCisJCSAqIGRlZmluaXRpb24gb2YgcXVldWVfbWFzayBuZWVkcyB1cGRhdGluZyAqLworCQlp
ZiAoV0FSTl9PTihpID4gKHNpemVvZihxdWV1ZV9tYXNrKSo4KSkpIHsKKwkJCURSTV9FUlJPUigi
SW52YWxpZCBLQ1EgZW5hYmxlZDogJWRcbiIsIGkpOworCQkJYnJlYWs7CisJCX0KKworCQlxdWV1
ZV9tYXNrIHw9ICgxdWxsIDw8IGkpOworCX0KKworCURSTV9JTkZPKCJraXEgcmluZyBtZWMgJWQg
cGlwZSAlZCBxICVkXG4iLCBraXFfcmluZy0+bWUsIGtpcV9yaW5nLT5waXBlLAorCQkJCQkJCWtp
cV9yaW5nLT5xdWV1ZSk7CisKKwlyID0gYW1kZ3B1X3JpbmdfYWxsb2Moa2lxX3JpbmcsIGtpcS0+
cG1mLT5tYXBfcXVldWVzX3NpemUgKgorCQkJCQlhZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3Mg
KworCQkJCQlraXEtPnBtZi0+c2V0X3Jlc291cmNlc19zaXplKTsKKwlpZiAocikgeworCQlEUk1f
RVJST1IoIkZhaWxlZCB0byBsb2NrIEtJUSAoJWQpLlxuIiwgcik7CisJCXJldHVybiByOworCX0K
KworCWtpcS0+cG1mLT5raXFfc2V0X3Jlc291cmNlcyhraXFfcmluZywgcXVldWVfbWFzayk7CisJ
Zm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsgaSsrKQorCQlraXEt
PnBtZi0+a2lxX21hcF9xdWV1ZXMoa2lxX3JpbmcsICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ld
KTsKKworCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihraXFfcmluZyk7CisJaWYgKHIpCisJ
CURSTV9FUlJPUigiS0NRIGVuYWJsZSBmYWlsZWRcbiIpOworCisJcmV0dXJuIHI7Cit9CisKIC8q
IGFtZGdwdV9nZnhfb2ZmX2N0cmwgLSBIYW5kbGUgZ2Z4IG9mZiBmZWF0dXJlIGVuYWJsZS9kaXNh
YmxlCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5oCmluZGV4IGIyMjQyMWYyYjZmZS4uNDI3MzBhZGJlZmNmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCkBAIC0zNTQsNiArMzU0LDcg
QEAgaW50IGFtZGdwdV9nZnhfbXFkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJCQkgICB1bnNpZ25lZCBtcWRfc2l6ZSk7CiB2b2lkIGFtZGdwdV9nZnhfbXFkX3N3X2Zpbmko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9nZnhfZGlzYWJsZV9rY3Eo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworaW50IGFtZGdwdV9nZnhfZW5hYmxlX2tjcShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAKIHZvaWQgYW1kZ3B1X2dmeF9jb21wdXRlX3F1
ZXVlX2FjcXVpcmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfZ2Z4
X2dyYXBoaWNzX3F1ZXVlX2FjcXVpcmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
