Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE07CB32
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856DC6E202;
	Wed, 31 Jul 2019 17:58:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A036E1B6
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:45 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u64so13806122vku.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L670ZjNTlEvRMf/e1lunJ1e1m9DGhml89FIld3LX6RQ=;
 b=HUqVLp/vNia58cT1JvtZXrGpjgso/Wtdv9M5y5ymrfjMSqQYj3MVlTuFLH8OZS4yxP
 UJ6UWj8GIkMalsPEO+OAUFUeXVMZjbFrW+KJ7kMsTn+8x3ai3uT0SQjOefFCsWfCTIh9
 wfVMr0zaqqCeEwjvy7adXrVoHRTW7bw3UTOP3H3yFJ5rqGsv9+cw597WJfA7KvWhqxQF
 UMoDWDV01hS2IBgCDcL3J4R5JOzeWRLkDYHBJJz9RNncjeCJB4D+1IMmOW8YyTIc5p/2
 6OxDkNSgMz0gacfcqP36+E+DtyDXHZ3NMhKXbqjH/mbFHEJc6ncBMVJWMCVJUnxdv13c
 gXnw==
X-Gm-Message-State: APjAAAWc4Y5/q6DwUjbc2fzzdlK9Jw4YkfiSRBV7NpkTPKyREOMV0wss
 97LvHR88GCVqVCQE0QwI++EjIghI
X-Google-Smtp-Source: APXvYqyqLHeP8OukroLomMD6UsdTdoqqbAT/+s7reQzmwd2hcZJI/RA1iNA2OSIa207vuKygSEYlXg==
X-Received: by 2002:a1f:2117:: with SMTP id h23mr12267041vkh.91.1564595923249; 
 Wed, 31 Jul 2019 10:58:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/26] drm/amdgpu: add structures for umc error address
 translation
Date: Wed, 31 Jul 2019 12:58:07 -0500
Message-Id: <20190731175818.20159-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L670ZjNTlEvRMf/e1lunJ1e1m9DGhml89FIld3LX6RQ=;
 b=A42mPq2RJz3DAdkF6YEs8HMjGLCSW/eFrV9hTQsHjV6auFOTeez0aMGMMXPDggHLMy
 bNRvJzd4PJ+ZvXmxOJCNPs5UW75rdaCok6uMkWD1O/U5MvgBjvnh/ySB6cX6SDn9PcsX
 pPw7/EzviX5rf/ARhH0qOXh1QYhd1HOm8W2iUZWGdEjtdwTu2wrLnpL2iG9mTXwv6dX8
 UpPrEDCQC1gy097Cx8lyiPc/hGXBwwBMJYxS7GxQGQe/LoNGM5J5lEVX2nX0OMRbXJA3
 UuowXePmtsZkZvnfgDSKTmP7QcSDELNRbGNXv8mDze0+GESR9VgPachEKHO5nAUVwWA8
 /ScQ==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKYWRkIHJlbGF0ZWQgcmVnaXN0ZXJz
LCBjYWxsYmFjayBmdW5jdGlvbiBhbmQgY2hhbm5lbCBpbmRleCB0YWJsZQoKU2lnbmVkLW9mZi1i
eTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91bWMuaCB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZf
MS5jICAgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKaW5kZXggZjVkNmRlZjk2NDE0
Li5kZmExYTM5ZTU3YWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91bWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgK
QEAgLTI0LDYgKzI0LDggQEAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsKIAl2b2lkICgqcXVl
cnlfcmFzX2Vycm9yX2NvdW50KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJdm9p
ZCAqcmFzX2Vycm9yX3N0YXR1cyk7CisJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyk7
CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X3VtYyB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91bWNfdjZfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2
XzEuYwppbmRleCA1YjFjY2I4MWIzYTIuLmUwNWYzZTY4ZWRiMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91bWNfdjZfMS5jCkBAIC0yOSw2ICsyOSwxNiBAQAogI2luY2x1ZGUgInVtYy91bWNf
Nl8xXzFfb2Zmc2V0LmgiCiAjaW5jbHVkZSAidW1jL3VtY182XzFfMV9zaF9tYXNrLmgiCiAKKyNk
ZWZpbmUgc21uTUNBX1VNQzBfTUNVTUNfQUREUlQwCTB4NTBmMTAKKworc3RhdGljIHVpbnQzMl90
CisJdW1jX3Y2XzFfY2hhbm5lbF9pZHhfdGJsW1VNQ19WNl8xX1VNQ19JTlNUQU5DRV9OVU1dW1VN
Q19WNl8xX0NIQU5ORUxfSU5TVEFOQ0VfTlVNXSA9IHsKKwkJezIsIDE4LCAxMSwgMjd9LAl7NCwg
MjAsIDEzLCAyOX0sCisJCXsxLCAxNywgOCwgMjR9LAkJezcsIDIzLCAxNCwgMzB9LAorCQl7MTAs
IDI2LCAzLCAxOX0sCXsxMiwgMjgsIDUsIDIxfSwKKwkJezksIDI1LCAwLCAxNn0sCQl7MTUsIDMx
LCA2LCAyMn0KK307CisKIHN0YXRpYyB2b2lkIHVtY192Nl8xX2VuYWJsZV91bWNfaW5kZXhfbW9k
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJICAgdWludDMyX3QgdW1jX2luc3Rh
bmNlKQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
