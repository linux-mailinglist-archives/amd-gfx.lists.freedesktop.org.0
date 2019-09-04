Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B3A85DE
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A523889BFD;
	Wed,  4 Sep 2019 15:02:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63E898E1
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r17so2752340wme.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuPvcqnh1b6iPL3UxPEqZOxPioWD2FoOxnxa21nmtNY=;
 b=d8JkWPKsD8xFm9ykTLXHbsv7qDxBP7UdnFUw0PWO6kc2Xoff1IOJey93w96nJDURqT
 R+/xPjJWNGjHzuNYV7QxIr7x1QN2U8p39wnWYjBOITnNoczicp4FKZnzwd7hcsS3ZHrl
 zIUxLQaXawQYyBedJ6UmEgh9q6NotxWmevQOJWEtlkn2WeDZKMR9h3T0MmfvZraYZ+u8
 gGGbfQdgqcYUPK8Cgvno/WMOcyqgjEo4kGe2Un7NkXKtUmm0BqUlIeTJNttdY4YL403M
 6ip5KcfBIf7o6gU8BgjgNLv9qg/2/CFnNIO1HOF2XktLptsVJIwWUqOILOH3kmvAgMyA
 CjOQ==
X-Gm-Message-State: APjAAAXgkFw9RzY9FMAy0LDWaRoBWNAwj0pLYmLoBt37aoCJy54NzHN6
 XYOBlDwqfXevVzhtGHSdOObW6KZh
X-Google-Smtp-Source: APXvYqwy3MQ5wt6ZMDanxxK7X6PpJNbrOF6aGmtKvPjRpig4TwOUerdfXxQRunwFIi9seHi5hBvZWw==
X-Received: by 2002:a05:600c:2486:: with SMTP id
 6mr4670441wms.82.1567609360022; 
 Wed, 04 Sep 2019 08:02:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.38
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: allow direct submission of clears
Date: Wed,  4 Sep 2019 17:02:27 +0200
Message-Id: <20190904150230.13885-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yuPvcqnh1b6iPL3UxPEqZOxPioWD2FoOxnxa21nmtNY=;
 b=QrjXnghBgeqyxO+ASPy9i/ncmiKIR1jlrZAoarnOjFC89eaZ957sIvckoEGMq9lwe6
 XrPRcZrQgCFAhXsvzv/MB/QJ5CA+t2YM645cwSWpPCHzOH42IVyFSX0XvES0ioFX4uGF
 xd3EN9fOE8jaZrwIzRlzrymzOvHlbexC2eZtIrmFX8ScYW1y2wfif3yvt+qwjuXMMC2o
 9WjnSI6Sz17wnVdAmK07glyGvHTOiIzfvZMj4SbkRgx2TdxW+mLIY3Tq5WR4sqqPWvRr
 7AAqpB8m9aWERb75XONVmenQKByJzCGGm7BA2Atu6W8wHMzzDRCVqBAb35ncqAAQpqai
 yFqA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGhhbmRsaW5nIFBEL1BUIGNsZWFycyBkaXJlY3RseSBpbiB0aGUgZmF1bHQgaGFuZGxlci4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDE3ICsrKysr
KysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IGMwOTY5MDMz
NzBhYS4uZTNjMTFiZDFjY2VlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YwpAQCAtNjk1LDYgKzY5NSw3IEBAIGJvb2wgYW1kZ3B1X3ZtX3JlYWR5KHN0cnVjdCBhbWRncHVf
dm0gKnZtKQogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHZtOiBWTSB0byBj
bGVhciBCTyBmcm9tCiAgKiBAYm86IEJPIHRvIGNsZWFyCisgKiBAZGlyZWN0OiB1c2UgYSBkaXJl
Y3QgdXBkYXRlCiAgKgogICogUm9vdCBQRCBuZWVkcyB0byBiZSByZXNlcnZlZCB3aGVuIGNhbGxp
bmcgdGhpcy4KICAqCkBAIC03MDMsNyArNzA0LDggQEAgYm9vbCBhbWRncHVfdm1fcmVhZHkoc3Ry
dWN0IGFtZGdwdV92bSAqdm0pCiAgKi8KIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NsZWFyX2JvKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICAgc3RydWN0IGFtZGdwdV92bSAqdm0s
Ci0JCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibykKKwkJCSAgICAgIHN0cnVjdCBhbWRncHVf
Ym8gKmJvLAorCQkJICAgICAgYm9vbCBkaXJlY3QpCiB7CiAJc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4IGN0eCA9IHsgdHJ1ZSwgZmFsc2UgfTsKIAl1bnNpZ25lZCBsZXZlbCA9IGFkZXYtPnZtX21h
bmFnZXIucm9vdF9sZXZlbDsKQEAgLTc2Miw2ICs3NjQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bV9jbGVhcl9ibyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAltZW1zZXQoJnBhcmFtcywg
MCwgc2l6ZW9mKHBhcmFtcykpOwogCXBhcmFtcy5hZGV2ID0gYWRldjsKIAlwYXJhbXMudm0gPSB2
bTsKKwlwYXJhbXMuZGlyZWN0ID0gZGlyZWN0OwogCiAJciA9IHZtLT51cGRhdGVfZnVuY3MtPnBy
ZXBhcmUoJnBhcmFtcywgQU1ER1BVX0ZFTkNFX09XTkVSX0tGRCwgTlVMTCk7CiAJaWYgKHIpCkBA
IC04NTIsNyArODU1LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2JvX3BhcmFtKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKICAqLwogc3RhdGljIGlu
dCBhbWRncHVfdm1fYWxsb2NfcHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAg
ICAgIHN0cnVjdCBhbWRncHVfdm0gKnZtLAotCQkJICAgICAgIHN0cnVjdCBhbWRncHVfdm1fcHRf
Y3Vyc29yICpjdXJzb3IpCisJCQkgICAgICAgc3RydWN0IGFtZGdwdV92bV9wdF9jdXJzb3IgKmN1
cnNvciwKKwkJCSAgICAgICBib29sIGRpcmVjdCkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ICpl
bnRyeSA9IGN1cnNvci0+ZW50cnk7CiAJc3RydWN0IGFtZGdwdV9ib19wYXJhbSBicDsKQEAgLTg4
NSw3ICs4ODksNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9hbGxvY19wdHMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJcHQtPnBhcmVudCA9IGFtZGdwdV9ib19yZWYoY3Vyc29yLT5wYXJl
bnQtPmJhc2UuYm8pOwogCWFtZGdwdV92bV9ib19iYXNlX2luaXQoJmVudHJ5LT5iYXNlLCB2bSwg
cHQpOwogCi0JciA9IGFtZGdwdV92bV9jbGVhcl9ibyhhZGV2LCB2bSwgcHQpOworCXIgPSBhbWRn
cHVfdm1fY2xlYXJfYm8oYWRldiwgdm0sIHB0LCBkaXJlY3QpOwogCWlmIChyKQogCQlnb3RvIGVy
cm9yX2ZyZWVfcHQ7CiAKQEAgLTEzOTUsNyArMTM5OSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zt
X3VwZGF0ZV9wdGVzKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAogCQl1
aW50NjRfdCBpbmNyLCBlbnRyeV9lbmQsIHBlX3N0YXJ0OwogCQlzdHJ1Y3QgYW1kZ3B1X2JvICpw
dDsKIAotCQlyID0gYW1kZ3B1X3ZtX2FsbG9jX3B0cyhwYXJhbXMtPmFkZXYsIHBhcmFtcy0+dm0s
ICZjdXJzb3IpOworCQlyID0gYW1kZ3B1X3ZtX2FsbG9jX3B0cyhwYXJhbXMtPmFkZXYsIHBhcmFt
cy0+dm0sICZjdXJzb3IsCisJCQkJCXBhcmFtcy0+ZGlyZWN0KTsKIAkJaWYgKHIpCiAJCQlyZXR1
cm4gcjsKIApAQCAtMjc0Miw3ICsyNzQ3LDcgQEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAogCWFtZGdwdV92bV9i
b19iYXNlX2luaXQoJnZtLT5yb290LmJhc2UsIHZtLCByb290KTsKIAotCXIgPSBhbWRncHVfdm1f
Y2xlYXJfYm8oYWRldiwgdm0sIHJvb3QpOworCXIgPSBhbWRncHVfdm1fY2xlYXJfYm8oYWRldiwg
dm0sIHJvb3QsIGZhbHNlKTsKIAlpZiAocikKIAkJZ290byBlcnJvcl91bnJlc2VydmU7CiAKQEAg
LTI4NjUsNyArMjg3MCw3IEBAIGludCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgdW5zCiAJICovCiAJaWYgKHB0
ZV9zdXBwb3J0X2F0cyAhPSB2bS0+cHRlX3N1cHBvcnRfYXRzKSB7CiAJCXZtLT5wdGVfc3VwcG9y
dF9hdHMgPSBwdGVfc3VwcG9ydF9hdHM7Ci0JCXIgPSBhbWRncHVfdm1fY2xlYXJfYm8oYWRldiwg
dm0sIHZtLT5yb290LmJhc2UuYm8pOworCQlyID0gYW1kZ3B1X3ZtX2NsZWFyX2JvKGFkZXYsIHZt
LCB2bS0+cm9vdC5iYXNlLmJvLCBmYWxzZSk7CiAJCWlmIChyKQogCQkJZ290byBmcmVlX2lkcjsK
IAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
