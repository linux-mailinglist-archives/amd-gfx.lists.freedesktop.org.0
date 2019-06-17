Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1B48EA3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EE38989E;
	Mon, 17 Jun 2019 19:27:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAC08989E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:30 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12212295qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RXem4+Z7NGFj6rcse9fjl/s1gTx3wIpJvzqwEObuhA=;
 b=AUcaMm343xbXwubNKjzI58ofeAfBOsccEjkgADmBmzPAZTcON6f05p2fz0L0esiKR4
 9rO3xnHuTAGy+FfWqek876/y/TSEPgi40jEyx8yGnyzVFLHFttQpm6sPnQLDdgGS9W14
 W2EIM/2tAt+ao83aTCcPh7u+ong5RrymeUGg9jYQ64mQbpYxSbg/OFEHPXo4zkved/0C
 u5uLdy7b0xvI+oVYon+fsBBUJsQ13jsIe65SQ3qX5sLKN9Ao2kSu8+oxWuH8Jf+i6QmX
 eKCawSGlU2vAw0w4F0FpYZUs0iB1ur10tG/YH0wxwIA5P1jxSE7T+yA5xUKS4g+pVeSY
 VWJg==
X-Gm-Message-State: APjAAAUSEZNM3ZuUzbUwv895Ql/iDu87gx+e0MuDtBicBekbEyW0/yXo
 ahGEzYpJPuBmSNU8WrFzRDYN4UAkXcY=
X-Google-Smtp-Source: APXvYqzKEvirao4jelDEK6JPiCyyUfv9MN61nCtaM4pVVJa5CGWtJqv9Mo4n37Vt81H4VbXmgK06bw==
X-Received: by 2002:aed:24d9:: with SMTP id u25mr97924689qtc.111.1560799649052; 
 Mon, 17 Jun 2019 12:27:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 118/459] drm/amdgpu/mes: add amdgpu_mes driver parameter
Date: Mon, 17 Jun 2019 14:25:43 -0500
Message-Id: <20190617192704.18038-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RXem4+Z7NGFj6rcse9fjl/s1gTx3wIpJvzqwEObuhA=;
 b=iLNc7R6E3ePt6NCQGSuLLM8s1S2DuBU4ea6C6NLhWcCsijBFbkct/owj6HZs5ZFi9I
 s007DzeEbrQn376YGyOXIyfl7ppfMfJYgmaG13LQVnLAUjB6kmDrT3NFud75cun+8nSm
 pYcafUKrgpsBjd46QO/tdFgsO+VbdC2WsQjKO7c3GSo+gEHwQo+WElLyyFeLrf49YRXa
 5p6WlghEcAwqp8mBmbZtm/hYTABCRn1Xa/S5JnfUsix1Q2x9oStQnPSeL6xK2Mi6rHkb
 EtZJp7tUeCPbj7joqz5i52LwldK/zrx32RQKf+NAWvamg3B6xkd2X0gk0S5wFNsnYMK1
 wqqQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCmFtZGdwdV9tZXMsIHdoaWNoIGlz
IGEgZHJpdmVyIHNjb3BlIHBhcmFtZXRlciwgaXMgdXNlZAp0byB3aGV0aGVyIGVuYWJsZSBtZXMg
b3Igbm90LgoKTUVTIChNaWNybyBFbmdpbmUgU2NoZWR1bGVyKSBpcyB0aGUgbmV3IG9uIGNoaXAg
aHcgc2NoZWR1bGluZwptaWNyb2NvbnRyb2xsZXIuICBJdCBjYW4gYmUgdXNlZCB0byBoYW5kbGUg
cXVldWUgc2NoZWR1bGluZyBhbmQKcHJlZW1wdGlvbiBhbmQgcHJpb3JpdGllcy4KCkFja2VkLWJ5
OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEph
Y2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCBiNGE4ODdlNDIzNzAuLmE0ZTJjZTQ4YmQ2MyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTE2Miw2ICsxNjIsNyBAQCBleHRl
cm4gdWludCBhbWRncHVfcmFzX21hc2s7CiBleHRlcm4gaW50IGFtZGdwdV9hc3luY19nZnhfcmlu
ZzsKIGV4dGVybiBpbnQgYW1kZ3B1X21jYnA7CiBleHRlcm4gaW50IGFtZGdwdV9kaXNjb3Zlcnk7
CitleHRlcm4gaW50IGFtZGdwdV9tZXM7CiAKICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQog
ZXh0ZXJuIGludCBhbWRncHVfc2lfc3VwcG9ydDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwppbmRleCBiMjI1OThhMzAxMzQuLjk2NDZkZTJkYWEwMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTM5LDYgKzEzOSw3IEBAIHVpbnQgYW1k
Z3B1X2RjX2ZlYXR1cmVfbWFzayA9IDA7CiBpbnQgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nID0gMTsK
IGludCBhbWRncHVfbWNicCA9IDA7CiBpbnQgYW1kZ3B1X2Rpc2NvdmVyeSA9IDA7CitpbnQgYW1k
Z3B1X21lcyA9IDA7CiAKIHN0cnVjdCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbyA9IHsKIAku
bXV0ZXggPSBfX01VVEVYX0lOSVRJQUxJWkVSKG1ncHVfaW5mby5tdXRleCksCkBAIC01ODQsNiAr
NTg1LDEwIEBAIE1PRFVMRV9QQVJNX0RFU0MoZGlzY292ZXJ5LAogCSJBbGxvdyBkcml2ZXIgdG8g
ZGlzY292ZXIgaGFyZHdhcmUgSVBzIGZyb20gSVAgRGlzY292ZXJ5IHRhYmxlIGF0IHRoZSB0b3Ag
b2YgVlJBTSIpOwogbW9kdWxlX3BhcmFtX25hbWVkKGRpc2NvdmVyeSwgYW1kZ3B1X2Rpc2NvdmVy
eSwgaW50LCAwNDQ0KTsKIAorTU9EVUxFX1BBUk1fREVTQyhtZXMsCisJIkVuYWJsZSBNaWNybyBF
bmdpbmUgU2NoZWR1bGVyICgwID0gZGlzYWJsZWQgKGRlZmF1bHQpLCAxID0gZW5hYmxlZCkiKTsK
K21vZHVsZV9wYXJhbV9uYW1lZChtZXMsIGFtZGdwdV9tZXMsIGludCwgMDQ0NCk7CisKICNpZmRl
ZiBDT05GSUdfSFNBX0FNRAogLyoqCiAgKiBET0M6IHNjaGVkX3BvbGljeSAoaW50KQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
