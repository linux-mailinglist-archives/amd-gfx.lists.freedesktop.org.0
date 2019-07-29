Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A479984
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514B26E237;
	Mon, 29 Jul 2019 20:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C698D6E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:36 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id v129so41859477vsb.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shfAv5VMlKSQmYy7eOLQs9va+M+7z/ufMSwz2rXSC1I=;
 b=Hx8ewKm0c9UP6q1f/D6EZzHOI0wHg924TQ+KzA/4pTYfXdIHhRdOS8DpXevWyZqLAJ
 /R71eB0s4zWUDKUsSgJwlqhRosB0D/VgFNsDHagHSFfhd6jKjurl+eeSFAUXWfzhICS/
 GyGgxqVgZevJ3RYgpii+QtqcIYM8pD48hKh+buNnryWss++wuRFHxbPWM/JBQ6H8tbOJ
 Cp2z738/l/5R0NNQcsiilqVFB+zqxWsnEKKUKxL2uIWC4MqhJ0xvF6mzqtPRwr0GBh9I
 WopDHqoJnuTd+8Utnhox5vMjH0MBnCj4c4ACC3z4ViWutRsaaV7UTBlAzTxDcxlVDQKG
 7eIA==
X-Gm-Message-State: APjAAAXjb/U/Ziwi8NOM5fjNE4DGGllfdvL2x4GOuNS/cMTlG9EdVzjU
 cKtQgCCcuVgo8YExSVF10Pk/fg+T
X-Google-Smtp-Source: APXvYqwzWvKd5gPOh9IERd/hTxojIzipmDc1LrxZIkWDiXwl6o+UvbUrlNAw2YtH5u8L7is7+bT6Pg==
X-Received: by 2002:a67:2704:: with SMTP id n4mr7490007vsn.202.1564431335641; 
 Mon, 29 Jul 2019 13:15:35 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/30] drm/amd/powerplay: correct UVD/VCE/VCN power status
 retrieval
Date: Mon, 29 Jul 2019 15:14:55 -0500
Message-Id: <20190729201508.16136-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shfAv5VMlKSQmYy7eOLQs9va+M+7z/ufMSwz2rXSC1I=;
 b=a2vFPpwkJbfwUGFO1YdacesMFRrDbnpOc83MSJhkBxqsekyVt9EkeAFfzdwx6tiNb0
 iewuaCmYirL2ve0rgg3taAbkJvTO4CW3KtwaEOCx810GlFcCO+COZITALm6aEstT+h5E
 zvr15TRV9+ctlJKnj/rmIRYbW2socLzsOeL61Bb6K1w1foCfQBppZZ+z5p+uikT7BuYE
 F5+6VREIakwClZexVCRzSja8g2yDCP29/KuNRmpg+km2t9zk8q6yYcBe2v1UY/nRuZWp
 1D9cZl5oQbG8sCbQz2rDqPCSaHJxS1nh+lK4UmOtoC7yx0QFGRFxICopZi8daQkJr4//
 wOjA==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClZDTiBzaG91bGQgYmUgdXNlZCBm
