Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC05D76A
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4601F6E059;
	Tue,  2 Jul 2019 20:29:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848189FD3
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:19 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so20127958qtr.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M7Jxc0zvZrq1UviKHNCNJyU2HzP1fxye/yzU1S0CPhs=;
 b=K4ZXY4g+vg4yx0tlalvSZOm3aT1x2GgbKmKMDeUDxTKB7r3k6FRWenQ0cT4nP9riXQ
 y+bZaOkGGYlbMTHGQtHVzWBlIr/3EQly286Yf9LHURZzwmM81/IVI8zZ4udOHjGUrYkm
 aQKoDcFcdH1EBkvdDxZOi3bBUBvVJDeJ0V3bKjcs7dcXG1Z8ql0jDzwlNxo9af3eVu02
 c79hj+ggGH8cIIiHntZ+faijBfKUuk466FIMUB6lbrhG+X3XUSu9wqQ2zC5qIv58TvhV
 UrpkwykPWUBako+4KP/u/r97j4PSlspw/c7gCkv+WCBo/ggiw4PPUnYYMGPKNHV65tAK
 vqUA==
X-Gm-Message-State: APjAAAXp8jms/mhCMp3MJoxfLBU1Rc/efibGRdEIdCIzDonEB53rRWTu
 Zw4i4/nKv70PEXmZUHJfLUkOpM3VsxI=
X-Google-Smtp-Source: APXvYqy+UcUadqeV6jWwCYr6jnTtu3w+dHvvkM40pxgWQAP3F9PDk80tIlRXgWvGtffXykauLCHSAA==
X-Received: by 2002:ac8:31d6:: with SMTP id i22mr27977631qte.338.1562099358009; 
 Tue, 02 Jul 2019 13:29:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/53] drm/amdgpu/gfx10: update gfx golden settings for navi14
Date: Tue,  2 Jul 2019 15:28:16 -0500
Message-Id: <20190702202844.17001-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M7Jxc0zvZrq1UviKHNCNJyU2HzP1fxye/yzU1S0CPhs=;
 b=qvhpIFOLvmjyKGXIvCRe7P1bHNagTHALH2yLFRz3I2esqJb1Vz9t0yKlXM7fzx6Pt6
 ojqiz0fWmuX/0RC5xtm3xyxcFXVM3gKtAanDGQJJJphfEKXrzmSQKrjFxeMK/AiG8xoz
 Gs9GtL0uUYCdtGScUS2u/FwXZZhKv2dtJLU/YSziZp2E1LIc5FN1ha9zS6t49nDQ9bbj
 pr9tVJVF9LcE1qLm0RNw2OfDXWQIuQLi1c6As+1l03VoWLETNw4IHt3uYkaR8h8KfFM2
 cKkxaDA0oI/TDf+fiJipwys4dFhTr77iGN/UydnQSs2Ku+nJsesJtUjmFqpyZ9+TWlsF
 u4+A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKVXBkYXRlZCBzZXR0aW5ncyBmcm9t
IGh3IHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+CkFj
a2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBmMzMwZjFkZWFiNmYuLjA1ZDI1YTZmODBjMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTEzNSwyOCArMTM1LDI4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2Nf
MTBfMV8xW10gPQogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREVCVUcsIDB4
ZmZmZmZmZmYsIDB4MjAwMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1t
REJfREVCVUcyLCAweGZmZmZmZmZmLCAweDAwMDAwNDIwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZB
TFVFKEdDLCAwLCBtbURCX0RFQlVHMywgMHgwMDAwMDIwMCwgMHgwMDAwMDIwMCksCi0JU09DMTVf
UkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRzQsIDB4ZmZmZmZmZmYsIDB4MDQ4MDAw
MDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREVCVUc0LCAweGZmZmZm
ZmZmLCAweDA0OTAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0RG
U01fVElMRVNfSU5fRkxJR0hULCAweDAwMDBmZmZmLCAweDAwMDAwMDNmKSwKIAlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0xBU1RfT0ZfQlVSU1RfQ09ORklHLCAweGZmZmZmZmZm
LCAweDAzODYwMjA0KSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdCX0FERFJf
Q09ORklHLCAweDBjMTgwMGZmLCAweDAwMDAwMDQzKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbUdDUl9HRU5FUkFMX0NOVEwsIDB4MWZmMGZmZmYsIDB4MDAwMDA1MDApLAogCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0VfUFJJVl9DT05UUk9MLCAweDAwMDAwN2Zm
LCAweDAwMDAwMWZlKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMV9QSVBF
X1NURUVSLCAweGZmZmZmZmZmLCAweGU0ZTRlNGU0KSwKLQlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbUdMMl9QSVBFX1NURUVSXzAsIDB4Nzc3Nzc3NzcsIDB4MTMyMDMxMjApLAotCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0wyX1BJUEVfU1RFRVJfMSwgMHg3Nzc3Nzc3
NywgMHgxMzIwMzEyMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HTDJBX0FE
RFJfTUFUQ0hfTUFTSywgMHhmZmZmZmZmZiwgMHhmZmZmZmZlNyksCiAJU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1HTDJDX0FERFJfTUFUQ0hfTUFTSywgMHhmZmZmZmZmZiwgMHhmZmZm
ZmZlNyksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HTDJDX0NHVFRfU0NMS19D
VFJMLCAweGZmZmYwZmZmLCAweDEwMDAwMTAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdD
LCAwLCBtbUdMMkNfQ1RSTDIsIDB4ZmZmZmZmZmYsIDB4MTQwMjAwMmYpLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tR0wyQ19DVFJMMywgMHhmZmZmYmZmZiwgMHgwMDAwMDE4OCks
CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1QQV9TQ19FTkhBTkNFLCAweDNmZmZm
ZmZmLCAweDA4MDAwMDA5KSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVBBX1ND
X0VOSEFOQ0VfMSwgMHgwMDQwMDAwMCwgMHgwNDQ0MDAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShHQywgMCwgbW1QQV9TQ19MSU5FX1NUSVBQTEVfU1RBVEUsIDB4MDAwMGZmMGYsIDB4MDAw
MDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUk1JX1NQQVJFLCAweGZm
ZmZmZmZmLCAweGZmZmYzMTAxKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNR
X0FMVV9DTEtfQ1RSTCwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiksCiAJU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1TUV9BUkJfQ09ORklHLCAweDAwMDAwMTMzLCAweDAwMDAwMTMwKSwK
IAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNRX0xEU19DTEtfQ1RSTCwgMHhmZmZm
ZmZmZiwgMHhmZmZmZmZmZiksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1UQV9D
TlRMX0FVWCwgMHhmZmY3ZmZmZiwgMHgwMTAzMDAwMCksCi0JU09DMTVfUkVHX0dPTERFTl9WQUxV
RShHQywgMCwgbW1VVENMMV9DVFJMLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwKSwKKwlTT0MxNV9S
RUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRDUF9DTlRMLCAweDYwMDAwMDEwLCAweDQ3OWMwMDEw
KSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVVUQ0wxX0NUUkwsIDB4MDA4MDAw
MDAsIDB4MDA4MDAwMDApLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29s
ZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xX252MTRbXSA9Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
