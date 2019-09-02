Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6150A5470
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 12:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3589B38;
	Mon,  2 Sep 2019 10:52:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369D89B30
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 10:52:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p13so14139886wmh.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Sep 2019 03:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hmf9aFIW8faZ1KjKvnzxrpqLftxl756Guv1tuCd9xf4=;
 b=tz7Bs57DxaDzA3Q+3Q8PkZO3mNNyh8tEzlGhdmxTRZa+BKE/fG3ixV8XSNgNSXxjjv
 dZq76292iPn0kqgKPTpGTRx1MpNZCJ2sRbZlKShNTHvyrnMI3HvPXmc+WDkL6TxbuqXq
 WAhJVF3vc5o8WluA6tfJ74YjQjZUEJSuTf+qJzphkD4+GxOnv2zutHF8ILaBS68bM9/X
 E4gUanBEm8BLN0/Vf4HW5oRdXkESesgNh1frW7aGSxvzLDrkIE1crh2t7NlTeS3wozY3
 Wd2uTHsR5jzMJNv/VNjhHetWj8EeF6NGhoVMyQwIaCzBj2zK4gFn+gSl+hlfV48uIqtI
 x4rg==
X-Gm-Message-State: APjAAAVs3s8rlslupP7T9HrncHkOWdrMauUuCkOAAS4FlVWKLRlBG+C9
 mqIZ9C7+yhdGn/6mOtKo2xIpdWxA
X-Google-Smtp-Source: APXvYqyreKN3W9tsrAj0Hh17mwePrw1Yl1QI6NtW9uhqZfyfa5QDwj4pMt9w4WZbu4amcvhI3X3PYw==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr32714342wmb.172.1567421541940; 
 Mon, 02 Sep 2019 03:52:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c1c3:95e3:f9c6:800c])
 by smtp.gmail.com with ESMTPSA id t198sm22240861wmt.39.2019.09.02.03.52.21
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 03:52:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page tables
Date: Mon,  2 Sep 2019 12:52:18 +0200
Message-Id: <20190902105219.2813-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902105219.2813-1-christian.koenig@amd.com>
References: <20190902105219.2813-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hmf9aFIW8faZ1KjKvnzxrpqLftxl756Guv1tuCd9xf4=;
 b=X0KhrEGvF9kNcVzp8vTfTDbDKZlQ3k55K5Ipe1hp/rWwdCK7TzcZAeGdkrkxFWx8sz
 PozMMSW/9ok7Fc0ObggJXA/xDNUw8fSXJnwCqpsZP2Tf4iIswtLrvpTsKC7D8cRmv7pk
 MDSp8zGCUBU4XM+85GAFdcszPzjO+CpQhKXKu4+wRfEGRODmmccoXica+d/2zL1b7kUN
 K+YECSv8yMVRsUUPuJwFz1yUxjq2ZMFd2EJCgQajbQUOl69visLSsLuNX8lin8r0HqeT
 i0IfoCdH4ACaVsXSDTP4AoXH8/ptHoy6vRejhzV1zST3CDolkXvXgyV+3tHMsO47X/lL
 B2Nw==
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

VGhpcyBob3BlZnVsbHkgaGVscHMgcmVkdWNlIHRoZSBjb250ZW50aW9uIGZvciBwYWdlIHRhYmxl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAgICAgICB8
IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDkg
KysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAppbmRleCAyZWRhM2E4YzMz
MGQuLjMzNTJhODdiODIyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgK
QEAgLTk5LDYgKzk5LDkgQEAgc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5OwogI2RlZmluZSBB
TURHUFVfVk1fRkFVTFRfU1RPUF9GSVJTVAkxCiAjZGVmaW5lIEFNREdQVV9WTV9GQVVMVF9TVE9Q
X0FMV0FZUwkyCiAKKy8qIFJlc2VydmUgNE1CIFZSQU0gZm9yIHBhZ2UgdGFibGVzICovCisjZGVm
aW5lIEFNREdQVV9WTV9SRVNFUlZFRF9WUkFNCQkoNFVMTCA8PCAyMCkKKwogLyogbWF4IG51bWJl
ciBvZiBWTUhVQiAqLwogI2RlZmluZSBBTURHUFVfTUFYX1ZNSFVCUwkJCTMKICNkZWZpbmUgQU1E
R1BVX0dGWEhVQl8wCQkJCTAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMKaW5kZXggMTE1MGUzNGJjMjhmLi41OTQ0MGY3MWQzMDQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCkBAIC0yNCw2ICsyNCw3IEBACiAK
ICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgImFtZGdwdS5oIgorI2luY2x1ZGUgImFt
ZGdwdV92bS5oIgogCiBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyIHsKIAlzdHJ1Y3QgZHJtX21tIG1t
OwpAQCAtMjc2LDcgKzI3Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVz
OwogCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7CiAJdW5zaWduZWQgbG9uZyBscGZuLCBu
dW1fbm9kZXMsIHBhZ2VzX3Blcl9ub2RlLCBwYWdlc19sZWZ0OwotCXVpbnQ2NF90IHZpc191c2Fn
ZSA9IDAsIG1lbV9ieXRlczsKKwl1aW50NjRfdCB2aXNfdXNhZ2UgPSAwLCBtZW1fYnl0ZXMsIG1h
eF9ieXRlczsKIAl1bnNpZ25lZCBpOwogCWludCByOwogCkBAIC0yODQsOSArMjg1LDEzIEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiwKIAlpZiAoIWxwZm4pCiAJCWxwZm4gPSBtYW4tPnNpemU7CiAKKwltYXhfYnl0ZXMgPSBh
ZGV2LT5nbWMubWNfdnJhbV9zaXplOworCWlmICh0Ym8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfa2Vy
bmVsKQorCQltYXhfYnl0ZXMgLT0gQU1ER1BVX1ZNX1JFU0VSVkVEX1ZSQU07CisKIAkvKiBiYWls
IG91dCBxdWlja2x5IGlmIHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2ggVlJBTSBmb3IgdGhpcyBC
TyAqLwogCW1lbV9ieXRlcyA9ICh1NjQpbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKLQlp
ZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdt
Yy5tY192cmFtX3NpemUpIHsKKwlpZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMsICZt
Z3ItPnVzYWdlKSA+IG1heF9ieXRlcykgewogCQlhdG9taWM2NF9zdWIobWVtX2J5dGVzLCAmbWdy
LT51c2FnZSk7CiAJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CiAJCXJldHVybiAwOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