b3IgVmVnYTIwIGxhdGVyIEFTSUNzIHdoaWxlIFVWRCBhbmQgVkNFCmFyZSBmb3IgcHJldmlvdXMg
QVNJQ3MuCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgNTYgKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCmluZGV4IDc4M2NkMDE5MmQzMy4u
NmNmZjYxODAyNDAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAt
MzA3MCwyOCArMzA3MCw0NCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX3BtX2luZm9fcHAo
c3RydWN0IHNlcV9maWxlICptLCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYQogCWlmICghYW1kZ3B1
X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX0VOQUJMRURfU01DX0ZFQVRV
UkVTX01BU0ssICh2b2lkICopJnZhbHVlNjQsICZzaXplKSkKIAkJc2VxX3ByaW50ZihtLCAiU01D
IEZlYXR1cmUgTWFzazogMHglMDE2bGx4XG4iLCB2YWx1ZTY0KTsKIAotCS8qIFVWRCBjbG9ja3Mg
Ki8KLQlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9V
VkRfUE9XRVIsICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpIHsKLQkJaWYgKCF2YWx1ZSkgewotCQkJ
c2VxX3ByaW50ZihtLCAiVVZEOiBEaXNhYmxlZFxuIik7Ci0JCX0gZWxzZSB7Ci0JCQlzZXFfcHJp
bnRmKG0sICJVVkQ6IEVuYWJsZWRcbiIpOwotCQkJaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29y
KGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZEX0RDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkp
Ci0JCQkJc2VxX3ByaW50ZihtLCAiXHQldSBNSHogKERDTEspXG4iLCB2YWx1ZS8xMDApOwotCQkJ
aWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZEX1ZD
TEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpCi0JCQkJc2VxX3ByaW50ZihtLCAiXHQldSBNSHog
KFZDTEspXG4iLCB2YWx1ZS8xMDApOworCWlmIChhZGV2LT5hc2ljX3R5cGUgPiBDSElQX1ZFR0Ey
MCkgeworCQkvKiBWQ04gY2xvY2tzICovCisJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihh
ZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUl9TVEFURSwgKHZvaWQgKikmdmFsdWUsICZz
aXplKSkgeworCQkJaWYgKCF2YWx1ZSkgeworCQkJCXNlcV9wcmludGYobSwgIlZDTjogRGlzYWJs
ZWRcbiIpOworCQkJfSBlbHNlIHsKKwkJCQlzZXFfcHJpbnRmKG0sICJWQ046IEVuYWJsZWRcbiIp
OworCQkJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09S
X1VWRF9EQ0xLLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKQorCQkJCQlzZXFfcHJpbnRmKG0sICJc
dCV1IE1IeiAoRENMSylcbiIsIHZhbHVlLzEwMCk7CisJCQkJaWYgKCFhbWRncHVfZHBtX3JlYWRf
c2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZEX1ZDTEssICh2b2lkICopJnZhbHVlLCAm
c2l6ZSkpCisJCQkJCXNlcV9wcmludGYobSwgIlx0JXUgTUh6IChWQ0xLKVxuIiwgdmFsdWUvMTAw
KTsKKwkJCX0KIAkJfQotCX0KLQlzZXFfcHJpbnRmKG0sICJcbiIpOworCQlzZXFfcHJpbnRmKG0s
ICJcbiIpOworCX0gZWxzZSB7CisJCS8qIFVWRCBjbG9ja3MgKi8KKwkJaWYgKCFhbWRncHVfZHBt
X3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZEX1BPV0VSLCAodm9pZCAqKSZ2
YWx1ZSwgJnNpemUpKSB7CisJCQlpZiAoIXZhbHVlKSB7CisJCQkJc2VxX3ByaW50ZihtLCAiVVZE
OiBEaXNhYmxlZFxuIik7CisJCQl9IGVsc2UgeworCQkJCXNlcV9wcmludGYobSwgIlVWRDogRW5h
YmxlZFxuIik7CisJCQkJaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9Q
UF9TRU5TT1JfVVZEX0RDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpCisJCQkJCXNlcV9wcmlu
dGYobSwgIlx0JXUgTUh6IChEQ0xLKVxuIiwgdmFsdWUvMTAwKTsKKwkJCQlpZiAoIWFtZGdwdV9k
cG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9VVkRfVkNMSywgKHZvaWQgKikm
dmFsdWUsICZzaXplKSkKKwkJCQkJc2VxX3ByaW50ZihtLCAiXHQldSBNSHogKFZDTEspXG4iLCB2
YWx1ZS8xMDApOworCQkJfQorCQl9CisJCXNlcV9wcmludGYobSwgIlxuIik7CiAKLQkvKiBWQ0Ug
Y2xvY2tzICovCi0JaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9T
RU5TT1JfVkNFX1BPV0VSLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKSB7Ci0JCWlmICghdmFsdWUp
IHsKLQkJCXNlcV9wcmludGYobSwgIlZDRTogRGlzYWJsZWRcbiIpOwotCQl9IGVsc2UgewotCQkJ
c2VxX3ByaW50ZihtLCAiVkNFOiBFbmFibGVkXG4iKTsKLQkJCWlmICghYW1kZ3B1X2RwbV9yZWFk
X3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDRV9FQ0NMSywgKHZvaWQgKikmdmFsdWUs
ICZzaXplKSkKLQkJCQlzZXFfcHJpbnRmKG0sICJcdCV1IE1IeiAoRUNDTEspXG4iLCB2YWx1ZS8x
MDApOworCQkvKiBWQ0UgY2xvY2tzICovCisJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihh
ZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDRV9QT1dFUiwgKHZvaWQgKikmdmFsdWUsICZzaXplKSkg
eworCQkJaWYgKCF2YWx1ZSkgeworCQkJCXNlcV9wcmludGYobSwgIlZDRTogRGlzYWJsZWRcbiIp
OworCQkJfSBlbHNlIHsKKwkJCQlzZXFfcHJpbnRmKG0sICJWQ0U6IEVuYWJsZWRcbiIpOworCQkJ
CWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDRV9F
Q0NMSywgKHZvaWQgKikmdmFsdWUsICZzaXplKSkKKwkJCQkJc2VxX3ByaW50ZihtLCAiXHQldSBN
SHogKEVDQ0xLKVxuIiwgdmFsdWUvMTAwKTsKKwkJCX0KIAkJfQogCX0KIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
