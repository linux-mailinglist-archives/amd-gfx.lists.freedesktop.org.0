Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297869E3F
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65CA89FD4;
	Mon, 15 Jul 2019 21:25:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2889FD3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:56 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so17321380qtq.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXua1jQk5JZHFom/UEPiyIdWHkJXWlc0AluX/AF6gs0=;
 b=YqF37qgxO6ZXdOejI/xKfOLeaZOwr0yUUWvP7ZigfJ2LDC38lI+rz8rHiDFQLUNwwH
 /9YdRiMh41eycNtpa0VzSlfzFEeu5Q3IFBuN7usVwIdSjAbfCqVDEihog5P1I2LRS/Te
 h//KyrsuazqJikKzoucwGVCJCXZ//EnnYy4GI6/2Q1O/6nqPqHNzJ3gsFlamGTAHMTaV
 WKnzzF0d37gBxCT0awgsrZi7o+VDPQxnDdIZb4BilFYkYGJFxe40gtD6JWqTltWrxP0i
 3HqKvXeWPQG48/wxu48Kq9xhU4xNs5izIZv5s7sCwwetQvUYK8A9kAM1Bx/AL23Av4Zu
 FDEw==
X-Gm-Message-State: APjAAAWDHgHU2XnUYY/P8f0vYVOadFutgjKwb4ZjVjORGtWpy8tpzToM
 hBBK1ALjh4ckg0ByO2pf4096IfaC
X-Google-Smtp-Source: APXvYqxd2ZicbkXWKgMyYgufEqbTF2ousqVMeEOBkTPI0DN/d98AF5ypXTuoNGTi4nPPXzjbHzoN2Q==
X-Received: by 2002:a0c:d4d0:: with SMTP id y16mr20184242qvh.191.1563225955056; 
 Mon, 15 Jul 2019 14:25:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 077/102] drm/amdgpu/: add doorbell assignment for 2nd vcn
 instance
Date: Mon, 15 Jul 2019 16:24:12 -0500
Message-Id: <20190715212437.31793-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RXua1jQk5JZHFom/UEPiyIdWHkJXWlc0AluX/AF6gs0=;
 b=bSKeUjqW+rB3Meagpk8vKJHv1a1X2uplVTeu/KAxsQgP57Zl1CE9qRGzxbb7ER20P/
 KLu7EkqL33BIzTQl6XdRPu5OvecZyjbZK+HO2ljGA6C2Y6Xh/FtF1YLMryoluhGxz0A8
 8cz/upZRTsi6cBslieqmf/NlV62at9XLUmwGI5pzlpkbc7+gEp9N4+xZ7MPuBBWqFixM
 A7Yo5/H8IUsLULBxIaFbzX5cPzj/43uCqOlTLwTOuE9WGFOBZzAVnpq9AGvIXwkGaH1H
 uVQcCbnRk/kuvSNa8J/ug2hh+EAEZ31O4loq9DXTf3kjOX78kPYA0MYt7n1wy8iad21t
 5iHQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCmFkZCBkb29yYmVsbCBhc3NpZ25t
ZW50IGZvciAybmQgdmNuIGluc3RhbmNlCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVz
LlpodUBhbWQuY29tPgpSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rvb3JiZWxsLmggfCA5ICsrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG9vcmJlbGwuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kb29yYmVsbC5oCmluZGV4IDc5MDI2M2Rj
YzA2NC4uM2ZhMTgwMDNkNGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG9vcmJlbGwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZG9vcmJlbGwuaApAQCAtMTMwLDEzICsxMzAsMTggQEAgdHlwZWRlZiBlbnVtIF9BTURHUFVf
VkVHQTIwX0RPT1JCRUxMX0FTU0lHTk1FTlQKIAlBTURHUFVfVkVHQTIwX0RPT1JCRUxMX0lIICAg
ICAgICAgICAgICAgICAgICAgID0gMHgxNzgsCiAJLyogTU1TQ0g6IDM5Mn40MDcKIAkgKiBvdmVy
bGFwIHRoZSBkb29yYmVsbCBhc3NpZ25tZW50IHdpdGggVkNOIGFzIHRoZXkgYXJlICBtdXR1YWxs
eSBleGNsdXNpdmUKLQkgKiBWQ0UgZW5naW5lJ3MgZG9vcmJlbGwgaXMgMzIgYml0IGFuZCB0d28g
VkNFIHJpbmcgc2hhcmUgb25lIFFXT1JECisJICogVkNOIGVuZ2luZSdzIGRvb3JiZWxsIGlzIDMy
IGJpdCBhbmQgdHdvIFZDTiByaW5nIHNoYXJlIG9uZSBRV09SRAogCSAqLwotCUFNREdQVV9WRUdB
MjBfRE9PUkJFTEw2NF9WQ04wXzEgICAgICAgICAgICAgICAgICA9IDB4MTg4LCAvKiBsb3dlciAz
MiBiaXRzIGZvciBWTkMwIGFuZCB1cHBlciAzMiBiaXRzIGZvciBWTkMxICovCisJQU1ER1BVX1ZF
R0EyMF9ET09SQkVMTDY0X1ZDTjBfMSAgICAgICAgICAgICAgICAgID0gMHgxODgsIC8qIFZOQzAg
Ki8KIAlBTURHUFVfVkVHQTIwX0RPT1JCRUxMNjRfVkNOMl8zICAgICAgICAgICAgICAgICAgPSAw
eDE4OSwKIAlBTURHUFVfVkVHQTIwX0RPT1JCRUxMNjRfVkNONF81ICAgICAgICAgICAgICAgICAg
PSAweDE4QSwKIAlBTURHUFVfVkVHQTIwX0RPT1JCRUxMNjRfVkNONl83ICAgICAgICAgICAgICAg
ICAgPSAweDE4QiwKIAorCUFNREdQVV9WRUdBMjBfRE9PUkJFTEw2NF9WQ044XzkgICAgICAgICAg
ICAgICAgICA9IDB4MThDLCAvKiBWTkMxICovCisJQU1ER1BVX1ZFR0EyMF9ET09SQkVMTDY0X1ZD
TmFfYiAgICAgICAgICAgICAgICAgID0gMHgxOEQsCisJQU1ER1BVX1ZFR0EyMF9ET09SQkVMTDY0
X1ZDTmNfZCAgICAgICAgICAgICAgICAgID0gMHgxOEUsCisJQU1ER1BVX1ZFR0EyMF9ET09SQkVM
TDY0X1ZDTmVfZiAgICAgICAgICAgICAgICAgID0gMHgxOEYsCisKIAlBTURHUFVfVkVHQTIwX0RP
T1JCRUxMNjRfVVZEX1JJTkcwXzEgICAgICAgICAgICAgPSAweDE4OCwKIAlBTURHUFVfVkVHQTIw
X0RPT1JCRUxMNjRfVVZEX1JJTkcyXzMgICAgICAgICAgICAgPSAweDE4OSwKIAlBTURHUFVfVkVH
QTIwX0RPT1JCRUxMNjRfVVZEX1JJTkc0XzUgICAgICAgICAgICAgPSAweDE4QSwKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
