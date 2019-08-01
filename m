Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60B7E429
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7B36E7DC;
	Thu,  1 Aug 2019 20:30:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14206E7D8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so53153340qkj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+MHXFuNEIFf89RLftdXGLcIXhVe3ftYj0D+XTfv+Pg=;
 b=fDAbtD2jeVfovZRHbKW1SkaCCEAutWw7CZj5TehwWoCSHPqSvFrRqvPjllsGeKtRoQ
 MRD10p8uOFW+H1oGxHWLlG3jLFJ2wpE5g6hprb/JNUZv98/i+7XE2JbK2MDSudf2PCuu
 q4zx7VPZpVTh8eI4c//llAAvGdTT3k90edrhtZUFwx58Vjl5LLqVIFYEOLLcbRY3Elcx
 KrMebXhJGNivVyQaG5QhuXNy7W5vVx8Z+I/X2KPbQ9Jieyrp/HrZ8kFgHCt6emW/ibxm
 I2KBm5EbQM1J5DBPiF2S2O5E60kl6RBhQrRcYK03erRAOPLEw1aOMj+Nt0GPjRHTmk+a
 dsXw==
X-Gm-Message-State: APjAAAUpU4UqbE6vz6nm4OoYjYVIwQ0ixCBUP5Lrr1nxE4/XCw5xUTjZ
 gYhn6yFBGbkCG6XPB/X3Zo6LLfOD
X-Google-Smtp-Source: APXvYqwIXB1ROV5Fln9MY2Fh8K3ZAMsvB+0ThNS5EVNN6I1BfczDAFMovTWkWkXAZE2GNxAVcJvOrQ==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr86635832qkm.243.1564691419834; 
 Thu, 01 Aug 2019 13:30:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/36] drm/amdgpu/sdma5: add placeholder for navi12 golden
 settings
Date: Thu,  1 Aug 2019 15:29:37 -0500
Message-Id: <20190801202957.29791-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+MHXFuNEIFf89RLftdXGLcIXhVe3ftYj0D+XTfv+Pg=;
 b=tT64L/+XwqNs4hT1ovD/DFduo3wbAIPbhOlz6XzJsFPVLNl2h99jgboDONzSLx0Ae4
 3QKoCFOxwytd1v0sDlzPyEegSOQFoiYM+kOzmFtKxUS2NIOAZdr6gEwnn5+kioVVhgEP
 k7/V2WyWEAfj9IfAzs61MVlYodg5f8f7iNWSOXo5K7Ox0yFojs0nUqyuLJ6MM5H6892B
 6aCIIboAtYhI8y1Lg30lRa1idMNWDBWJGugZi3lSfASfZbUv0Ygy9c8KFrP9+liDLrOI
 q41xn7VYK6OJkDsL4RUqVGzrhtRXi9A5jStqPs598crjaMHc3iV8cbqsOPV7x0uYC6gH
 MqHw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCk5vbmUgeWV0LgoKU2ln
bmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAu
YwppbmRleCA1MDZiNjIyNzBlN2MuLmViNmFiNTA2ZTMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NV8wLmMKQEAgLTk1LDYgKzk1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
b2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hX252MTRbXSA9IHsKIAlTT0MxNV9S
RUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUExX1JMQzNfUkJfV1BUUl9QT0xMX0NOVEwsIDB4
ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9y
ZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hX252MTJbXSA9IHsKK307CisKIHN0YXRpYyB1
MzIgc2RtYV92NV8wX2dldF9yZWdfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
MzIgaW5zdGFuY2UsIHUzMiBpbnRlcm5hbF9vZmZzZXQpCiB7CiAJdTMyIGJhc2U7CkBAIC0xMzIs
NiArMTM1LDE0IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjVfMF9pbml0X2dvbGRlbl9yZWdpc3RlcnMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJCQlnb2xkZW5fc2V0dGluZ3Nfc2RtYV9u
djE0LAogCQkJCQkJKGNvbnN0IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19zZG1hX252
MTQpKTsKIAkJYnJlYWs7CisJY2FzZSBDSElQX05BVkkxMjoKKwkJc29jMTVfcHJvZ3JhbV9yZWdp
c3Rlcl9zZXF1ZW5jZShhZGV2LAorCQkJCQkJZ29sZGVuX3NldHRpbmdzX3NkbWFfNSwKKwkJCQkJ
CShjb25zdCB1MzIpQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3Nfc2RtYV81KSk7CisJCXNvYzE1
X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCWdvbGRlbl9zZXR0aW5nc19z
ZG1hX252MTIsCisJCQkJCQkoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX3Nk
bWFfbnYxMikpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
