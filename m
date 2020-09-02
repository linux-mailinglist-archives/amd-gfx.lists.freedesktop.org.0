Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0CA25AAD5
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Sep 2020 14:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC0C6E488;
	Wed,  2 Sep 2020 12:06:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C666E488
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Sep 2020 12:06:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c19so3024574wmd.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Sep 2020 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZXVSraDp98clxRU6vQz4fdtIglZYAG/44ntY18YFn8=;
 b=kUlZEYcHCKZ15HvK3f0gMHAjFj05JwiZuivrtYcRNeoNZvj0utyIo88VaA5yPWRfZS
 ZNK6nkBY8PhuqMSard2iaAnCFRtHNiqtKMzQrXFcqtEZ+xz7/ShTi2kCCFKzJTENKi6t
 s1P0DMM21dHP7kC2Xlg5nNcvww64RGFeWOd78jrkgkK0hPyKWvl8ia/+Gts5i2gJf354
 3tQCSvcfE8dcBgOhXDnzYfvMAHQBxR/qeRT36nK+JZdnTvcP0SGKRr0d48J3x7L8l8Bd
 RupC2jZiXxcPa7JFBiEbUjrXGXzJegT89N+2LtN5fhjmBqYARnLILJa0McqmU+Tdyhxp
 HIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZXVSraDp98clxRU6vQz4fdtIglZYAG/44ntY18YFn8=;
 b=NU8e1DAJRddSRph7gruQxckUJreeKWQlLv3STw/SGPyPXOAsvcHCI4+sX4WT4L/hzI
 PJr6bHfcv7GPE+JFBZYxbUKonf2RG4GLhZXu+PnMz11gYwIGgeb6/8RtvYWJNDA+rDd/
 B0rau+/xX/3qHmrZdVHqA51pzL0k8Rza6QCopN3//yiMMKBDa+DLJD9TT/pqI/bQHGSf
 dyH/3l/gelqk51TU5dOHoaQVrxrAimKvA7CE2HCbJ1PX+ZSAADeWEfYyrECbBZRqz5vT
 TgBmmTWEXeCzNeJQ42gc9Iak7xLCsu1d1JdajF0nQaHxWmtNi3TSgm2ogSMfV+I45zMl
 G3uA==
X-Gm-Message-State: AOAM532r6aBZwTcOQsFzHjaARM0PLN2U3pzIKLcTwau7lSbrRxP599qt
 pYKAnAnCkoLpOXEfpR08eDE=
X-Google-Smtp-Source: ABdhPJxxzo6wuqh4GDs39R+YSVIfo5A02ZBr97RDousT61COYCMDgS16eTL4Bc2mMMrzDeLuREuPQg==
X-Received: by 2002:a1c:20d3:: with SMTP id g202mr369225wmg.54.1599048359217; 
 Wed, 02 Sep 2020 05:05:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:75a9:138:b492:b07])
 by smtp.gmail.com with ESMTPSA id q18sm6178655wmc.21.2020.09.02.05.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 05:05:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: xinhui.pan@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix max_entries calculation
Date: Wed,  2 Sep 2020 14:05:57 +0200
Message-Id: <20200902120557.2229-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Q2FsY3VsYXRlIHRoZSBjb3JyZWN0IHZhbHVlIGZvciBtYXhfZW50cmllcyBvciB3ZSBtaWdodCBy
dW4gYWZ0ZXIgdGhlCnBhZ2VfYWRkcmVzcyBhcnJheS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KRml4ZXM6IDFlNjkxZTI0NDQ4NyBk
cm0vYW1kZ3B1OiBzdG9wIGFsbG9jYXRpbmcgZHVtbXkgR1RUIG5vZGVzCi0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKaW5kZXggOGJjMjI1MzkzOWJlLi44YWE5NTg0YzE4NGYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0xNjk3LDcgKzE2OTcsOCBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bV9ib19zcGxpdF9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQkJCUFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0U7CiAJCX0gZWxzZSB7CiAJCQlhZGRyID0g
MDsKLQkJCW1heF9lbnRyaWVzID0gUzY0X01BWDsKKwkJCW1heF9lbnRyaWVzID0gKChtYXBwaW5n
LT5sYXN0IC0gbWFwcGluZy0+c3RhcnQpID4+CisJCQkJICAgICAgIEFNREdQVV9HUFVfUEFHRV9T
SElGVCkgKyAxOwogCQl9CiAKIAkJaWYgKHBhZ2VzX2FkZHIpIHsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
