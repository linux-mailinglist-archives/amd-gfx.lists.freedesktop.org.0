Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7048F95
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C08D89D53;
	Mon, 17 Jun 2019 19:32:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B1989D53
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:37 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t8so6976683qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FNMn7B6h7DaaRKqjBt1Am9dW2Z9BQuC5JfXd2xF7FI=;
 b=RNY7LJwVM8PT4v43nJxFO0nmyrHYUg99PydDP/kxUGbsHa4SmhK3dIGhURIvDLuvlV
 b8n51W7yg31Zc/sIuGNzsvxZjk6/kEgZEwqbZvZHQgSmq649ix6fwseEPbAmy1Zi0321
 X0vvjo/qpAss8+kILxI2S6eYzG/Xe0a7N5XxY8NBMbhF1zxQwIb9QaAQ9sY5h9ErmWFI
 WARsu7HeGrfYqyFYUxITLF9Vtk7ZIQtCnIgifoQkqf1JSJZEHTC1yhZu9xC4Qu3oVgnu
 vEzkDMFslyqh3jk8yh0ThLM3pGsTn64HRS/PvEb/yd7SdX25X8T+70iIDuhkXnBjZF1T
 YkqQ==
X-Gm-Message-State: APjAAAVlzoQcneBj5SNWnzJzlRtirYV4rR1q/nmSoVM0I6bHI+RWdbiU
 vxSE21jdcLdVYShWCQPvBegTbJKNpAk=
X-Google-Smtp-Source: APXvYqwQPYXJkAkfy4uk8uB48Yl6JoPB7HfQxM8zW71KoGFBTmzLkRKXtPeyyh+YIsVSpXuo4ylfcQ==
X-Received: by 2002:a05:620a:136d:: with SMTP id
 d13mr65778174qkl.22.1560799955776; 
 Mon, 17 Jun 2019 12:32:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 291/459] drm/amdgpu/VCN2.0: add DPG pause mode
Date: Mon, 17 Jun 2019 14:30:58 -0500
Message-Id: <20190617193106.18231-92-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FNMn7B6h7DaaRKqjBt1Am9dW2Z9BQuC5JfXd2xF7FI=;
 b=Tkz1g/lAc/eahr3BJaCqpCjg9i32/bYtWnoSj0pAaotHRzpOQDvpb/9zVTT2rsvue1
 DG7658xxaHsOBzAgrhZXUNmjJnCi4K/qOEcuHPvea6V9TUq/xng6/LmMfvCXbx8P+kAh
 wUkwfqwPB4K3myAJM1UYyIMouUg+vnwP5Ae2dNYcxx+1T1v2QF2AMUaoN9azYvvTtJQk
 C3oqYmQ8f1M9r0zI8OutLMMlPqoZbgDaiKBts1KhkZk0vun5kZuIgrrx3YdUb0LaBoZG
 9wCL/kndFDEeJeFjn37uY0UVtQvS8bGTZ+YS0+eGYBGOmjxMMGnl6KyZL6h8Y4nXOpEC
 zSUw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKUGF1c2UgdGhlIERQRyB3aGVuIG5vdCBk
b2luZyBkZWNvZGUKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgfCA3MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKaW5kZXggMzA2OGIwODcwYzhmLi5iZWYyMDcwNGUyYjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwpAQCAtNzcsNiArNzcsOCBAQCBz
dGF0aWMgdm9pZCB2Y25fdjJfMF9zZXRfanBlZ19yaW5nX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsKIHN0YXRpYyB2b2lkIHZjbl92Ml8wX3NldF9pcnFfZnVuY3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwogc3RhdGljIGludCB2Y25fdjJfMF9zZXRfcG93ZXJnYXRpbmdf
c3RhdGUodm9pZCAqaGFuZGxlLAogCQkJCWVudW0gYW1kX3Bvd2VyZ2F0aW5nX3N0YXRlIHN0YXRl
KTsKK3N0YXRpYyBpbnQgdmNuX3YyXzBfcGF1c2VfZHBnX21vZGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCisJCQkJc3RydWN0IGRwZ19wYXVzZV9zdGF0ZSAqbmV3X3N0YXRlKTsKIAogLyoq
CiAgKiB2Y25fdjJfMF9lYXJseV9pbml0IC0gc2V0IGZ1bmN0aW9uIHBvaW50ZXJzCkBAIC0xOTIs
NiArMTk0LDggQEAgc3RhdGljIGludCB2Y25fdjJfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlp
ZiAocikKIAkJcmV0dXJuIHI7CiAKKwlhZGV2LT52Y24ucGF1c2VfZHBnX21vZGUgPSB2Y25fdjJf
MF9wYXVzZV9kcGdfbW9kZTsKKwogCWFkZXYtPnZjbi5pbnRlcm5hbC5qcGVnX3BpdGNoID0gbW1V
VkRfSlBFR19QSVRDSF9JTlRFUk5BTF9PRkZTRVQ7CiAJYWRldi0+dmNuLmV4dGVybmFsLmpwZWdf
cGl0Y2ggPSBTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRfSlBFR19QSVRDSCk7CiAKQEAg
LTEyODksNiArMTI5Myw2OCBAQCBzdGF0aWMgaW50IHZjbl92Ml8wX3N0b3Aoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgdmNuX3YyXzBfcGF1
c2VfZHBnX21vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJc3RydWN0IGRwZ19w
YXVzZV9zdGF0ZSAqbmV3X3N0YXRlKQoreworCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZzsKKwl1
aW50MzJfdCByZWdfZGF0YSA9IDA7CisJaW50IHJldF9jb2RlOworCisJLyogcGF1c2UvdW5wYXVz
ZSBpZiBzdGF0ZSBpcyBjaGFuZ2VkICovCisJaWYgKGFkZXYtPnZjbi5wYXVzZV9zdGF0ZS5md19i
YXNlZCAhPSBuZXdfc3RhdGUtPmZ3X2Jhc2VkKSB7CisJCURSTV9ERUJVRygiZHBnIHBhdXNlIHN0
YXRlIGNoYW5nZWQgJWQgLT4gJWQiLAorCQkJYWRldi0+dmNuLnBhdXNlX3N0YXRlLmZ3X2Jhc2Vk
LAluZXdfc3RhdGUtPmZ3X2Jhc2VkKTsKKwkJcmVnX2RhdGEgPSBSUkVHMzJfU09DMTUoVVZELCAw
LCBtbVVWRF9EUEdfUEFVU0UpICYKKwkJCSh+VVZEX0RQR19QQVVTRV9fTkpfUEFVU0VfRFBHX0FD
S19NQVNLKTsKKworCQlpZiAobmV3X3N0YXRlLT5md19iYXNlZCA9PSBWQ05fRFBHX1NUQVRFX19Q
QVVTRSkgeworCQkJcmV0X2NvZGUgPSAwOworCQkJU09DMTVfV0FJVF9PTl9SUkVHKFVWRCwgMCwg
bW1VVkRfUE9XRVJfU1RBVFVTLCAweDEsCisJCQkJVVZEX1BPV0VSX1NUQVRVU19fVVZEX1BPV0VS
X1NUQVRVU19NQVNLLCByZXRfY29kZSk7CisKKwkJCWlmICghcmV0X2NvZGUpIHsKKwkJCQkvKiBw
YXVzZSBEUEcgKi8KKwkJCQlyZWdfZGF0YSB8PSBVVkRfRFBHX1BBVVNFX19OSl9QQVVTRV9EUEdf
UkVRX01BU0s7CisJCQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfRFBHX1BBVVNFLCByZWdf
ZGF0YSk7CisKKwkJCQkvKiB3YWl0IGZvciBBQ0sgKi8KKwkJCQlTT0MxNV9XQUlUX09OX1JSRUco
VVZELCAwLCBtbVVWRF9EUEdfUEFVU0UsCisJCQkJCSAgIFVWRF9EUEdfUEFVU0VfX05KX1BBVVNF
X0RQR19BQ0tfTUFTSywKKwkJCQkJICAgVVZEX0RQR19QQVVTRV9fTkpfUEFVU0VfRFBHX0FDS19N
QVNLLCByZXRfY29kZSk7CisKKwkJCQkvKiBSZXN0b3JlICovCisJCQkJcmluZyA9ICZhZGV2LT52
Y24ucmluZ19lbmNbMF07CisJCQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfUkJfQkFTRV9M
TywgcmluZy0+Z3B1X2FkZHIpOworCQkJCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1JCX0JB
U0VfSEksIHVwcGVyXzMyX2JpdHMocmluZy0+Z3B1X2FkZHIpKTsKKwkJCQlXUkVHMzJfU09DMTUo
VVZELCAwLCBtbVVWRF9SQl9TSVpFLCByaW5nLT5yaW5nX3NpemUgLyA0KTsKKwkJCQlXUkVHMzJf
U09DMTUoVVZELCAwLCBtbVVWRF9SQl9SUFRSLCBsb3dlcl8zMl9iaXRzKHJpbmctPndwdHIpKTsK
KwkJCQlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9SQl9XUFRSLCBsb3dlcl8zMl9iaXRzKHJp
bmctPndwdHIpKTsKKworCQkJCXJpbmcgPSAmYWRldi0+dmNuLnJpbmdfZW5jWzFdOworCQkJCVdS
RUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1JCX0JBU0VfTE8yLCByaW5nLT5ncHVfYWRkcik7CisJ
CQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfUkJfQkFTRV9ISTIsIHVwcGVyXzMyX2JpdHMo
cmluZy0+Z3B1X2FkZHIpKTsKKwkJCQlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9SQl9TSVpF
MiwgcmluZy0+cmluZ19zaXplIC8gNCk7CisJCQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRf
UkJfUlBUUjIsIGxvd2VyXzMyX2JpdHMocmluZy0+d3B0cikpOworCQkJCVdSRUczMl9TT0MxNShV
VkQsIDAsIG1tVVZEX1JCX1dQVFIyLCBsb3dlcl8zMl9iaXRzKHJpbmctPndwdHIpKTsKKworCQkJ
CVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1JCQ19SQl9XUFRSLAorCQkJCQkgICBSUkVHMzJf
U09DMTUoVVZELCAwLCBtbVVWRF9TQ1JBVENIMikgJiAweDdGRkZGRkZGKTsKKworCQkJCVNPQzE1
X1dBSVRfT05fUlJFRyhVVkQsIDAsIG1tVVZEX1BPV0VSX1NUQVRVUywKKwkJCQkJICAgVVZEX1BH
RlNNX0NPTkZJR19fVVZETV9VVkRVX1BXUl9PTiwKKwkJCQkJICAgVVZEX1BPV0VSX1NUQVRVU19f
VVZEX1BPV0VSX1NUQVRVU19NQVNLLCByZXRfY29kZSk7CisJCQl9CisJCX0gZWxzZSB7CisJCQkv
KiB1bnBhdXNlIGRwZywgbm8gbmVlZCB0byB3YWl0ICovCisJCQlyZWdfZGF0YSAmPSB+VVZEX0RQ
R19QQVVTRV9fTkpfUEFVU0VfRFBHX1JFUV9NQVNLOworCQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwg
bW1VVkRfRFBHX1BBVVNFLCByZWdfZGF0YSk7CisJCX0KKwkJYWRldi0+dmNuLnBhdXNlX3N0YXRl
LmZ3X2Jhc2VkID0gbmV3X3N0YXRlLT5md19iYXNlZDsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIGJvb2wgdmNuX3YyXzBfaXNfaWRsZSh2b2lkICpoYW5kbGUpCiB7CiAJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CkBAIC0x
MzY3LDYgKzE0MzMsMTAgQEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3Jpbmdfc2V0X3dwdHIo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gcmluZy0+YWRldjsKIAorCWlmIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZD
Tl9EUEcpCisJCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1NDUkFUQ0gyLAorCQkJbG93ZXJf
MzJfYml0cyhyaW5nLT53cHRyKSB8IDB4ODAwMDAwMDApOworCiAJaWYgKHJpbmctPnVzZV9kb29y
YmVsbCkgewogCQlhZGV2LT53Yi53YltyaW5nLT53cHRyX29mZnNdID0gbG93ZXJfMzJfYml0cyhy
aW5nLT53cHRyKTsKIAkJV0RPT1JCRUxMMzIocmluZy0+ZG9vcmJlbGxfaW5kZXgsIGxvd2VyXzMy
X2JpdHMocmluZy0+d3B0cikpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
