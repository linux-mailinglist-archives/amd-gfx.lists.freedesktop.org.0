Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3869E15
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104BA89E57;
	Mon, 15 Jul 2019 21:25:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152AF89E23
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:16 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x22so12360737qtp.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcFLOAswiv1XkNkJY6lZLiAT9v2bmrrLF5pthqOA1kM=;
 b=VIvuH/YkJQA3eH+dpnY6Q8I7xK11vb09Q02XiBGqAHWScbJsZLVwJrQmbIFZPLy5rk
 MgZN5vJ3/DfKMeOA5fZ2ILUEu94p0HkqMIzOeI794Pjq6u4q/GArAHMrabwh2vjwXyqE
 q2bhYJYzQFBSqCfiPPZ8W+2satKdoJRR0KWvsW62nNVpkYgQZapwnIlicKiG5i0q+kkm
 G9ZCek6xrI04RHkDW99a6Ffh6jqTYv4Bjrn3BoNw4JN4l3PWqgStKqIOz9PH4rdZSLFo
 S9qeAD5SbnQPjFCuCea2coveXnWdycOx3Lyw4ufCdGHZcRoNATFvQRJR2Hjigx6XBtUv
 sEUQ==
X-Gm-Message-State: APjAAAXpSr0MTTS9CVVCW/BPTXMMVZRQuxJBcKQ+KRfy6JWd9ln0vVDQ
 /GJF7rCW8/N9M/JWiS/i5e/SuKUU
X-Google-Smtp-Source: APXvYqxpbMNUT9U948BKmfhOwxr3tPkWTxZRIohcJsVXm2K7dPumoTXpcZC/913plJ81/0Hb/gCNCg==
X-Received: by 2002:ac8:27d4:: with SMTP id x20mr19271818qtx.138.1563225915043; 
 Mon, 15 Jul 2019 14:25:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 034/102] drm/amdgpu: skip all gfx ring settings for Arcturus
