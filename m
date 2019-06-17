Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C048E00
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDA8894E3;
	Mon, 17 Jun 2019 19:18:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59381894DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so6889819qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8KRwujglHPLeLfN83khWlV49UDk6Evz+qldlld28erc=;
 b=IAcXswBD+4ytJfcqysLmTx7m6NWUoYgEINNdJP7CijaXzfGRDzkm0/J3POoWY41q/O
 B9bYqr/29eI+HG2qS4dyeMycuz/36wmWhwQ1ysW5rWf9Ou21w0VRsJrz+m3g28O2Fe+m
 Opvy280WVvJqVmOXdsBTPV+OameGOIAbumZDdShWRGP0Y6bcH1QY6VfUfNJbGJfMYkQc
 LhTrDb92KAjLSQPN+G3lGTCNqI22kAxXGoyBJBnGV3KOFG3ulUcsGT7a92MBo0t1NTYw
 ZoxnrPBExTvRMLBmRpz5jzME+Ey6pbnLkf8AFj3BcyYsKET1093vzCqlGxDK1DaOma82
 z4vA==
X-Gm-Message-State: APjAAAW5zbSc+XY+BfrlaIZ65QlVtOgJ8eH703IJ/F5R/BOPH3YACwoi
 WGhISFWKmrFV0QpzYyS8E4Y5GAbEwtE=
X-Google-Smtp-Source: APXvYqzatOc8d09uUmB1bojCiyxe1OhMx5l5r18u23rUBgjSAE2rPyKwBRNrbbPAFHOqPG6XZ41vHg==
X-Received: by 2002:ac8:8dd:: with SMTP id y29mr30170725qth.304.1560799086319; 
 Mon, 17 Jun 2019 12:18:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 065/459] drm/amdgpu: Add psp 11.0 support for navi10.
Date: Mon, 17 Jun 2019 14:10:26 -0500
Message-Id: <20190617191700.17899-54-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8KRwujglHPLeLfN83khWlV49UDk6Evz+qldlld28erc=;
 b=EGxJfJkRRT1K97AQo+GE3BXiDfSq65Vp5Zt+yBgvY7tAW8l0gZJeVvMhaG3415/h4+
 +y4kdSi0K/wfXoemj420yZFm0F1TAu4C2DjNLhVZTdgOQohv4UlljDixzDFyIFEA8WAg
 R36q3BOhZsspLAFlCqF0FBHWU/DdMMrbCVD434nsHB3vfNzu056B8cSDtmyEVPOvJYHW
 fQdkvl5VmzwkrMsf9DCYxKOgF1AHZ6xxZfTUTHXxjs0rP1C03UGrAKAz/1cmdCVrMJno
 Okd0jCypyFRvobx/eBAT0eq/XazPaTvtxYZX0PzAoKq+waNZebBIRN9BahGDSa8U/Pzm
 BY1A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPFRhby5aaG91MUBhbWQuY29tPgoKQWRkIHBzcCAxMS4wIGNvZGUgZm9y
