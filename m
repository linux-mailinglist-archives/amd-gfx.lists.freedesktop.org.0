Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F22B9859
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 22:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A355A6E0C6;
	Fri, 20 Sep 2019 20:18:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760F6E0C6
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 20:18:27 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y144so8572985qkb.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 13:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nizHnOhlWqmM4WtD/2WwkTmzF9axrSZ5FMSunBhZET0=;
 b=lnbUwsfWBQLRSY1ueC8CXsDRFDzBmLpaREwtqCB71PE5EjIOKqOgwk/a6nfbmlNK44
 VSL8Yj5bjmuThmg+R02GQD1M6JHBEGOWJO/SeOhYr9oyy6R14XI2TD0QUvqT4etkm3b5
 jhuVBDaRLo2BHKv4ergq2ddvlK4c891uTevpXYw3kVzw71vzdWOP1Zb5tGnsDVu/QLxv
 m/xovlqVgmJDvKBJwHt8mx6Dt0H730x72Btnb/wTCvqaDedkyYTYj6SK4T808Fd5MLv1
 WTWksXPK8LiGL/vN2Z9rJ2TykRcamFbEsspSbjTZj8bqitPC96Kj8zdpqWKje5NKktfY
 G7Qw==
X-Gm-Message-State: APjAAAVcoPYOhBFSHFXQFlPikGPYwSgksyGcd5bEvDHm3OHqrjERIlDd
 rBWRchhcJ8fQUcQVKSjr2DVOup7i
X-Google-Smtp-Source: APXvYqwU/0ecjuF3KChMWSMB2INQPj/2cD01LEb9kEJizOp9uzwh1sXxt+ihi6YurU5h6PeU9p5w/Q==
X-Received: by 2002:a05:620a:694:: with SMTP id
 f20mr5753675qkh.379.1569010706020; 
 Fri, 20 Sep 2019 13:18:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id o14sm1778589qtk.52.2019.09.20.13.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 13:18:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: fix 64 bit divide
Date: Fri, 20 Sep 2019 15:18:12 -0500
Message-Id: <20190920201812.3763-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nizHnOhlWqmM4WtD/2WwkTmzF9axrSZ5FMSunBhZET0=;
 b=a2MQaddFyTy22UYk2KoitFtGnjNsBONu5b/LJgalYc1oFYNL7KtgMm/J51GnX1eOtn
 1rJ0sjCRSmSgZZztX2PjfZ+2eVg2kP5hpoAcbKgGaHOSjZIT3iN+dC+zL4DY1+itj3ZH
 j9UNRIfph3DzmxhZGHNh4I/L+IR3D2pdknonwYiyIxiMYn595cHdV89kCvz51fpsDuQf
 tckP7Nfg72V689ctmsopSMRHwLnPv1JQr8gqhOgHrx6vMiFdkwMLUiTNfv20Ti74gp5H
 PadPFv3aUoEzpu6kuEM1DDJOHoxPb4DcaazwqNIsu2K7F8w8SaHeEMTQNyKv7c9IzNgc
 sn/w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHByb3BlciBoZWxwZXIgZm9yIDMyIGJpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5jICAgIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtfbWdy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY2UxMTAvZGNlMTEw
X2Nsa19tZ3IuYwppbmRleCAzNjI3N2JjYTAzMjYuLmIxZTY1N2UxMzdhOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtf
bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEw
L2RjZTExMF9jbGtfbWdyLmMKQEAgLTE5Nyw3ICsxOTcsOSBAQCB2b2lkIGRjZTExX3BwbGliX2Fw
cGx5X2Rpc3BsYXlfcmVxdWlyZW1lbnRzKAogCSAqLwogCWlmIChBU0lDUkVWX0lTX1ZFR0EyMF9Q
KGRjLT5jdHgtPmFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSAmJiAoY29udGV4dC0+c3RyZWFtX2Nv
dW50ID49IDIpKSB7CiAJCXBwX2Rpc3BsYXlfY2ZnLT5taW5fbWVtb3J5X2Nsb2NrX2toeiA9IG1h
eChwcF9kaXNwbGF5X2NmZy0+bWluX21lbW9yeV9jbG9ja19raHosCi0JCQkodWludDMyX3QpIChk
Yy0+YndfdmJpb3MtPmhpZ2hfeWNsay52YWx1ZSAvIG1lbW9yeV90eXBlX211bHRpcGxpZXIgLyAx
MDAwMCkpOworCQkJCQkJCSAgICh1aW50MzJfdCkgZGl2NjRfczY0KAorCQkJCQkJCQkgICBkaXY2
NF9zNjQoZGMtPmJ3X3ZiaW9zLT5oaWdoX3ljbGsudmFsdWUsCisJCQkJCQkJCQkgICAgIG1lbW9y
eV90eXBlX211bHRpcGxpZXIpLCAxMDAwMCkpOwogCX0gZWxzZSB7CiAJCXBwX2Rpc3BsYXlfY2Zn
LT5taW5fbWVtb3J5X2Nsb2NrX2toeiA9IGNvbnRleHQtPmJ3X2N0eC5idy5kY2UueWNsa19raHoK
IAkJCS8gbWVtb3J5X3R5cGVfbXVsdGlwbGllcjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
