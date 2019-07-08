Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A655B62866
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 20:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2285789F5F;
	Mon,  8 Jul 2019 18:36:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909389F5F
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 18:36:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z4so15592604qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 11:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJq4Mi08r/pSxABp5raRDfBgrtJ7dAxKQINP4pXzwm8=;
 b=aWISJ5r51SK0N4ChjpLvErhB7/jck2L9orXvolSKY/tAnNA3FcnAw79NKpng/4XCF6
 nEaECG0wMtPawmNLlWxKTPFQWQOxlkJ5I8TO25hn8H2u9p0cH/C7iju0GEj0y9Ph8UHC
 +HDcUIGEU25zPnwVQzUtTq1irMEG5JsDQVpN928ynSC/x+PntBCaC5GAX0K6RckZWI3y
 VZs7YiUhqEx55aquBEIsxgR0ate+7B41r4AR1/UM2saWOSiGsMO/3fQQKz9+w2wWN3i6
 f6xeIyiUJuaHHjA8PAZhE7J+J854pPIEnsmw0UH1BCTCKlwv9TOvUGvS2J7qYV/IliGR
 7b3Q==
X-Gm-Message-State: APjAAAUfamrZ+gm7lRs/7YiokNxyzCwst91iCbEhERN0cB7C1lpfzxHV
 RSAGku+wHvMEJ8NKzUfMNztOadLy
X-Google-Smtp-Source: APXvYqySjNaxRwHiq+JXNHdin+mO+bJhO8wDAEv8NXDtV+bevA4qa65Ix4C14GIVVHgX1vHa9mW76A==
X-Received: by 2002:aed:2f03:: with SMTP id l3mr15556330qtd.264.1562610991697; 
 Mon, 08 Jul 2019 11:36:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id c82sm6439309qkb.112.2019.07.08.11.36.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 11:36:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/psp: add a mutex to protect access to the psp ring
Date: Mon,  8 Jul 2019 13:36:22 -0500
Message-Id: <20190708183622.5705-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJq4Mi08r/pSxABp5raRDfBgrtJ7dAxKQINP4pXzwm8=;
 b=RhOLbB9hMgsZbXJkYiRjDE+JJCws+L8X8dSuWulL8eD6oWSsLVFJ3Zyk2ZXWLOrEMj
 WjKvJDm5aBuYoDTJH/dp0ChMzOVZFTOtDrt9nCQcLP3Ndc8eTbt4wR/OBqhHag61uUSh
 Dd9YQLDxs5MI6LbgwdwWR58W7aaeQ13ocn29neXq+0+DcZV6HRO3OIyoIAPALoEFNaLV
 ZjjjsEAd5DPP8WaFvhVYXxxSDl4wofFjrp27g6jx9JRtTStxpZzckSjC9QH4xY09GXmL
 nlGji7bz2bXZ7o5EBFpW6rGdXyJQnC6Of0d0nnioiv7Km3q+pUu92TX4NXEhYB1jI0Sh
 0SRg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRvIHRoZSBwc3AgcmluZyBpZiB0aGVyZSBhcmUg
