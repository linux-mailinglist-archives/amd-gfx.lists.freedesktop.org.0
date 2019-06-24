Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219151023
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2E989C59;
	Mon, 24 Jun 2019 15:17:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D455189C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:17:04 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t8so10049433qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwFYs6PDdUxVHxxw+Lz5X/XREUryflch0uzMXw0hu6I=;
 b=jCLFQKXUdzUDPasAWMSW2PAX68m2Fp+X4jwwdMZhzM/yEMyyxeEeD361Pr83pJ8xRf
 hDlrVE9VOPVZRsBjl2+tH9YFWbNRB9vJ2KdGMpv5A30Piq1yv7JznC5hW/Eg4rg9H9QT
 mfjGieQxitWHaY6dOP6I5sgpVPPThccfAk6GyEmx1ceuCIA+eYZhBnnus1DFPBw4PwGo
 fnjAlIornV6sTPdB0uiJZM/S7WmLTfEyPPXmfwRHzcFnvi+qpLW/MJBVyazsUDgjE4U4
 0tL5DuoWIvnC/1Cwh7ZawXcUZQB4tHPHcufTtpdj8MerLruwu367rgVIouwtwrnM5suz
 6lIw==
X-Gm-Message-State: APjAAAWyYXnazyyYsd3HKHSsdox7MWm2ErWyoR4G599+Ugl1ECjmRUuR
 5kVM06qF9lCT451QrLEnPhI6Enjgw2g=
X-Google-Smtp-Source: APXvYqzEXvNUcS0R7VEx9yClj4rUya9l4f7e1alTKEURtZXh91DadQzOQhnEJx2nscapCLY4e1lHSQ==
X-Received: by 2002:a37:6112:: with SMTP id v18mr56005014qkb.126.1561389423794; 
 Mon, 24 Jun 2019 08:17:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id x2sm5710012qkc.92.2019.06.24.08.17.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:17:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: drop ifdefs around comments
Date: Mon, 24 Jun 2019 10:16:57 -0500
Message-Id: <20190624151657.22959-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwFYs6PDdUxVHxxw+Lz5X/XREUryflch0uzMXw0hu6I=;
 b=Hi4xLqXsk2ggIRBEVc1z3q8vQgk+nJaV1sPBiDWnFQbGCWds3jGG67FlbqkBP8EKYB
 lGAtEOUCiJ0Y0MqNhO7S+w9gOjmGQiTslWDVY5gYg1RUdPvQrFM90jtNl4RuGtf5BWMZ
 a2wzbLRFk+1AAWuc1O1cb1bkJkHOMX1hgt5zow/+MEPCvQP7ksQEAFF4+ex1j7hD697d
 +YaeH2NERSxr8vRcKo4Dh4D4ZVpaTebgoT9WlT46CKEyW1T7m5TPZbLqXtqwgdHYm+6X
 5Ojg7Qd7985aJq+ob/VaiDfg3867i0vbhwwCpMgTb24dIHa6Xe3WymnobmP4q23cJX8T
 uo5Q==
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

Tm8gbmVlZCB0byBwcm90ZWN0IHRoZSBjb21tZW50cy4gIFRoZSBEQ04xXzAxIGNvbmZpZwp3YXMg
ZG9wcGVkIGFueXdheS4gIEdvdCBhY2NpZGVudGx5IGJyb3VnaHQgYmFjayB3aXRoIHRoZQpuYXZp
IG1lcmdlLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9o
dWJidWIuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHViYnVi
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmMK
aW5kZXggZGFhMjI5Yjk3ZmNmLi4wYWIzOTE0NDZkM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJidWIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmMKQEAgLTE0NSw3ICsxNDUs
NiBAQCBib29sIGh1YmJ1YjFfdmVyaWZ5X2FsbG93X3BzdGF0ZV9jaGFuZ2VfaGlnaCgKIAkJZm9y
Y2VkX3BzdGF0ZV9hbGxvdyA9IGZhbHNlOwogCX0KIAotI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0RDTjFfMDEKIAkvKiBSVjI6CiAJICogZGNodWJidWJkZWJ1Z2luZCwgYXQ6IDB4QgogCSAqIGRl
c2NyaXB0aW9uCkBAIC0xODIsOCArMTgxLDYgQEAgYm9vbCBodWJidWIxX3ZlcmlmeV9hbGxvd19w
c3RhdGVfY2hhbmdlX2hpZ2goCiAJICogMzA6ICAgIEFyYml0ZXIncyBhbGxvd19wc3RhdGVfY2hh
bmdlCiAJICogMzE6ICAgIFNPQyBwc3RhdGUgY2hhbmdlIHJlcXVlc3QiCiAJICovCi0jZWxzZQot
I2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAogCS8qRENOMi54OgogCUhVQkJVQjpEQ0hV
QkJVQl9URVNUX0FSQl9ERUJVRzEwIERDSFVCQlVCREVCVUdJTkQ6MHhCCiAJMDogUGlwZTAgUGxh
bmUwIEFsbG93IFAtc3RhdGUgQ2hhbmdlCkBAIC0yMTksNyArMjE2LDYgQEAgYm9vbCBodWJidWIx
X3ZlcmlmeV9hbGxvd19wc3RhdGVfY2hhbmdlX2hpZ2goCiAJMzA6IEFyYml0ZXJgcyBBbGxvdyBQ
LXN0YXRlIENoYW5nZQogCTMxOiBTT0MgUC1zdGF0ZSBDaGFuZ2UgcmVxdWVzdAogCSovCi0jZWxz
ZQogCS8qIFJWMToKIAkgKiBkY2h1YmJ1YmRlYnVnaW5kLCBhdDogMHg3CiAJICogZGVzY3JpcHRp
b24gIjMtMDogICBQaXBlMCBjdXJzb3IwIFFPUwpAQCAtMjQzLDggKzIzOSw2IEBAIGJvb2wgaHVi
YnViMV92ZXJpZnlfYWxsb3dfcHN0YXRlX2NoYW5nZV9oaWdoKAogCSAqIDMwOiAgICBBcmJpdGVy
J3MgYWxsb3dfcHN0YXRlX2NoYW5nZQogCSAqIDMxOiAgICBTT0MgcHN0YXRlIGNoYW5nZSByZXF1
ZXN0CiAJICovCi0jZW5kaWYKLSNlbmRpZgogCiAJUkVHX1dSSVRFKERDSFVCQlVCX1RFU1RfREVC
VUdfSU5ERVgsIGh1YmJ1YjEtPmRlYnVnX3Rlc3RfaW5kZXhfcHN0YXRlKTsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