IG5hdmkxMC4gcHNwIDExLjAgaXMgbm90IGVuYWJsZWQgZm9yIG5vdy4KV2lsbCBlbmFibGUgaXQg
d2hlbiBwc3AgMTEuMCBmaXJtd2FyZSBpcyBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBUYW8g
WmhvdSA8VGFvLlpob3UxQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyAg
fCAyOSArKysrKysrKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jCmluZGV4IGFmOTgzNWM4Mzk1ZC4uNmZjZDJkMjUxYjk4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC01MSw2ICs1MSw3IEBAIHN0YXRpYyBpbnQgcHNw
X2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQlwc3BfdjEwXzBfc2V0X3BzcF9mdW5jcyhwc3Ap
OwogCQlicmVhazsKIAljYXNlIENISVBfVkVHQTIwOgorCWNhc2UgQ0hJUF9OQVZJMTA6CiAJCXBz
cF92MTFfMF9zZXRfcHNwX2Z1bmNzKHBzcCk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCmluZGV4IGI5MWRmN2JkMWQ5OC4uZTE5ZDIzM2E4
MTBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtMzksOSArMzks
MTUgQEAKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3ZlZ2EyMF9zb3MuYmluIik7CiBNT0RVTEVf
RklSTVdBUkUoImFtZGdwdS92ZWdhMjBfYXNkLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRn
cHUvdmVnYTIwX3RhLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX3Nvcy5i
aW4iKTsKIAogLyogYWRkcmVzcyBibG9jayAqLwogI2RlZmluZSBzbW5NUDFfRklSTVdBUkVfRkxB
R1MJCTB4MzAxMDAyNAorLyogbmF2aTEwIHJlZyBvZmZzZXQgZGVmaW5lICovCisjZGVmaW5lIG1t
UkxDX0dQTV9VQ09ERV9BRERSX05WMTAJMHg1YjYxCisjZGVmaW5lIG1tUkxDX0dQTV9VQ09ERV9E
QVRBX05WMTAJMHg1YjYyCisjZGVmaW5lIG1tU0RNQTBfVUNPREVfQUREUl9OVjEwCQkweDU4ODAK
KyNkZWZpbmUgbW1TRE1BMF9VQ09ERV9EQVRBX05WMTAJCTB4NTg4MQogCiBzdGF0aWMgaW50IHBz
cF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIHsKQEAgLTU5
LDYgKzY1LDkgQEAgc3RhdGljIGludCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBz
cF9jb250ZXh0ICpwc3ApCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAkJY2hpcF9uYW1lID0gInZlZ2Ey
MCI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTA6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTAi
OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlCVUcoKTsKIAl9CkBAIC00OTksMTQgKzUwOCwyNiBA
QCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAljYXNl
IEFNREdQVV9VQ09ERV9JRF9STENfRzoKIAkJKnNyYW1fb2Zmc2V0ID0gMHgyMDAwOwotCQkqc3Jh
bV9hZGRyX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVJMQ19HUE1fVUNP
REVfQUREUik7Ci0JCSpzcmFtX2RhdGFfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoR0Ms
IDAsIG1tUkxDX0dQTV9VQ09ERV9EQVRBKTsKKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQ
X05BVkkxMCkgeworCQkJKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNFVChH
QywgMCwgbW1STENfR1BNX1VDT0RFX0FERFIpOworCQkJKnNyYW1fZGF0YV9yZWdfb2Zmc2V0ID0g
U09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1STENfR1BNX1VDT0RFX0RBVEEpOworCQl9CisJCWVs
c2UgeworCQkJKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQ
XVswXVsxXSArIG1tUkxDX0dQTV9VQ09ERV9BRERSX05WMTA7CisJCQkqc3JhbV9kYXRhX3JlZ19v
ZmZzZXQgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdWzFdICsgbW1STENfR1BNX1VDT0RF
X0RBVEFfTlYxMDsKKwkJfQogCQlicmVhazsKIAogCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUEw
OgogCQkqc3JhbV9vZmZzZXQgPSAweDA7Ci0JCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1
X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1tU0RNQTBfVUNPREVfQUREUik7Ci0JCSpzcmFtX2RhdGFf
cmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1tU0RNQTBfVUNPREVfREFU
QSk7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTApIHsKKwkJCSpzcmFtX2Fk
ZHJfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1tU0RNQTBfVUNPREVf
QUREUik7CisJCQkqc3JhbV9kYXRhX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdfT0ZGU0VUKFNETUEw
LCAwLCBtbVNETUEwX1VDT0RFX0RBVEEpOworCQl9CisJCWVsc2UgeworCQkJKnNyYW1fYWRkcl9y
ZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVsxXSArIG1tU0RNQTBfVUNP
REVfQUREUl9OVjEwOworCQkJKnNyYW1fZGF0YV9yZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNl
dFtHQ19IV0lQXVswXVsxXSArIG1tU0RNQTBfVUNPREVfREFUQV9OVjEwOworCQl9CiAJCWJyZWFr
OwogCiAvKiBUT0RPOiBuZWVkcyB0byBjb25maXJtICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
