Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872F5D755
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18AB6E042;
	Tue,  2 Jul 2019 20:29:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077A6E045
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:02 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so15499001qkd.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0HRSSysAOMY5k4vzSuRB9QXGjNSXXEB/NmRGJ4cf0E=;
 b=EYL/aT3f/v1CogL/Hy/17pqMfwo207AhdVDYBuYlkcmYmVvbIpBjvWE9R+An+VXDE/
 G2aCn1mJVpcbQh9l4l7oe7nR3Ede4waJbhBPeATDDRlRHyZv+eBp195pL2j0OdYo20sW
 vKD/BpIWBTZ4IkvwkPkXnwrWQaw4CgA8F39XjmFlFp0ZCHVKdperGBbDrqEyujbilTdW
 YukbQBi9ltsMorAGRVrBO7aDmhabvAsAaxl/86Q8cQvPZPiy/d/1hYmcvaRdVHtzx2F0
 ERULpqeTJ5LxzTpsLrRGxENb8x19oVL2Xz1Ep5EeSXH7tqoITvZSrGf033W3cHL8Y+HW
 F4RA==
X-Gm-Message-State: APjAAAX8lirAgOXH91I2jhxwNY+YrFa05Q6AmYbmaYjymEYUGaLTPfcU
 c4B+j4vaCW+ng55Fq/G0wu5lSyZCg3A=
X-Google-Smtp-Source: APXvYqy3r+3oc1CRRqWAFZ15Xkd6s7pO+5XSclTdGmD2y5C7bIJZra+X42NnkXkEdwocedWx3kLRfg==
X-Received: by 2002:ae9:df81:: with SMTP id
 t123mr26885747qkf.372.1562099341086; 
 Tue, 02 Jul 2019 13:29:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/53] drm/amdgpu/discovery: init reg base offset via ip
 discovery for navi14
Date: Tue,  2 Jul 2019 15:27:57 -0500
Message-Id: <20190702202844.17001-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0HRSSysAOMY5k4vzSuRB9QXGjNSXXEB/NmRGJ4cf0E=;
 b=qYEpuAV7Vad5P74J7b9f/TERxxH56U3Glj/71tnd/6q+jXrrPFmXCu8mjxenKQw1bt
 yr2H3i5FwMiKcw9qqur5z33gHj6zOaHWr67yzKX2po6buiC5Bsd11kGr4YOgur90fBbO
 NnvpJUO11rnFayAqwWXJMrNMGYu+EaLCQm26A78EX0ZzwCGcZgTcHw2LDEeZRVM88kwt
 FiAJTaS5tgX5f1EEeIKXBdBi8eXPGrOUvGZPJBgHD13/78Srp9Txc12KRtbtHbsly5kF
 7nKpTrw69+oz+3ofb/3MXjb50pjGLPNNmoC3/uFnl9lqvjPoXl5+7YhrT7hB3Ok7qf/f
 2Y5A==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBJUCBkaXNjb3Zl
cnkgZm9yIG5hdmkxNC4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFu
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYyB8IDE3
ICsrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZp
MTRfcmVnX2luaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxNF9yZWdfaW5p
dC5jCmluZGV4IDI4ZjNkNjQ5MDY0OS4uODY0NjY4YTdmMWQyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYwpAQCAtMjksOCArMjksMjAgQEAKIAogaW50
IG5hdmkxNF9yZWdfYmFzZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCS8q
IEhXIGhhcyBtb3JlIElQIGJsb2NrcywgIG9ubHkgaW5pdGlhbGl6ZWQgdGhlIGJsb2NrZSBuZWVk
ZWQgYnkgZHJpdmVyICovCi0JdWludDMyX3QgaTsKKwlpbnQgciwgaTsKKworCWlmIChhbWRncHVf
ZGlzY292ZXJ5KSB7CisJCXIgPSBhbWRncHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoYWRldik7
CisJCWlmIChyKSB7CisJCQlEUk1fV0FSTigiZmFpbGVkIHRvIGluaXQgcmVnIGJhc2UgZnJvbSBp
cCBkaXNjb3ZlcnkgdGFibGUsICIKKwkJCQkJImZhbGxiYWNrIHRvIGxlZ2FjeSBpbml0IG1ldGhv
ZFxuIik7CisJCQlnb3RvIGxlZ2FjeV9pbml0OworCQl9CisKKwkJcmV0dXJuIDA7CisJfQorCits
ZWdhY3lfaW5pdDoKIAlmb3IgKGkgPSAwIDsgaSA8IE1BWF9JTlNUQU5DRSA7ICsraSkgewogCQlh
ZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoR0NfQkFTRS5pbnN0
YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W0hEUF9IV0lQXVtpXSA9ICh1aW50MzJfdCAq
KSgmKEhEUF9CQVNFLmluc3RhbmNlW2ldKSk7CkBAIC00OSw1ICs2MSw2IEBAIGludCBuYXZpMTRf
cmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYWRldi0+cmVnX29m
ZnNldFtUSE1fSFdJUF1baV0gPSAodWludDMyX3QgKikoJihUSE1fQkFTRS5pbnN0YW5jZVtpXSkp
OwogCQlhZGV2LT5yZWdfb2Zmc2V0W0NMS19IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKENMS19C
QVNFLmluc3RhbmNlW2ldKSk7CiAJfQorCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
