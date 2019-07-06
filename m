Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221F60F2C
	for <lists+amd-gfx@lfdr.de>; Sat,  6 Jul 2019 08:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B64C6E035;
	Sat,  6 Jul 2019 06:13:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840B36E035
 for <amd-gfx@lists.freedesktop.org>; Sat,  6 Jul 2019 06:13:24 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s145so5875402qke.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 23:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xZcQVRGOI32OyR1NUTLFBe2AJO9iSpTSMwaQH3W5LpM=;
 b=D2DLxaALoA9wRYo8xBMDelG8UMuHab+jQPeWJeKJ0Vmptm0nNh9bz5mV1JimMkUtv+
 ShaUlK9unb6+XVYTZnO1bMd/RJnOIHLqIPncIoBR8orDIurrKqoFETkdYAqIJ1xKjUUv
 LYgJBHBK9VsTcl5IB1/YOCh3yIiHX4wM1rI/Br2/5cBJJ8h9oaKGt2BCUeYv+Y6RouQi
 lDTcb4z/pMc5ApbL5nwlksCBvw6VP4n3ee1rz/HaOyKk/2dkGjhCi8eFMAHcSRP0D0rY
 pyHmRJzsRbMQqtbRx5SplSdOonT1awTMhD8C8XG1WQngltcJ4BhlXYjnQVJUGoCrBGcE
 qS4w==
X-Gm-Message-State: APjAAAWXobUAsv6p/z8hM8Cub07JU/2vYj8EeDeuoFLslFjIIjhkFFAf
 IeXt1o5vJ7GS+PSaQyQqU8LxjWRxMdY=
X-Google-Smtp-Source: APXvYqwKyIKGiH2AYVALVKd0TVfNmtHtyk/h1lVtr0WaxEwkpZouU385G1RHGisDlosMHaX/GFmjzA==
X-Received: by 2002:a37:a892:: with SMTP id r140mr5029423qke.435.1562393603457; 
 Fri, 05 Jul 2019 23:13:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id h8sm1996313qto.45.2019.07.05.23.13.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 23:13:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/psp11: simplify the ucode register logic
Date: Sat,  6 Jul 2019 01:13:13 -0500
Message-Id: <20190706061313.28385-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xZcQVRGOI32OyR1NUTLFBe2AJO9iSpTSMwaQH3W5LpM=;
 b=gwkXtn9PlXjySqjQbEvOXwqjGyDdPKRStYokDZvAkUvLKB1Yj7PiSPh18V5km9PNNf
 yAEpXJ7Op1KXm1c7HYWFA6suxUuZqsC1b4fA5vkQPOUnPyfp4gc+yLtxjj8Ogq/7aGf6
 iMvIlW4IMcYknCz8qZ88HkllIMX3jeNiNPS+eHFycuSNPZBUUA6YlnSJy+P0D/B5+BEV
 9ir8q9MjaHhQZ1K5E36DNL5KQEqQmYVdhsjwY/tUzNY2ZbkIt26t8XUuevq4BqZMrOlJ
 DuC2OZtnTgtm/5XksABZRcNEqQhWZZ6qvg1EVTTnK/Lw0+XXDnkJwU99XrCKIH2hUo+d
 2GEQ==
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

U3BsaXQgaXQgYmV0d2VlbiBuYXZpMTAgYW5kIG5ld2VyIGFuZCBldmVyeXRoaW5nIGJlZm9yZQpu
YXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAxMiAr
KysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwppbmRleCA5YWJmNjExY2My
ZWQuLjFiNmMyMGNhMzU4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
cHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMK
QEAgLTUzOCwxMiArNTM4LDEwIEBAIHBzcF92MTFfMF9zcmFtX21hcChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAogCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1JMQ19HOgogCQkqc3JhbV9vZmZz
ZXQgPSAweDIwMDA7Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgJiYKLQkJ
ICAgIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxNCkgeworCQlpZiAoYWRldi0+YXNpY190
eXBlIDwgQ0hJUF9OQVZJMTApIHsKIAkJCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1X1JF
R19PRkZTRVQoR0MsIDAsIG1tUkxDX0dQTV9VQ09ERV9BRERSKTsKIAkJCSpzcmFtX2RhdGFfcmVn
X29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tUkxDX0dQTV9VQ09ERV9EQVRBKTsK
LQkJfQotCQllbHNlIHsKKwkJfSBlbHNlIHsKIAkJCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IGFk
ZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bMV0gKyBtbVJMQ19HUE1fVUNPREVfQUREUl9OVjEw
OwogCQkJKnNyYW1fZGF0YV9yZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVsw
XVsxXSArIG1tUkxDX0dQTV9VQ09ERV9EQVRBX05WMTA7CiAJCX0KQEAgLTU1MSwxMiArNTQ5LDEw
IEBAIHBzcF92MTFfMF9zcmFtX21hcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCWNh
c2UgQU1ER1BVX1VDT0RFX0lEX1NETUEwOgogCQkqc3JhbV9vZmZzZXQgPSAweDA7Ci0JCWlmIChh
ZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgJiYKLQkJICAgIGFkZXYtPmFzaWNfdHlwZSAh
PSBDSElQX05BVkkxNCkgeworCQlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9OQVZJMTApIHsK
IAkJCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1t
U0RNQTBfVUNPREVfQUREUik7CiAJCQkqc3JhbV9kYXRhX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdf
T0ZGU0VUKFNETUEwLCAwLCBtbVNETUEwX1VDT0RFX0RBVEEpOwotCQl9Ci0JCWVsc2UgeworCQl9
IGVsc2UgewogCQkJKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19I
V0lQXVswXVsxXSArIG1tU0RNQTBfVUNPREVfQUREUl9OVjEwOwogCQkJKnNyYW1fZGF0YV9yZWdf
b2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVsxXSArIG1tU0RNQTBfVUNPREVf
REFUQV9OVjEwOwogCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
