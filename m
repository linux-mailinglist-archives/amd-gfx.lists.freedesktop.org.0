Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224779983
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FFE6E27A;
	Mon, 29 Jul 2019 20:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FA96E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:37 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id k9so41842510vso.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6VgqLfeRuCmGztjpy1PE1nywa5D/pDXrSk0I9iY79s=;
 b=fBrQ1yxZf7snrJc4db8OgUAM9cpaM1W8W/nz0Zs43HUmGp2+/gXR5EjVI8PVP7e1g3
 ONCfHRfGSBmpZRCyfW+s4EILtI7fCk5GGAQ1NzdCesAWg1bBvlEHAU7NLxjtwrp31h9z
 sXtHIB7THIjoNaW+kksXoCi0NLKN6/M7nHy1wCfIQhXS7AYPD4mhlrpJ0Rtpomh90vov
 oxMDeEI4e3NboTN5eKb7ovABjLkMOsnRq04lE6pj84B6fNu4smT8T/Ji8+FW0mlMETbz
 VQTVL9DyU98tXQYxX61VsSuK+raicqh4WVhGREMr9pQEedj2nneNQKAPZvb2xLDAzfWC
 mDog==
X-Gm-Message-State: APjAAAWHW6VB23ORLgYPm9Uhq/4bdrNWrHHxLkDx/SeYkMV74cIisadl
 3tWH6/5CFXWYgvwYWH66cXFjWIng
X-Google-Smtp-Source: APXvYqxlufclKxHAj1/QPWiUT9Fe1Kzrg88vlR2OtkvDMQmGpjgWaCPM4Z0pY/E511ap1Dp8MHVDmw==
X-Received: by 2002:a67:fc50:: with SMTP id p16mr72220293vsq.79.1564431336511; 
 Mon, 29 Jul 2019 13:15:36 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/30] drm/amd/powerplay: init arcturus SMU metrics table on
 bootup
Date: Mon, 29 Jul 2019 15:14:56 -0500
Message-Id: <20190729201508.16136-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6VgqLfeRuCmGztjpy1PE1nywa5D/pDXrSk0I9iY79s=;
 b=foC2sSrIyShEqOi39L2FPhPS3engfeNBGUs+rMb+7Xhhmg3QYeGpu/BT2lHk4QJFCA
 hSNUf+IwU01eY7K3e0fmzCtafmOAMNVCJc4p6dmxYgsNIgD623xNuiwGmizvoUxSe1jT
 EGbJ/Y+v6Gm8oI7svyhHqiB2d7y/eCGQspoX73N+2QH4X1N3xwyx2Fub2+ln6WzAGqhu
 id0RVCUeHIMfmi6HUaSQkAxv/RF/DACQeuuBtNMYlD0HuJR2vw71KFVtBFxco4gJBcw9
 ltmW9ti9Jo3Yx7Fa4VCTbViZmheyAclJGlR9whgAzVp1gp1Qlniy0wxnlYtiHl+awiNz
 p3EQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkluaXRpYWxpemUgYXJjdHVydXMg
U01VIG1ldHJpY3MgdGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBh
bWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCBhMDY0NGVmMjY3YTkuLjVmOTExZjA5MjMxMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTI2
Nyw2ICsyNjcsOCBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX2dldF93b3JrbG9hZF90eXBlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIFBQX1NNQ19QT1dFUgogCiBzdGF0aWMgaW50IGFyY3R1
cnVzX3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3RhYmxl
ICp0YWJsZXMpCiB7CisJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVfdGFibGUgPSAmc211
LT5zbXVfdGFibGU7CisKIAlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9QUFRBQkxF
LCBzaXplb2YoUFBUYWJsZV90KSwKIAkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01B
SU5fVlJBTSk7CiAKQEAgLTI3Niw2ICsyNzgsMTEgQEAgc3RhdGljIGludCBhcmN0dXJ1c190YWJs
ZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGUK
IAlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgc2l6ZW9mKFNt
dU1ldHJpY3NfdCksCiAJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0p
OwogCisJc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlID0ga3phbGxvYyhzaXplb2YoU211TWV0cmlj
c190KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCisJCXJl
dHVybiAtRU5PTUVNOworCXNtdV90YWJsZS0+bWV0cmljc190aW1lID0gMDsKKwogCXJldHVybiAw
OwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
