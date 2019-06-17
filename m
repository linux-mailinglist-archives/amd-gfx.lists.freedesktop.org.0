Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88548F75
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60BD89C9B;
	Mon, 17 Jun 2019 19:32:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C21689C89
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7278426qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBPWWwDrdKOz4EO8fWLiPi6eT81XMCJtaR5vWheqUuk=;
 b=drLmQzpWhUKFtPKd64pWxmh5tgyyHnD3W38C4GiT8IqBf2T5RV4OGEqBlen618XpKd
 63Hw/vWEqpDHPPua5CfPCZqTGN+K+45oZYpwHfZ6aYGU1gOhoExKYl9BJQMqx4eBw2QM
 9mnIhivEWNfRazv/karhcq8rXjmfesrvLC+ixY11SNnqgdK6ct0SqPeX2YL3qw4GB2GL
 OUc3tFV6jmQ89VFEQKWVHjpv5qULy7Ypl0183uVst18acbu3i5US8YooytloiWuLvGHF
 NpEq140LtUOz5o2E9rLWAH3tiSF6wnPdo9ylbdivK/CJiIcxrx6sAysGBQkO46yEH6bw
 rsFA==
X-Gm-Message-State: APjAAAUL4aj1X/9F/jK/ZUEwDYzb0dVqQI0LtJM8sU0yocXg9MQmnVxC
 yiPv0gSHwua7YlsvfjJmDy6qx/R5Sgw=
X-Google-Smtp-Source: APXvYqycNJJIAjH9yzImz9+N8DchHRJfMIhfhIhqbUUM5C0Jep2hrvbQWXx7CCnMFTU3YFpns23D2g==
X-Received: by 2002:ac8:290c:: with SMTP id y12mr7285924qty.141.1560799926357; 
 Mon, 17 Jun 2019 12:32:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 258/459] drm/amd/powerplay: fix amdgpu_pm_info show gpu load
 error
Date: Mon, 17 Jun 2019 14:30:25 -0500
Message-Id: <20190617193106.18231-59-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBPWWwDrdKOz4EO8fWLiPi6eT81XMCJtaR5vWheqUuk=;
 b=UxTB1lzFO9AxBPCJntF3I3gDweJyeD41P+k3UKel99o0c/0c01nx5m4RHT9Geh3lFU
 PQBdnhNr1n036UamtvbG/uvxzlEaJTQCGDkpeAWTW+y9ACUEbdfxl6sR6m4wP8wYH2Da
 Vm4I6/7WcMw6hitcfsjtRZM/x0Yz/dBRdglJSgHiiPVANe1HkQzpS9XZ9BdTjhWnlsjz
 AxbWBPYS3cAc/hX8E50aOfe9UlPpjR8fs8bd/3zuGlqeddsmoWYL7vpgZRpNki5aX7OA
 SwZl6VThVSnP8QLLdO0waRbNOeeM87KDIz9D3ic6Ti9UYz5sY6Yx0Y36pfoTmctZoLPO
 N5lA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmR1ZSB0byB0aGUgc211IGRt
YS9SVE9TIHJlc3RyaWN0aW9uLCB0aGUgaW50ZXJ2YWwgb2YgY2F0Y2hpbmcgc211Cm1ldHJpYyB0
YWJsZSBzaG91bGQgYmUgbW9yZSB0aGFuIDFtcy4gb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgdGhl
IGdwdQphY3Rpdml0eSBkYXRhIGNvcnJ1cHRpb24uCgpTaWduZWQtb2ZmLWJ5OktldmluIFdhbmcg
PGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGgu
ZmVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCA0ODUxMjIyYzk5MTkuLjVmNjk3
ZWQzNzk2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpA
QCAtODE2LDYgKzgxNiw4IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5
X3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaWYgKCF2YWx1ZSkKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKKwltc2xlZXAoMSk7CisKIAlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwg
U01VX1RBQkxFX1NNVV9NRVRSSUNTLAogCQkJICAgICAgICh2b2lkICopJm1ldHJpY3MsIGZhbHNl
KTsKIAlpZiAocmV0KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
