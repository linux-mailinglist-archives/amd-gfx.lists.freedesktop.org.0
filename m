Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EA69E3A
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2D89F75;
	Mon, 15 Jul 2019 21:25:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84689FA7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so12851971qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9AR0WrJ4zq9T07mz0Z7QbbWJ7XbymglcQ0iI/Q/zU3s=;
 b=eg8VNCP6wE25lO8USwcTkKlOSBvqD5GYLYFMpc//JyRVgUNE2q43P4N2nnPeYMN7mi
 lhl2CVkoXHHSJCNe8sFkhsbPtz61GVCaWBfMxptEy3iO53fOoOtvkI9RitxE+e2ckbtP
 iPmXnkFNMwQGAPEVxUmO7uPVI0QgFiJHbMARHPISCtgvyu61Q2jTKaJyK52/5M9HAOXn
 S8M7upDyXlOTYws5xLzXNiPBmdd2AhjylZaZQE5vDiwc6b9iZ6opGo8J7TMEYNLAAyfO
 DFKk22hmJfTssVUfpbkDbEDs8I2dRxgndgM4EfAJLhY2YjPsdpPtbWApD9PR9ifMr+Ik
 yIHw==
X-Gm-Message-State: APjAAAXs5gld/L92it4iVb1qqg0nEvMuA8HkZ0ljw6jTqG0q2+hQDHbA
 ZTBfDJpSej1qyhjLaPls38TwPJIo
X-Google-Smtp-Source: APXvYqy7b4mEJeAfOdLd1cn5g8JRGfbUSO1rSfB05Lu8nDiSmRlMGTr6s3p/vtazFuvVtL7s2aOhag==
X-Received: by 2002:ae9:e845:: with SMTP id a66mr18203967qkg.451.1563225948869; 
 Mon, 15 Jul 2019 14:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 071/102] drm/amdgpu: skip get/update xgmi topology info when
 no psp exists
