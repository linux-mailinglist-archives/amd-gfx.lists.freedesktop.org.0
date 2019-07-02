Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADE5D768
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702ED6E03B;
	Tue,  2 Jul 2019 20:29:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4389FC5
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:18 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so20109723qtk.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqbEGbSY0Ysgpuy8gmYNeHhVc+5VIqfJwIW170r9hik=;
 b=kozI3vLNtD6iaG6mpnlsl00ydpcHUivNGCpw1woH9Pu9sc8NwmOTowd9gf/gU6oMzQ
 b27IZGW2T1hn9ewfJNO7/O3dQvA8uPN7PBasgXQDQ7EL+TyVCCc4IdrXzB8xglqGHm95
 Cw9Ay09daSmD/yCHsCbiclmGeAHPZ/xS/2AwwepMgUdN/9pg97V83Kp2RqehGmcWA5ba
 QOQTK1EQ20fMt9yMHzbMr7iZr6uqRyqv2g4jAebcAeo6dPoakR38+kQmiwmpdbMudT8m
 vW7S+Wo7UMRXB1p9CrmOsGjBnjeIjc36Qzltuodphpq3zNrWhRTYNFqd+opgPO9nMq5t
 qdTA==
X-Gm-Message-State: APjAAAXbrm2Ef3rX75aW+Vn9ndJymrq2BbhmNgVB+TxheUEwwMa4FBsO
 H2K0y4iYixj5od9Xt/uKjYYzq5kZBl8=
X-Google-Smtp-Source: APXvYqwPIcKzgbfnqaoLtRyNnONspqmDZQlHGW3gNqo97pEHat8dKpGiDJjQSoWLyfuN9Adm/R3rHA==
X-Received: by 2002:ac8:2b62:: with SMTP id 31mr27414063qtv.140.1562099357136; 
 Tue, 02 Jul 2019 13:29:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/53] drm/amdgpu/gfx10: update gfx golden settings for navi14
Date: Tue,  2 Jul 2019 15:28:15 -0500
Message-Id: <20190702202844.17001-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqbEGbSY0Ysgpuy8gmYNeHhVc+5VIqfJwIW170r9hik=;
 b=A8IUu9Y8lychpQYY4npljPw0vXSYKLxN7FcwZZtlg30/DZd9R1kfqgCni/5vHkA24r
 opuqWmjBpCBRTxF7kiIaepLhZM8u4AKFgji8hpFBYf8hNO3vsmfuHi+8ls4zfdsNetoZ
 pf4vct1B9SLqjt9zQ+wxVmYYegUCehxh3f3SyApLTzEXS8C4yeUlo5CHmZEvv+ZliKAA
 S8HIovHBEqT6WZQisfJ97oIFjkApkEVfd7S/VQHvO7JYkE8q4qrrzBUSOKdHVwFD5LDA
 Y+mfdS8X+6BvvPxNuodG4wwVMr80W+L4I85+2gleqzU/iL4ScbRZj04CBvZtUGE3YO2C
 aA/g==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCB1cGRhdGVkIHNl