bXVsdGlwbGUKY2FsbGVycyBhdCBydW50aW1lLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYyAgICB8IDE2ICsrKysrKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuaCAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKaW5kZXggMzA5ODliNDU1MDQ3Li44ZjBmMjA3YmYzZDkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTI1NDQsNiArMjU0NCw3IEBA
IGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaGFz
aF9pbml0KGFkZXYtPm1uX2hhc2gpOwogCW11dGV4X2luaXQoJmFkZXYtPmxvY2tfcmVzZXQpOwog
CW11dGV4X2luaXQoJmFkZXYtPnZpcnQuZHBtX211dGV4KTsKKwltdXRleF9pbml0KCZhZGV2LT5w
c3AubXV0ZXgpOwogCiAJciA9IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzKGFkZXYpOwog
CWlmIChyKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IDBkZDJm
YmIwZmIyYS4uNWIwZjBiNTc0NGMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jCkBAIC0xMzEsNiArMTMxLDggQEAgcHNwX2NtZF9zdWJtaXRfYnVmKHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwLAogCWludCBpbmRleDsKIAlpbnQgdGltZW91dCA9IDIwMDA7CiAKKwltdXRl
eF9sb2NrKCZwc3AtPm11dGV4KTsKKwogCW1lbXNldChwc3AtPmNtZF9idWZfbWVtLCAwLCBQU1Bf
Q01EX0JVRkZFUl9TSVpFKTsKIAogCW1lbWNweShwc3AtPmNtZF9idWZfbWVtLCBjbWQsIHNpemVv
ZihzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVzcCkpOwpAQCAtMTQwLDYgKzE0Miw3IEBAIHBzcF9jbWRf
c3VibWl0X2J1ZihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAkJCSAgICAgZmVuY2VfbWNfYWRk
ciwgaW5kZXgpOwogCWlmIChyZXQpIHsKIAkJYXRvbWljX2RlYygmcHNwLT5mZW5jZV92YWx1ZSk7
CisJCW11dGV4X3VubG9jaygmcHNwLT5tdXRleCk7CiAJCXJldHVybiByZXQ7CiAJfQogCkBAIC0x
NjIsOCArMTY1LDEwIEBAIHBzcF9jbWRfc3VibWl0X2J1ZihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBz
cCwKIAkJCQkgIHVjb2RlLT51Y29kZV9pZCk7CiAJCURSTV9XQVJOKCJwc3AgY29tbWFuZCBmYWls
ZWQgYW5kIHJlc3BvbnNlIHN0YXR1cyBpcyAoJWQpXG4iLAogCQkJICBwc3AtPmNtZF9idWZfbWVt
LT5yZXNwLnN0YXR1cyk7Ci0JCWlmICghdGltZW91dCkKKwkJaWYgKCF0aW1lb3V0KSB7CisJCQlt
dXRleF91bmxvY2soJnBzcC0+bXV0ZXgpOwogCQkJcmV0dXJuIC1FSU5WQUw7CisJCX0KIAl9CiAK
IAkvKiBnZXQgeEdNSSBzZXNzaW9uIGlkIGZyb20gcmVzcG9uc2UgYnVmZmVyICovCkBAIC0xNzMs
NiArMTc4LDcgQEAgcHNwX2NtZF9zdWJtaXRfYnVmKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAog
CQl1Y29kZS0+dG1yX21jX2FkZHJfbG8gPSBwc3AtPmNtZF9idWZfbWVtLT5yZXNwLmZ3X2FkZHJf
bG87CiAJCXVjb2RlLT50bXJfbWNfYWRkcl9oaSA9IHBzcC0+Y21kX2J1Zl9tZW0tPnJlc3AuZndf
YWRkcl9oaTsKIAl9CisJbXV0ZXhfdW5sb2NrKCZwc3AtPm11dGV4KTsKIAogCXJldHVybiByZXQ7
CiB9CkBAIC0xMTg5LDEwICsxMTk1LDE2IEBAIHN0YXRpYyBpbnQgcHNwX3Jlc3VtZSh2b2lkICpo
YW5kbGUpCiAKIGludCBwc3BfZ3B1X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
eworCWludCByZXQ7CisKIAlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlICE9IEFNREdQVV9G
V19MT0FEX1BTUCkKIAkJcmV0dXJuIDA7CiAKLQlyZXR1cm4gcHNwX21vZGUxX3Jlc2V0KCZhZGV2
LT5wc3ApOworCW11dGV4X2xvY2soJmFkZXYtPnBzcC5tdXRleCk7CisJcmV0ID0gcHNwX21vZGUx
X3Jlc2V0KCZhZGV2LT5wc3ApOworCW11dGV4X3VubG9jaygmYWRldi0+cHNwLm11dGV4KTsKKwor
CXJldHVybiByZXQ7CiB9CiAKIGludCBwc3BfcmxjX2F1dG9sb2FkX3N0YXJ0KHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCmluZGV4
IDYwMzlhY2M4NDM0Ni4uZTI4Y2Y1ZTQwMTZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oCkBAIC0yMDEsNiArMjAxLDcgQEAgc3RydWN0IHBzcF9jb250ZXh0CiAJdWlu
dDhfdAkJCQkqdGFfcmFzX3N0YXJ0X2FkZHI7CiAJc3RydWN0IHBzcF94Z21pX2NvbnRleHQJCXhn
bWlfY29udGV4dDsKIAlzdHJ1Y3QgcHNwX3Jhc19jb250ZXh0CQlyYXM7CisJc3RydWN0IG11dGV4
CQkJbXV0ZXg7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X3BzcF9mdW5jcyB7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
