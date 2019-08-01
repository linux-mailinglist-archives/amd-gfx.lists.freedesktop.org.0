Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C87E430
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35A6E7E6;
	Thu,  1 Aug 2019 20:30:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA226E7DB
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:26 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 201so53075559qkm.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDTIB5HvE1C/EFy24EkajUwEnIV5evquuAmtkHjlRGY=;
 b=qrOJuI5A8MWfaP52Mqugg5aucZ+zC+qQKg6arP3vMbFzsbCUe8XFHMo4+xC30YeLDp
 0qvgkXZxBtoAhHGMeKjXbdgM2pcJAtRJRhMqXd8GAZSLRwRLSOvRoCX8xk5syA47RY+K
 DIbCDXA1S/NL7lf+pGzBm630wp/4aMIDADbj5wqx+cGsg+Sw16SH8n/rBosZ3+EfL4xE
 TZZYVCtK+3sdR0jUCJfD/fhuL+G5v+SSt9sjd18Y2ZKY8xKpmGE+Gbjt0wPr7T97DG72
 jL3QNMyy9tX3DMj8191k49N2NEIRpxHn5gEBQaRHlKR2f2hR44HivPBmLycwtqXRM+I9
 O8xg==
X-Gm-Message-State: APjAAAWk8mUDKRaBckwUFQ/MgSoYoNEg9WKd/Bzw2YrBo4Ww3JMQaV82
 WDtH3EghP5qnmfJbgaal6F5L7YfS
X-Google-Smtp-Source: APXvYqzdngePk3v6E4ObgPG3faMvoC3sxbdZKBBlwG/Z3xMJJaLfdbm0oH+YP+772RKeDY/hgkvfZg==
X-Received: by 2002:a37:4243:: with SMTP id p64mr69871832qka.9.1564691424956; 
 Thu, 01 Aug 2019 13:30:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/36] drm/amdgpu/sdma5: add golden settings for navi12 (v2)
Date: Thu,  1 Aug 2019 15:29:43 -0500
Message-Id: <20190801202957.29791-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDTIB5HvE1C/EFy24EkajUwEnIV5evquuAmtkHjlRGY=;
 b=Dk2YQ8JJNRuO6QwUHsJMAsYOkxqLutxCBTUmfZg70OQF7K+V5gxCXJwWSQoCWXVQPW
 bvh1+ylQHyXPVQ4ALg6bs6u4SuHZDkGMZm1lh2aGQ7SuHsDHV5StCPN24WonWwNO0yoq
 vggYEu2kdESYOsYCaGGoM38TVm/wVV8OsyUhb4fgLsB6HcYlXf8aqm//xA5VhkhmfzUX
 ngxGfg4tnnrKIbOi950iIrFO8j8Nfp62MH+RMtGeKUWKwwGp+qKJ5FlPROXQJH6bOUG3
 KWroA7c56WMFY+pcos9xU0a9orvdxKbiadH83mbE6d8Uc8EVYJ2PkRvSEOQqeIGIU673
 695Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmNvbW1vbiBnb2xkZW4g
c2V0dGluZ3MgYXJlIHB1dCBpbiBnb2xkZW5fc2V0dGluZ3Nfc2RtYV81IGFycmF5Cgp2MjogdXBk
YXRlIHNldHRpbmdzIChBbGV4KQoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamll
Lnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyB8IDIgKysKIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djVfMC5jCmluZGV4IGViNmFiNTA2ZTMwOS4uNGQzMGIzZmY1YzM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpAQCAtOTYsNiArOTYsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX3NkbWFfbnYxNFtdID0gewogfTsK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19z
ZG1hX252MTJbXSA9IHsKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JM
QzNfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAorCVNPQzE1X1JF
R19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTFfUkxDM19SQl9XUFRSX1BPTExfQ05UTCwgMHhm
ZmZmZmZmNywgMHgwMDQwMzAwMCksCiB9OwogCiBzdGF0aWMgdTMyIHNkbWFfdjVfMF9nZXRfcmVn
X29mZnNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIGluc3RhbmNlLCB1MzIgaW50
ZXJuYWxfb2Zmc2V0KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
