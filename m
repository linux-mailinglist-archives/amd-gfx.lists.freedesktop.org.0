Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1D48F21
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABEE897E8;
	Mon, 17 Jun 2019 19:30:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE62897CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w17so5825716qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yEPCvPz2BrG6H0F6ZW/aWgG/SU40uD4laec6V3KLsc=;
 b=l0AZzwwwVaZX21AYu2cwiiE9q536kvITvdM3pNh3gLdwI9gt4SPICHGT1KjR/C52hI
 ZHR7sBz5Q1iKd33LqK5MCtNCwzwtWLae80XNWn4BAu30hXA8HDiDqV+WxlqZUQO/5qw1
 37oMjkvTbore2sA4iQ1Owx1NVeOOWGICyR10Jhi4ai28stNhmHugCz2XOx/YM4+I+z5l
 HWfuqH1cAM+1ShOF8Mt5j6myuV0Dre2h39cCsK9qpGE+6XSmPbxvhWZI/eL/hbQ5BAu2
 oasIIOaaVRbFzgovp8MeFH14nrMJaRXJIIRXRQJO/2uC70wuXCQn4QUOf4bf6U7TAWjR
 Z4Fg==
X-Gm-Message-State: APjAAAXY+1/hIaBH7VvsFltODW5/sD8OQqWyDzIPFW49AdjMDzVw5MK1
 lJFbvDy8HHBelY8cuaBJPcx3mYEUegM=
X-Google-Smtp-Source: APXvYqzwGwTgNZiuoO4X+kNB0EUs1M0M07vcbcMt/d0wDyHD5kydbhUOxIyoIR3Ibvk5iqKEf+1Riw==
X-Received: by 2002:ac8:70cf:: with SMTP id g15mr90636673qtp.254.1560799850573; 
 Mon, 17 Jun 2019 12:30:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 194/459] drm/amdgpu/gfx10: fix issues for suspend/resume
Date: Mon, 17 Jun 2019 14:30:37 -0500
Message-Id: <20190617193042.18183-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yEPCvPz2BrG6H0F6ZW/aWgG/SU40uD4laec6V3KLsc=;
 b=aN8QVtIqW5smT9q0UOufu9Lo3qK7qEn+2ByRMpcdYU4wGADT/56Wz85QttyMUXgGmU
 btWZDhlUkdOwz7ypkqgQ4juc6yiHsN8o11W5uy3fqLXxqCNQHU/lW0Q8agdQPhousvkZ
 V+JcDDFnUnNi8iF17nD0AeNrHlcAWIqEBtrpYLRCbyusWoJwKiK32PQgYwFcOnglSEJ+
 LfBZJIfrowfbFDSMZi3Gr3Ky4o5c34nmT5p0rZr8cwsNqKE4ukxIVC2raJT8qFMU9gHZ
 Z92gleexKwtB18H7mhtU4dAV7q4DGVi7AJozKZ5w3XToChS6L3PZwXyF2Yiuqq6X08Sn
 XDyQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCjEpLiB1c2UgUFJFRU1QVF9RVUVV
RSBpbnN0ZWFkIG9mIFJFU0VUX1FVRVVFIGZvciBnZnggcmluZyBkaXNhYmxlbWVudC4KMikuIE5l
ZWQgd2FpdCBmb3IgdW5tYXBwaW5nIHF1ZXVlIGRvbmUgYmVmb3JlIGNvbnRpbnVlIGV4ZWN1dGlv
bi4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBUaWFuY2kgWWluIDx0aWFuY2kueWluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBYaWFvamll
IFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA5ZDE2MmQyNjlhY2EuLmZhZTA3NjAzZTEyMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTM1NjcsOCArMzU2Nyw5IEBA
IHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogc3RhdGljIGludCBn
ZngxMF8wX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN0cnVj
dCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsKLQlzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KmtpcV9yaW5nID0gJmtpcS0+cmluZzsKLQlpbnQgaTsKKwlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsICpraXFfcmluZyA9ICZraXEtPnJpbmc7CisJc3RydWN0IHYxMF9nZnhfbXFkICptcWQ7CisJ
aW50IHIsIGksIGo7CiAKIAlpZiAoIWtpcS0+cG1mIHx8ICFraXEtPnBtZi0+a2lxX3VubWFwX3F1
ZXVlcykKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0zNTc3LDkgKzM1NzgsMzMgQEAgc3RhdGljIGlu
dCBnZngxMF8wX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQlh
ZGV2LT5nZngubnVtX2dmeF9yaW5ncykpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JZm9yIChpID0g
MDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzOyBpKyspCi0JCWtpcS0+cG1mLT5raXFfdW5t
YXBfcXVldWVzKGtpcV9yaW5nLCAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldLAotCQkJCQkgICBSRVNF
VF9RVUVVRVMsIDAsIDApOworCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5nZngubnVtX2dmeF9yaW5n
czsgaSsrKSB7CisJCXJpbmcgPSAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldOworCisJCXIgPSBhbWRn
cHVfYm9fcmVzZXJ2ZShyaW5nLT5tcWRfb2JqLCBmYWxzZSk7CisJCWlmICh1bmxpa2VseShyICE9
IDApKQorCQkJcmV0dXJuIHI7CisKKwkJciA9IGFtZGdwdV9ib19rbWFwKHJpbmctPm1xZF9vYmos
ICh2b2lkICoqKSZyaW5nLT5tcWRfcHRyKTsKKwkJaWYgKCFyKSB7CisJCQlraXEtPnBtZi0+a2lx
X3VubWFwX3F1ZXVlcyhraXFfcmluZywgcmluZywKKwkJCQkJCSAgIFBSRUVNUFRfUVVFVUVTLCAw
LCAwKTsKKwkJCW1xZCA9IHJpbmctPm1xZF9wdHI7CisKKwkJCWZvciAoaiA9IDA7IGogPCBhZGV2
LT51c2VjX3RpbWVvdXQ7IGorKykgeworCQkJCWlmICghbXFkLT5jcF9nZnhfaHFkX2FjdGl2ZSkK
KwkJCQkJYnJlYWs7CisJCQkJdWRlbGF5KDEpOworCQkJfQorCisJCQlpZiAoaiA9PSBhZGV2LT51
c2VjX3RpbWVvdXQpCisJCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gd2FpdCBmb3IgZ2Z4IGluYWN0
aXZlXG4iKTsKKworCQkJYW1kZ3B1X2JvX2t1bm1hcChyaW5nLT5tcWRfb2JqKTsKKwkJCXJpbmct
Pm1xZF9wdHIgPSBOVUxMOworCQl9CisJCWFtZGdwdV9ib191bnJlc2VydmUocmluZy0+bXFkX29i
aik7CisJfQogCiAJcmV0dXJuIGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhraXFfcmluZyk7CiB9Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