dHRpbmdzIGZyb20gaHcgdGVhbS4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2pp
ZS55dWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YyB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA5NzE4OTQx
MzQwNjIuLmYzMzBmMWRlYWI2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKQEAgLTEyNCw2ICsxMjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xk
ZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfMVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbUNCX0hXX0NPTlRST0xfNCwgMHhmZmZmZmZmZiwgMHgwMDNjMDAxNCksCiAJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DR1RUX0dTX05HR19DTEtfQ1RSTCwgMHhmZmZm
OGZmZiwgMHhmZmZmODEwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DR1RU
X0lBX0NMS19DVFJMLCAweGZmZmYwZmZmLCAweGZmZmYwMTAwKSwKKwlTT0MxNV9SRUdfR09MREVO
X1ZBTFVFKEdDLCAwLCBtbUNHVFRfU1BJX0NMS19DVFJMLCAweGMwMDAwMDAwLCAweGMwMDAwMTAw
KSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNHVFRfU1FfQ0xLX0NUUkwsIDB4
ZjhmZjBmZmYsIDB4NjAwMDAxMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1t
Q0dUVF9TUUdfQ0xLX0NUUkwsIDB4NDAwMDBmZjAsIDB4NDAwMDAxMDApLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tQ0dUVF9WR1RfQ0xLX0NUUkwsIDB4ZmZmZjhmZmYsIDB4ZmZm
ZjgxMDApLApAQCAtMTMzLDYgKzEzNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVn
X2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMV8xW10gPQogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tQ1BfU0RfQ05UTCwgMHg4MDAwMDdmZiwgMHgwMDAwMDVmZiksCiAJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRywgMHhmZmZmZmZmZiwgMHgyMDAw
MDAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRzIsIDB4ZmZm
ZmZmZmYsIDB4MDAwMDA0MjApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJf
REVCVUczLCAweDAwMDAwMjAwLCAweDAwMDAwMjAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbURCX0RFQlVHNCwgMHhmZmZmZmZmZiwgMHgwNDgwMDAwMCksCiAJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERlNNX1RJTEVTX0lOX0ZMSUdIVCwgMHgwMDAwZmZm
ZiwgMHgwMDAwMDAzZiksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9MQVNU
X09GX0JVUlNUX0NPTkZJRywgMHhmZmZmZmZmZiwgMHgwMzg2MDIwNCksCkBAIC0xNDQsMTQgKzE0
NiwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRp
bmdzX2djXzEwXzFfMVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMl9Q
SVBFX1NURUVSXzEsIDB4Nzc3Nzc3NzcsIDB4MTMyMDMxMjApLAogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tR0wyQV9BRERSX01BVENIX01BU0ssIDB4ZmZmZmZmZmYsIDB4ZmZmZmZm
ZTcpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0wyQ19BRERSX01BVENIX01B
U0ssIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZTcpLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0Ms
IDAsIG1tR0wyQ19DR1RUX1NDTEtfQ1RSTCwgMHhmZmZmMGZmZiwgMHgxMDAwMDEwMCksCiAJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HTDJDX0NUUkwyLCAweGZmZmZmZmZmLCAweDE0
MDIwMDJmKSwKLQlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkNfQ1RSTDMsIDB4
ZmZmZmJmZmYsIDB4MDAwMDIxODgpLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1t
R0wyQ19DVFJMMywgMHhmZmZmYmZmZiwgMHgwMDAwMDE4OCksCiAJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShHQywgMCwgbW1QQV9TQ19FTkhBTkNFLCAweDNmZmZmZmZmLCAweDA4MDAwMDA5KSwKIAlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVBBX1NDX0xJTkVfU1RJUFBMRV9TVEFURSwg
MHgwMDAwZmYwZiwgMHgwMDAwMDAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwg
bW1STUlfU1BBUkUsIDB4ZmZmZmZmZmYsIDB4ZmZmZjMxMDEpLAotCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tU1BJX1NYX0VYUE9SVF9CVUZGRVJfU0laRVMsIDB4ZmZmZmZmZmYsIDB4
MDgwMDA0MDApLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU1BJX1NYX1NDT1JF
Qk9BUkRfQlVGRkVSX1NJWkVTLCAweGZmZmZmZmZmLCAweDAwNDAwMDQwKSwKIAlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbVNRX0FMVV9DTEtfQ1RSTCwgMHhmZmZmZmZmZiwgMHhmZmZm
ZmZmZiksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TUV9BUkJfQ09ORklHLCAw
eDAwMDAwMTMzLCAweDAwMDAwMTMwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBt
bVNRX0xEU19DTEtfQ1RSTCwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiksCiAJU09DMTVfUkVHX0dP
TERFTl9WQUxVRShHQywgMCwgbW1UQV9DTlRMX0FVWCwgMHhmZmY3ZmZmZiwgMHgwMTAzMDAwMCks
CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1VVENMMV9DVFJMLCAweGZmZmZmZmZm
LCAweDAwMDAwMDAwKSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
