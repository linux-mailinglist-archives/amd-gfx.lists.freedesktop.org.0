Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0636B7A49
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 15:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F66F672;
	Thu, 19 Sep 2019 13:16:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1A56F672
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 13:16:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so3926406wmi.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 06:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiKrLKq5wNW1WKItHMJHxbRIMokQFlZKBp8MlD7fVG0=;
 b=GACfo8jPWhzh8dY1eQtdCh/AYKfig6gZ8vQ62qjBOgbXHXY3o3+rC/K/7I76nOyhjC
 KK8dO+75IxGsBwJ99UvEhS6d0GvJry9Ut2c9ISIgT3W4rP8LL14ge3YH4yyviakRtKvg
 4aKiTLIjTJ6aQ631J40zuTB37j3S8U6hPU2i8vhmodDr78JsGghSukwD0kn/i8zN33P2
 bXhX/uOJ8pZEa0vTXxDhbVcj89kqFkhY7VQsFjdNtvT43UFdJKO1ZNsMk6bFGs9qQk6L
 49RknDc+8rvA4TLAiy2DMmkH6DDc9cAtW5ad9698rEbmWwnzGvH2Pvfy/CPPapDFX/kj
 5Wmw==
X-Gm-Message-State: APjAAAUwjcAJQn5x0MnNryqkSwX4xEkZk8QC0iqkI4GDwnr1kP0XGdTI
 SDsZtoiKtT6IChpRRv+VGfvYmyal
X-Google-Smtp-Source: APXvYqzS+/SVrD92zD/uZagYFsVGjXud1EbgMBpAhYW1EVHtd//9X/anx5JvC4YORB3TXc0u1e/hVw==
X-Received: by 2002:a1c:4945:: with SMTP id w66mr2749692wma.40.1568899011344; 
 Thu, 19 Sep 2019 06:16:51 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:259e:a58b:231a:a2e4])
 by smtp.gmail.com with ESMTPSA id i1sm7500898wmb.19.2019.09.19.06.16.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:16:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: restrict hotplug error message
Date: Thu, 19 Sep 2019 15:16:49 +0200
Message-Id: <20190919131649.8406-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiKrLKq5wNW1WKItHMJHxbRIMokQFlZKBp8MlD7fVG0=;
 b=uvh8Ba/FmbvPY9ZtEoleRUf6LEIQEzndZoZmug622X1ooxdzvaIKpo3crKZ2TkrW/T
 Fl2g3Rn0Qn66zFN+ygYX60njxhK0h0X2Mepb2Qe0e6+GAeum7KCzRY5Xjb9u4OtFM7Wb
 JtpnH4fsFtwZrI9hvJlUm4k5JweMKQY2TM5G/F8xiHctgwrEcw4Z4FWo2Jh3fNvTmXlJ
 NswVNSaKB0nGlOdOFDaTGogqfrhsmyvKsXJ0BTBBliFMDQIJtLJVC8Oke/fzBmvPNi6V
 H4IsdL0BUOax8cN4mnpAjqhU+0sG3Z2HnSSGbEbZAOpt5wKyIcqFvuVTpqBi7Me7G8XR
 LTng==
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
Cc: Emily.Deng@amd.com, Jack.Zhang1@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIHByaW50IHRoZSBlcnJvciBvbmx5IHdoZW4gd2UgYXJlIGhvdHBsdWdnZWQgYW5k
IGNyYXNoCmJhc2ljYWxseSBhbGwgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA1ICsrKystCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDY5NzhkMTdhNDA2Yi4uNWNiODA4Y2I4MTA4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMDk4LDcgKzEwOTgsMTAg
QEAgYW1kZ3B1X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCURSTV9FUlJPUigiRGV2
aWNlIHJlbW92YWwgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxu
Iik7CisjaWZkZWYgTU9EVUxFCisJaWYgKFRISVNfTU9EVUxFLT5zdGF0ZSAhPSBNT0RVTEVfU1RB
VEVfR09JTkcpCisjZW5kaWYKKwkJRFJNX0VSUk9SKCJIb3RwbHVnIHJlbW92YWwgaXMgbm90IHN1
cHBvcnRlZFxuIik7CiAJZHJtX2Rldl91bnBsdWcoZGV2KTsKIAlkcm1fZGV2X3B1dChkZXYpOwog
CXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