Date: Mon, 15 Jul 2019 16:24:06 -0500
Message-Id: <20190715212437.31793-69-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AR0WrJ4zq9T07mz0Z7QbbWJ7XbymglcQ0iI/Q/zU3s=;
 b=bznoRv+oUIv8Xn83hle5X2AwyFFRt/c+JxrqKHkIWuDovAterC4TZBt5GyQcPethLn
 KbMExURu3843dccCu/qaDEvLxcJwgEQ0szvm/pCcpfZyB40NrwdQ9pXzF4LNbm9Ic7Xx
 Zhe1Rv6+/tr3Qt/AvobK9qDpjIc220/Ah2rIY9ATwH5jhVJq/dlwF6i+DWwQeuF1QNa9
 iiqvM3NAVhXbXVT3tGzpxv/xizyToTn8wgwgX8O8hLB5YV3Fn2JDcE2dQJWw9cnNj27q
 GMgnxRPTRXQqGsgUjUFn7Kh3hx63EjboPGydM+IJGy3k3mey0P2n7rhAbqq0WHqtvHYL
 +u/Q==
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
 Feifei Xu <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jIHwgNDcgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hn
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKaW5kZXggYjAy
NDA3MGFkMWNmLi40MWU2NDhkNTZlY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV94Z21pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3hnbWkuYwpAQCAtMjk2LDcgKzI5Niw3IEBAIGludCBhbWRncHVfeGdtaV9hZGRfZGV2aWNl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN0cnVjdCBhbWRncHVfeGdtaQkqZW50cnk7
CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKnRtcF9hZGV2ID0gTlVMTDsKIAotCWludCBjb3VudCA9
IDAsIHJldCA9IC1FSU5WQUw7CisJaW50IGNvdW50ID0gMCwgcmV0ID0gMDsKIAogCWlmICghYWRl
di0+Z21jLnhnbWkuc3VwcG9ydGVkKQogCQlyZXR1cm4gMDsKQEAgLTMzNywyOSArMzM3LDMyIEBA
IGludCBhbWRncHVfeGdtaV9hZGRfZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CXRvcF9pbmZvLT5udW1fbm9kZXMgPSBjb3VudDsKIAloaXZlLT5udW1iZXJfZGV2aWNlcyA9IGNv
dW50OwogCi0JbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgJmhpdmUtPmRldmljZV9saXN0
LCBnbWMueGdtaS5oZWFkKSB7Ci0JCS8qIHVwZGF0ZSBub2RlIGxpc3QgZm9yIG90aGVyIGRldmlj
ZSBpbiB0aGUgaGl2ZSAqLwotCQlpZiAodG1wX2FkZXYgIT0gYWRldikgewotCQkJdG9wX2luZm8g
PSAmdG1wX2FkZXYtPnBzcC54Z21pX2NvbnRleHQudG9wX2luZm87Ci0JCQl0b3BfaW5mby0+bm9k
ZXNbY291bnQgLSAxXS5ub2RlX2lkID0gYWRldi0+Z21jLnhnbWkubm9kZV9pZDsKLQkJCXRvcF9p
bmZvLT5udW1fbm9kZXMgPSBjb3VudDsKKwlpZiAoYW1kZ3B1X2RldmljZV9pcF9nZXRfaXBfYmxv
Y2soYWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfUFNQKSkgeworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5
KHRtcF9hZGV2LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGdtYy54Z21pLmhlYWQpIHsKKwkJCS8qIHVw
ZGF0ZSBub2RlIGxpc3QgZm9yIG90aGVyIGRldmljZSBpbiB0aGUgaGl2ZSAqLworCQkJaWYgKHRt
cF9hZGV2ICE9IGFkZXYpIHsKKwkJCQl0b3BfaW5mbyA9ICZ0bXBfYWRldi0+cHNwLnhnbWlfY29u
dGV4dC50b3BfaW5mbzsKKwkJCQl0b3BfaW5mby0+bm9kZXNbY291bnQgLSAxXS5ub2RlX2lkID0K
KwkJCQkJYWRldi0+Z21jLnhnbWkubm9kZV9pZDsKKwkJCQl0b3BfaW5mby0+bnVtX25vZGVzID0g
Y291bnQ7CisJCQl9CisJCQlyZXQgPSBhbWRncHVfeGdtaV91cGRhdGVfdG9wb2xvZ3koaGl2ZSwg
dG1wX2FkZXYpOworCQkJaWYgKHJldCkKKwkJCQlnb3RvIGV4aXQ7CiAJCX0KLQkJcmV0ID0gYW1k
Z3B1X3hnbWlfdXBkYXRlX3RvcG9sb2d5KGhpdmUsIHRtcF9hZGV2KTsKLQkJaWYgKHJldCkKLQkJ
CWdvdG8gZXhpdDsKLQl9CiAKLQkvKiBnZXQgbGF0ZXN0IHRvcG9sb2d5IGluZm8gZm9yIGVhY2gg
ZGV2aWNlIGZyb20gcHNwICovCi0JbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgJmhpdmUt
PmRldmljZV9saXN0LCBnbWMueGdtaS5oZWFkKSB7Ci0JCXJldCA9IHBzcF94Z21pX2dldF90b3Bv
bG9neV9pbmZvKCZ0bXBfYWRldi0+cHNwLCBjb3VudCwKLQkJCQkmdG1wX2FkZXYtPnBzcC54Z21p
X2NvbnRleHQudG9wX2luZm8pOwotCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyKHRtcF9hZGV2LT5k
ZXYsCi0JCQkJIlhHTUk6IEdldCB0b3BvbG9neSBmYWlsdXJlIG9uIGRldmljZSAlbGx4LCBoaXZl
ICVsbHgsIHJldCAlZCIsCi0JCQkJdG1wX2FkZXYtPmdtYy54Z21pLm5vZGVfaWQsCi0JCQkJdG1w
X2FkZXYtPmdtYy54Z21pLmhpdmVfaWQsIHJldCk7Ci0JCQkvKiBUbyBkbyA6IGNvbnRpbnVlIHdp
dGggc29tZSBub2RlIGZhaWxlZCBvciBkaXNhYmxlIHRoZSB3aG9sZSBoaXZlICovCi0JCQlnb3Rv
IGV4aXQ7CisJCS8qIGdldCBsYXRlc3QgdG9wb2xvZ3kgaW5mbyBmb3IgZWFjaCBkZXZpY2UgZnJv
bSBwc3AgKi8KKwkJbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgJmhpdmUtPmRldmljZV9s
aXN0LCBnbWMueGdtaS5oZWFkKSB7CisJCQlyZXQgPSBwc3BfeGdtaV9nZXRfdG9wb2xvZ3lfaW5m
bygmdG1wX2FkZXYtPnBzcCwgY291bnQsCisJCQkJCSZ0bXBfYWRldi0+cHNwLnhnbWlfY29udGV4
dC50b3BfaW5mbyk7CisJCQlpZiAocmV0KSB7CisJCQkJZGV2X2Vycih0bXBfYWRldi0+ZGV2LAor
CQkJCQkiWEdNSTogR2V0IHRvcG9sb2d5IGZhaWx1cmUgb24gZGV2aWNlICVsbHgsIGhpdmUgJWxs
eCwgcmV0ICVkIiwKKwkJCQkJdG1wX2FkZXYtPmdtYy54Z21pLm5vZGVfaWQsCisJCQkJCXRtcF9h
ZGV2LT5nbWMueGdtaS5oaXZlX2lkLCByZXQpOworCQkJCS8qIFRvIGRvIDogY29udGludWUgd2l0
aCBzb21lIG5vZGUgZmFpbGVkIG9yIGRpc2FibGUgdGhlIHdob2xlIGhpdmUgKi8KKwkJCQlnb3Rv
IGV4aXQ7CisJCQl9CiAJCX0KIAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
