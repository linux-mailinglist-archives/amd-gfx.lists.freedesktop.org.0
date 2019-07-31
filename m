Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCB7CB29
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C4689B97;
	Wed, 31 Jul 2019 17:58:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67F89B97
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:33 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id y130so13864486vkc.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0u8zjpaxxGgXWyoNiqH98IMwJH7a4oPC62NnQ2xOR94=;
 b=nn/1a5MW8QDHq8Y4UNsuipeTyAJwXaJNhMiNfQr5fSFOdGBZ7Cg5Gmz02asLu/RFCs
 8wBsYafsxmN3Bl185ZaJLsfyydvpvAZWZR3no9/swdyWCHNiEwovlLacv27u0WDk8cVG
 RtYZBoXfGBBuwAjTPSAF7yvraX+sfZeTyuQOr7e1/E8oRk3VdZIGVTyq6Y6wY5tK/m+1
 LdQSvxrroaaHg/fyZgv+jPoeMUIRVeS6yVqYtht729gTNXMkAV+OOp90UgN3slB8eV2m
 hykNLhN3PcDa6HebgrFOEl+EdRF+HJCjkX6bf58m2NLTy+NHNXNz4q7GGaHBNgEBaYEJ
 xrUQ==
X-Gm-Message-State: APjAAAWBGAcMan3CqVzAOJetYLLFls8LXKqO2HtZAAmSt8AxLDjsvjc0
 rEkB94hlCyFFZYsxJsmlYkA4Wtvh
X-Google-Smtp-Source: APXvYqzaMCyKGV7gcgXxrH+E25xLopIqYGvVjaZMPQwxur90ZnE6wzURsOtKbulS4c1rpsr74aK7mQ==
X-Received: by 2002:a1f:aeca:: with SMTP id x193mr48151273vke.20.1564595912480; 
 Wed, 31 Jul 2019 10:58:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/26] drm/amdgpu: init umc v6_1 functions for vega20
Date: Wed, 31 Jul 2019 12:57:59 -0500
Message-Id: <20190731175818.20159-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0u8zjpaxxGgXWyoNiqH98IMwJH7a4oPC62NnQ2xOR94=;
 b=TMJEnrHAuVdZCxzFqJga/VjPLZGc8lNBmkpjcHvumI7XYCpuS7vvIsaYsvFW+owIAu
 ELDgJ1y/ufgDE67VY1bmNTTAo838JZKO2ZdwIONcs0/iw4jZenXIOaQBTgbRXrwRNFLo
 8SNJcI6k0hCrck4sCuqZKDdStPxuSLWWdaAaoENv71NXJYfNmLndUTKOHziUnnxGCRwm
 E8GD7EkCRLmEDfub5XbH+xJm2ZKxaJQNmMIbCSjL/NSOcAQJgJ5g2Q2KZz5mFH7rUO5I
 izJh8VbytqWDVbFgIsfizheB0N0el6kqODCVp3ZmMCT0lVkMDXRcTbNLOXnJXd0GtprN
 WsTg==
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
Cc: Dennis Li <dennis.li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKaW5pdCB1bWMgY2Fs
bGJhY2sgZnVuY3Rpb24gZm9yIHZlZ2EyMCBpbiBzdyBlYXJseSBpbml0IHBoYXNlCgpTaWduZWQt
b2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBEZW5uaXMgTGkgPGRlbm5pcy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA1
YmQ5MzdmZmMzYWQuLjQxMTY4NDFlYjBlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jCkBAIC00NSw2ICs0NSw3IEBACiAjaW5jbHVkZSAibW1odWJfdjFfMC5oIgogI2luY2x1
ZGUgImdmeGh1Yl92MV8xLmgiCiAjaW5jbHVkZSAibW1odWJfdjlfNC5oIgorI2luY2x1ZGUgInVt
Y192Nl8xLmgiCiAKICNpbmNsdWRlICJpdnNyY2lkL3ZtYy9pcnFzcmNzX3ZtY18xXzAuaCIKIApA
QCAtNjIzLDEyICs2MjQsMjQgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBfc2V0X2dtY19mdW5jcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlhZGV2LT5nbWMuZ21jX2Z1bmNzID0gJmdtY192
OV8wX2dtY19mdW5jczsKIH0KIAorc3RhdGljIHZvaWQgZ21jX3Y5XzBfc2V0X3VtY19mdW5jcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkg
eworCWNhc2UgQ0hJUF9WRUdBMjA6CisJCWFkZXYtPnVtY19mdW5jcyA9ICZ1bWNfdjZfMV9mdW5j
czsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJYnJlYWs7CisJfQorfQorCiBzdGF0aWMgaW50IGdt
Y192OV8wX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCiAJZ21jX3Y5XzBfc2V0
X2dtY19mdW5jcyhhZGV2KTsKIAlnbWNfdjlfMF9zZXRfaXJxX2Z1bmNzKGFkZXYpOworCWdtY192
OV8wX3NldF91bWNfZnVuY3MoYWRldik7CiAKIAlhZGV2LT5nbWMuc2hhcmVkX2FwZXJ0dXJlX3N0
YXJ0ID0gMHgyMDAwMDAwMDAwMDAwMDAwVUxMOwogCWFkZXYtPmdtYy5zaGFyZWRfYXBlcnR1cmVf
ZW5kID0KQEAgLTcxNyw2ICs3MzAsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2lu
aXQodm9pZCAqaGFuZGxlKQogCQlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRl
diwgJnJhc19ibG9jaywgMCk7CiAJCXJldHVybiAwOwogCX0KKwogCS8qIGhhbmRsZSByZXN1bWUg
cGF0aC4gKi8KIAlpZiAoKnJhc19pZikgewogCQkvKiByZXNlbmQgcmFzIFRBIGVuYWJsZSBjbWQg
ZHVyaW5nIHJlc3VtZS4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
