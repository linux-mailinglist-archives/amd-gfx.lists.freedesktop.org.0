Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311E5F1A0
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 04:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FE16E241;
	Thu,  4 Jul 2019 02:58:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CD86E235
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 02:58:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 44so2735403qtg.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 19:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6GqNJ2OyaglWFH1V10QnunrL0BRZsLpGNELzHD6/gI=;
 b=PvzV8Gb51xuIo/q0wo/yXI540P6UH8C3BnDDRz9Z8h01hKePDn8HXIQntCzm+708dx
 akd6BO2NpoWfw4wAVZ9Fg54ct92wPb6ywRrquA/RrK4gMGQzFg8YSpZCJbc7I81XWp70
 1FT6Il7/yawjfqBtvABA/8Xl+HPUlimtdCR5CP75EDdxJ6axUK0kbQ1YhbsJazrqi2J5
 PRzUk/OQ9al58nalEIzOZ1Rp4EUrZ7JXhcIwy5z+Szdh9FzfF2PP3FcuDrE0Ek+V93gu
 H0U0J+QQ8P2RG3Vq4RGg59NqNpLDIdOQ8E6FZ6IZGKSINzuZ7hJfZ2h77YQ0+c0vw/Ml
 N76Q==
X-Gm-Message-State: APjAAAWoVLw1bJ9wELGpOzeyb4LZir/iwV5myH3GSUwxL0DVSomYII7e
 W/XAWA1CRroQ7RwGq7kLxVpB8bTBVwA=
X-Google-Smtp-Source: APXvYqzbbu1et70tOQHq7fX0RrslD2J9HmlENbJYLMLpELt4PXj6PycxxyVViF/UHSe6htP1RsV1Lg==
X-Received: by 2002:ac8:f13:: with SMTP id e19mr32814317qtk.11.1562209111454; 
 Wed, 03 Jul 2019 19:58:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id p21sm1659133qtq.17.2019.07.03.19.58.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 19:58:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/navi10: add uclk activity sensor
Date: Wed,  3 Jul 2019 21:58:21 -0500
Message-Id: <20190704025822.18970-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6GqNJ2OyaglWFH1V10QnunrL0BRZsLpGNELzHD6/gI=;
 b=HNXSJuE1w5QC8vmsXaKLhlFjwphjOWeSX4kSYtT6NuenEO/oo+ip5JyxhxI8MWiEMu
 l04YZOOh13RErQfevOVt++0U1FEKEKyUD84UqtkYVi+AjDLDTsRpT+3qc3u+j0QHyZDy
 zFIKZW7+JjCil6tVTmc4TigjQPBCYZcans7lmqTfW8TSzbSuZ/SyCaEXitYVRjC681mr
 rjRj30F5U+75oMhq/qsizmYPBjsx7y2Ri4M9pHTb5VIDWkOpX1BJXPcjt5UXIc35SYma
 5ZgLoiAgHl46XJVW7xDi/cyP/uT+TkFZygCTPQqiEJsEAMFfS2jP8AR/Ofjjq5i5R4c5
 fCjw==
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

UXVlcnkgdGhlIG1ldHJpY3MgdGFibGUgZm9yIHRoZSBjdXJyZW50IHVjbGsgYWN0aXZpdHkuCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMTYgKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGUw
MDM5N2Y4NGIyZi4uNTc5NGY3Y2VmMWM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jCkBAIC04NjksNiArODY5LDcgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0
X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQogfQog
CiBzdGF0aWMgaW50IG5hdmkxMF9nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAorCQkJCQkgICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3Is
CiAJCQkJCSAgICAgICB1aW50MzJfdCAqdmFsdWUpCiB7CiAJaW50IHJldCA9IDA7CkBAIC04ODQs
NyArODg1LDE3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNl
bnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
CSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZUdmeEFjdGl2aXR5OworCXN3aXRjaCAoc2Vuc29yKSB7
CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX0dQVV9MT0FEOgorCQkqdmFsdWUgPSBtZXRyaWNzLkF2
ZXJhZ2VHZnhBY3Rpdml0eTsKKwkJYnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX01FTV9M
T0FEOgorCQkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VVY2xrQWN0aXZpdHk7CisJCWJyZWFrOwor
CWRlZmF1bHQ6CisJCXByX2VycigiSW52YWxpZCBzZW5zb3IgZm9yIHJldHJpZXZpbmcgY2xvY2sg
YWN0aXZpdHlcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KQEAg
LTEyNjAsOCArMTI3MSw5IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAogCQkqKHVpbnQzMl90ICopZGF0YSA9IHBwdGFibGUtPkZhbk1heGlt
dW1ScG07CiAJCSpzaXplID0gNDsKIAkJYnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX01F
TV9MT0FEOgogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HUFVfTE9BRDoKLQkJcmV0ID0gbmF2aTEw
X2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc211LCAodWludDMyX3QgKilkYXRhKTsKKwkJ
cmV0ID0gbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc211LCBzZW5zb3IsICh1
aW50MzJfdCAqKWRhdGEpOwogCQkqc2l6ZSA9IDQ7CiAJCWJyZWFrOwogCWNhc2UgQU1ER1BVX1BQ
X1NFTlNPUl9HUFVfUE9XRVI6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