Date: Mon, 15 Jul 2019 16:23:29 -0500
Message-Id: <20190715212437.31793-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcFLOAswiv1XkNkJY6lZLiAT9v2bmrrLF5pthqOA1kM=;
 b=ZXySvolOeOrnbbq4olR89qPCicDhrxffFpSuYTuTbKEcAHyZX96pmduz+WFKEYmD9P
 OFIp12ppDKcfo6HWGhX2A90s+bvEZ6YGwkR4RYj9t3uNnGARN1tCcsuyJDli1teLfHgF
 KFkn8lGqwfPyRfLGN4q+uf0m7kJ/hOH5kYb6psK9MQNrbs9XJ7xgtcSy0mkCG19sMlLk
 NO34lSMYkAawr2Zrv/65tcoAOTTcFFpZPEk1/Bt1DSfrW9ma9/q5vwHJcsviwy7tp1GL
 ve/BGlCbyfFqnZd+NXtnbnha1gT84pM05T4L4eMJH8vseFtrEYRCquleFbvQCOPs/hx5
 goUQ==
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

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAzOSArKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAx
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCAw
Njc2YWUzOGVjMWUuLjNhYzNlZTdmY2IxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCkBAIC0zMzM4LDE4ICszMzM4LDIyIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfY3BfcmVz
dW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChyKQogCQlyZXR1cm4gcjsKIAot
CXIgPSBnZnhfdjlfMF9jcF9nZnhfcmVzdW1lKGFkZXYpOwotCWlmIChyKQotCQlyZXR1cm4gcjsK
KwlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHsKKwkJciA9IGdmeF92OV8w
X2NwX2dmeF9yZXN1bWUoYWRldik7CisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQogCiAJciA9
IGdmeF92OV8wX2tjcV9yZXN1bWUoYWRldik7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0Jcmlu
ZyA9ICZhZGV2LT5nZnguZ2Z4X3JpbmdbMF07Ci0JciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVy
KHJpbmcpOwotCWlmIChyKQotCQlyZXR1cm4gcjsKKwlpZiAoYWRldi0+YXNpY190eXBlICE9IENI
SVBfQVJDVFVSVVMpIHsKKwkJcmluZyA9ICZhZGV2LT5nZnguZ2Z4X3JpbmdbMF07CisJCXIgPSBh
bWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsKKwkJaWYgKHIpCisJCQlyZXR1cm4gcjsKKwl9
CiAKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3JpbmdzOyBpKyspIHsK
IAkJcmluZyA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldOwpAQCAtMzM2Myw3ICszMzY3LDgg
QEAgc3RhdGljIGludCBnZnhfdjlfMF9jcF9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAKIHN0YXRpYyB2b2lkIGdmeF92OV8wX2NwX2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgYm9vbCBlbmFibGUpCiB7Ci0JZ2Z4X3Y5XzBfY3BfZ2Z4X2VuYWJsZShhZGV2LCBl
bmFibGUpOworCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykKKwkJZ2Z4X3Y5
XzBfY3BfZ2Z4X2VuYWJsZShhZGV2LCBlbmFibGUpOwogCWdmeF92OV8wX2NwX2NvbXB1dGVfZW5h
YmxlKGFkZXYsIGVuYWJsZSk7CiB9CiAKQEAgLTMzODgsOSArMzM5MywxMSBAQCBzdGF0aWMgaW50
IGdmeF92OV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogCWlmIChyKQogCQlyZXR1cm4gcjsKIAot
CXIgPSBnZnhfdjlfMF9uZ2dfZW4oYWRldik7Ci0JaWYgKHIpCi0JCXJldHVybiByOworCWlmIChh
ZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgeworCQlyID0gZ2Z4X3Y5XzBfbmdnX2Vu
KGFkZXYpOworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KIAogCXJldHVybiByOwogfQpAQCAt
MzUzOCw4ICszNTQ1LDkgQEAgc3RhdGljIGludCBnZnhfdjlfMF9zb2Z0X3Jlc2V0KHZvaWQgKmhh
bmRsZSkKIAkJLyogc3RvcCB0aGUgcmxjICovCiAJCWFkZXYtPmdmeC5ybGMuZnVuY3MtPnN0b3Ao
YWRldik7CiAKLQkJLyogRGlzYWJsZSBHRlggcGFyc2luZy9wcmVmZXRjaGluZyAqLwotCQlnZnhf
djlfMF9jcF9nZnhfZW5hYmxlKGFkZXYsIGZhbHNlKTsKKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSAh
PSBDSElQX0FSQ1RVUlVTKQorCQkJLyogRGlzYWJsZSBHRlggcGFyc2luZy9wcmVmZXRjaGluZyAq
LworCQkJZ2Z4X3Y5XzBfY3BfZ2Z4X2VuYWJsZShhZGV2LCBmYWxzZSk7CiAKIAkJLyogRGlzYWJs
ZSBNRUMgcGFyc2luZy9wcmVmZXRjaGluZyAqLwogCQlnZnhfdjlfMF9jcF9jb21wdXRlX2VuYWJs
ZShhZGV2LCBmYWxzZSk7CkBAIC0zODgyLDcgKzM4OTAsMTAgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAotCWFkZXYtPmdmeC5udW1fZ2Z4
X3JpbmdzID0gR0ZYOV9OVU1fR0ZYX1JJTkdTOworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9BUkNUVVJVUykKKwkJYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3MgPSAwOworCWVsc2UKKwkJYWRl
di0+Z2Z4Lm51bV9nZnhfcmluZ3MgPSBHRlg5X05VTV9HRlhfUklOR1M7CiAJYWRldi0+Z2Z4Lm51
bV9jb21wdXRlX3JpbmdzID0gQU1ER1BVX01BWF9DT01QVVRFX1JJTkdTOwogCWdmeF92OV8wX3Nl
dF9yaW5nX2Z1bmNzKGFkZXYpOwogCWdmeF92OV8wX3NldF9pcnFfZnVuY3MoYWRldik7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
