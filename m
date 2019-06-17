Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271148E24
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352FD89725;
	Mon, 17 Jun 2019 19:18:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0539A89700
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7221982qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMi3hNkSQcrQ1Ur/U/8JmN5Bp2gyEbhI2Wpy8T4+l7g=;
 b=hHIxnXnS1iwat9KI47tt2VWymgUg8f7bttiQ6mI6MMoKBXjWKJADM3zG/KtkhSla0K
 /omgHWfQtjbpO5WRI2a2xW0SwUADeRv5KZQ+ON2zvQliCFkUz9ZQazONtpli3fpweUH7
 5A5vFkDu+SdSjD0CMLUDnFj0/d5H+m0CCQ0zpP6l9XUC7Cu7PCDWGmINJB6EoOyyD16s
 9QY8gUy+tspfqCGgWMf2Tpo3PYbEHiZI1iEosGSPwU8ifqoosep1oDi9trOEDHxRTJ+s
 5ot8FwOxqm/OHibiI8whGw16gTbJjjA7Ws7tVR/N6Nh1glO+nEHSV2a94qdRU52sq6w+
 CVdQ==
X-Gm-Message-State: APjAAAWJ8EDF+9eEKPseeFgEww8zjP6dO68bFb4QWvG2FYJZy3yIRQd1
 a5KFm5+uNWcJPHY1Di1pEgXatpnoAVs=
X-Google-Smtp-Source: APXvYqwZPfe812UJxa0MWdo+FRNok757JJYEnHrmWLqlmudWxmd9CiNu5wVh1woMf9wIokMHj55DLg==
X-Received: by 2002:ac8:24f5:: with SMTP id t50mr93090259qtt.285.1560799118021; 
 Mon, 17 Jun 2019 12:18:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 101/459] drm/amdgpu/discovery: use hardcoded
 mmRCC_CONFIG_MEMSIZE
Date: Mon, 17 Jun 2019 14:11:02 -0500
Message-Id: <20190617191700.17899-90-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMi3hNkSQcrQ1Ur/U/8JmN5Bp2gyEbhI2Wpy8T4+l7g=;
 b=bVpd9e/Ipa9gR442lBx6QUzGfN/dLJ+trOf+7e4BEBQ4JUKqnqXy9WxfeLRvhpA71T
 89AVaygGlk+kgbCy5BgvfquQTYTL0fcz9s/y/AoFpkX1nV4h9dyzN78/W80r7XZw7xP9
 rIH59noa3m9I/mRzx7wSL+1uS1U9aPb/e0PxoguofUYHiMr11fSLeO3/kJsjgcEOGw0I
 wrqT7rVntMITmnmhBTg7d+WMysyNI5Gym95d8p2QI8WaAruhyHCJ9f4LKREI8qTaKcjq
 vofe6r00LAN8wpjk4QlO4K5yCGtPk2d/YF6ZKrfUioIw7nHE2y4VXfg9iDTtn7dMOHrS
 voUQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnJlZ2lzdGVyIGJhc2Ug
b2Zmc2V0IG9mIG5iaW8gaXMgbm90IGtub3duIGJlZm9yZSBJUCBEaXNjb3ZlcnkgdGFibGUgaXMK
cGFyc2VkLCBzbyBoYXJkY29kZSB0aGlzIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZ
dWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kaXNjb3ZlcnkuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGlzY292ZXJ5LmMKaW5kZXggZjYxZWI4NTQyYzRkLi5hYzA2NWFiOTFjNGIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKQEAgLTI4LDEw
ICsyOCwxMSBAQAogI2luY2x1ZGUgIm5iaW8vbmJpb18yXzNfb2Zmc2V0LmgiCiAjaW5jbHVkZSAi
ZGlzY292ZXJ5LmgiCiAKLSNkZWZpbmUgbW1NTV9JTkRFWAkweDAKLSNkZWZpbmUgbW1NTV9JTkRF
WF9ISQkweDYKLSNkZWZpbmUgbW1NTV9EQVRBCTB4MQotI2RlZmluZSBIV19JRF9NQVgJMzAwCisj
ZGVmaW5lIG1tUkNDX0NPTkZJR19NRU1TSVpFCTB4ZGUzCisjZGVmaW5lIG1tTU1fSU5ERVgJCTB4
MAorI2RlZmluZSBtbU1NX0lOREVYX0hJCQkweDYKKyNkZWZpbmUgbW1NTV9EQVRBCQkweDEKKyNk
ZWZpbmUgSFdfSURfTUFYCQkzMDAKIAogY29uc3QgY2hhciAqaHdfaWRfbmFtZXNbSFdfSURfTUFY
XSA9IHsKIAlbTVAxX0hXSURdCQk9ICJNUDEiLApAQCAtMTM0LDggKzEzNSw3IEBAIHN0YXRpYyBp
bnQgaHdfaWRfbWFwW01BWF9IV0lQXSA9IHsKIHN0YXRpYyBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9y
ZWFkX2JpbmFyeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDhfdCAqYmluYXJ5KQog
ewogCXVpbnQzMl90ICpwID0gKHVpbnQzMl90ICopYmluYXJ5OwotCXVpbnQ2NF90IHZyYW1fc2l6
ZSA9IFJSRUczMl9TT0MxNShOQklPLCAwLAotCQkJbW1SQ0NfREVWMF9FUEYwX1JDQ19DT05GSUdf
TUVNU0laRSkgKiAxMDI0ICogMTAyNDsKKwl1aW50NjRfdCB2cmFtX3NpemUgPSAodWludDY0X3Qp
UlJFRzMyKG1tUkNDX0NPTkZJR19NRU1TSVpFKSA8PCAyMDsKIAl1aW50NjRfdCBwb3MgPSB2cmFt
X3NpemUgLSBCSU5BUllfTUFYX1NJWkU7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
