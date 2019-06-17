Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD748FDA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558B89DA6;
	Mon, 17 Jun 2019 19:46:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E19F89D1D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:01 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12253171qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2kxCvu1YPirXfQHKs8JVD4ltCI+AmJAornc7288yiI=;
 b=Sb5KWdnU7w+F/Rd3sbT23hiQ6UfBjgv9f/j+Jjku7lFV9ffpfSC1E0BAnSd1RNxe8n
 g04T7IojcqT0h+cJPpTCJTgCZSm/6NhsIxx1poHAvbBsh/NWs6fI/eEBZFmFOAuAIjRe
 4yFpLKudTk37KROL6Ps3eOGg0rgg4VM12G+sWm7jTSU17FxkykpKvtQx4V629wBQ63jj
 754vSUliUfo5oqQvV4PjjD3bVHpsfU7Zw4Ek9cRX7VF7V1pxav6+HBAji+LsoXVL/GFg
 BKq9U4QCXMkg30AnT9COFlQ5XaNsoLtZTZ7W3CccfDc1QgjMHQTdOTE3aZA9+a4L2aVu
 CKmw==
X-Gm-Message-State: APjAAAUqQFK5s+//6Ijz/uo4vbONrw8Pfchl+u96Fev788NtHUbu67To
 FzZ9+tdeHBF0bSdWjU0gGrxh40Ro9XI=
X-Google-Smtp-Source: APXvYqxhbxS1nXMclfppqBKMlqhEBJGURfbGf+JUFtEuXCH7hiNiHmSkVOQlQ4xigmIZtdYKeHnFDQ==
X-Received: by 2002:ad4:46f1:: with SMTP id h17mr23631046qvw.109.1560800760525; 
 Mon, 17 Jun 2019 12:46:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 310/459] drm/amdgpu: initialize THM & CLK IP registers base
 address
Date: Mon, 17 Jun 2019 14:44:11 -0500
Message-Id: <20190617194540.18497-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2kxCvu1YPirXfQHKs8JVD4ltCI+AmJAornc7288yiI=;
 b=cW3c0A6emddFsGHFPXqa97x7U6GHO5SOp5JUD2s1UOMAZlh5L6qWy/w6Uyc3tI8WY+
 TDruOlyBBCFYfR9u7VbBpCbFFqCwrL9npxPBSiVDPamVZ8lE3ZRXCwi40kkcyG/N2wJh
 2DMfsDfdFcb8g4TGSgFOqL6izGC+o7AhT2e5guVpk/XejohQONJDBd9fWiWKufLs6LCR
 wgAa2SOF95L5sADEGRzADJ1ovi1U/6BoCBTriYP8WkTBHMvqO78yqMQW85+NtN90GRTL
 m4CccMeO5tZtgSRSVc+jAetVmprqB+kHagiKhDfuzh3F4+A9xJNIem2RuZff1ZHntVVj
 yC/w==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbmF2aTEwX3JlZ19pbml0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmF2aTEwX3JlZ19pbml0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfcmVn
X2luaXQuYwppbmRleCA4Y2Q0NTY4YzA3ZWUuLjU1MDE0Y2U4NjcwYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX3JlZ19pbml0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX3JlZ19pbml0LmMKQEAgLTU4LDYgKzU4LDggQEAgaW50
IG5hdmkxMF9yZWdfYmFzZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlhZGV2
LT5yZWdfb2Zmc2V0W1NETUEwX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoR0NfQkFTRS5pbnN0
YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1NETUExX0hXSVBdW2ldID0gKHVpbnQzMl90
ICopKCYoR0NfQkFTRS5pbnN0YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1NNVUlPX0hX
SVBdW2ldID0gKHVpbnQzMl90ICopKCYoU01VSU9fQkFTRS5pbnN0YW5jZVtpXSkpOworCQlhZGV2
LT5yZWdfb2Zmc2V0W1RITV9IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKFRITV9CQVNFLmluc3Rh
bmNlW2ldKSk7CisJCWFkZXYtPnJlZ19vZmZzZXRbQ0xLX0hXSVBdW2ldID0gKHVpbnQzMl90ICop
KCYoQ0xLX0JBU0UuaW5zdGFuY2VbaV0pKTsKIAl9CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
