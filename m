Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0548F61
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D74889C37;
	Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF92D89C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r6so6989778qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCIJVvDw1VZgpRix+AyDVkWwpV6bQu54cdX0oitrRFU=;
 b=f4m0Gu6XPycdPAwXs/jaUBjUlmaJv6loBHbq5QLvLWq7j6scNRtXyBSGozDKh/ZSTK
 0cfzleWBliYmeSu0fU4PqeLcJG/kdoU+Hsykx/sfGeesJ5NgRy7SE5nMIcNcZS6rg1+/
 uyqFagka25LRjFeWEvDh7XGYjSRMSgnAIkbarg8A7iN7ruJRJ3hXaMO8oxZY5dLUjkBH
 1PPcOQkEtDbqw1nAORueiQT46uWAH6ucOdM4JRzRUKKK88dgOXKzoP1V22iXAnEM7jQs
 0ILEmsPwlJq5SS+2AeLxenL1cpYouA62R70d/gRKCDfVQzcYplxH/yEz1l0K+OsC6T+Y
 1jrw==
X-Gm-Message-State: APjAAAUKa8WAxyFhhoZXC+4mdBbdoTwDN7Zxp4YJYSTxU8YJ3xCL3eT1
 PhGdp2+saa0JXV2hILeN9K69up8Ulzw=
X-Google-Smtp-Source: APXvYqxAA+LlPupLapjjdrxEdmIVB8IdO9tQyefW8/iZjcYwlixB3/vHhcg3IqHGwYr/rT81yRvhTg==
X-Received: by 2002:ae9:f101:: with SMTP id k1mr6498288qkg.337.1560799913958; 
 Mon, 17 Jun 2019 12:31:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 244/459] drm/amd/powerplay: add function set_thermal_fan_table
 for navi10
Date: Mon, 17 Jun 2019 14:30:11 -0500
Message-Id: <20190617193106.18231-45-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCIJVvDw1VZgpRix+AyDVkWwpV6bQu54cdX0oitrRFU=;
 b=kRG0BXayO2CZjNbhXeL2D2HHR5WLDBOJDQ/cG5NG/ogllk5hDJzPOXdSU4boSY48Zu
 I7uvMYCiTEldq90+G0tbJGwQbG18WaQI74IxWzHnxdLm6jGyYzupSBO7v2FaD8D1GVJ2
 7VlWMpTuZQYXUFU1Tqg9B35HEL3B8FunYxEPih9bTnf7VY3fJUAW9LEGjHayWe3YLbBr
 oeLc+wuNV7RL2K/1UAhOyeeRw+owZLGLa1QRMn6GsNRcmFoM/VPsq5HBTmwzMMnoDgCI
 +VIRfAvKlrmrV3HEFLgUjLDfeefBDpscjFvT1CNNjcBb7N1Wkk7ysELj8NAF1dbrgHjH
 Rxrw==
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
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBzZXRfdGhlcm1hbF9mYW5fdGFibGUgZm9yIG5hdmkxMCBhc2ljCgpTaWduZWQtb2ZmLWJ5
OktldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXgg
Zjk4ZjFjNmE5NDI5Li5mZDc5NjMyMmZlMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKQEAgLTgwNyw2ICs4MDcsMTggQEAgc3RhdGljIGJvb2wgbmF2aTEw
X2lzX2RwbV9ydW5uaW5nKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiAhIShmZWF0
dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZFQVRVUkUpOwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9z
ZXRfdGhlcm1hbF9mYW5fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJaW50IHJl
dDsKKwlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxlX2NvbnRleHQgPSAmc211LT5zbXVf
dGFibGU7CisJUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFi
bGU7CisKKwlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1Nl
dEZhblRlbXBlcmF0dXJlVGFyZ2V0LAorCQkJKHVpbnQzMl90KXBwdGFibGUtPkZhblRhcmdldFRl
bXBlcmF0dXJlKTsKKworCXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0
YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS50YWJsZXNfaW5pdCA9IG5hdmkxMF90
YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRleHQgPSBuYXZpMTBfYWxsb2NhdGVfZHBtX2Nv
bnRleHQsCkBAIC04MzMsNiArODQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1
bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLmdldF9ncHVfcG93ZXIgPSBuYXZpMTBfZ2V0X2dw
dV9wb3dlciwKIAkuZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudCA9IG5hdmkxMF9nZXRfY3Vy
cmVudF9hY3Rpdml0eV9wZXJjZW50LAogCS5pc19kcG1fcnVubmluZyA9IG5hdmkxMF9pc19kcG1f
cnVubmluZywKKwkuc2V0X3RoZXJtYWxfZmFuX3RhYmxlID0gbmF2aTEwX3NldF90aGVybWFsX2Zh
bl90YWJsZSwKIH07CiAKIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
