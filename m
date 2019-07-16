Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3EE6A041
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993E36E054;
	Tue, 16 Jul 2019 01:28:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D039289F33
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:59 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id v22so13240733qkj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkM3B1gWMtaP0Zd5ubGV1J0z2Ab2bK0O7bj32JCIbXw=;
 b=Zu0zYcLUceuPpvZbufU4rTs6/gOwYuqZ9qAbHgr/h8e1tX6yRFFrIlnhkQpYbutUb/
 M7DVye38JOLvORi/dYTenrOrADpJxdBkYge9jOyNwqrRlBhvK4r2BDAIVUQdJAYIulQo
 hHtxF4JHD7rO68WacPmYxX7zV9Wh/Vz6wpAGEi6PLDQOaQbKhmeIr14gNF9jFPS05jPN
 Iint4vhXpce8hioXggP1QkRAdgy5fqut0A7+rRJMc4r+0+IIx/iwBvjE3W+0PnpdUNCe
 UA8llHBIqM8EwbNb5/FdlmNPOqsyEyrd6Uqy6flZ8FTjG2NQBOWx3G8OXdf8jOGUVLE/
 S5+w==
X-Gm-Message-State: APjAAAVDl36m8fSiT7HH2ZUBDOOUGMUxYPq+k1M0jBSUmuKuXnIEeK5G
 kfOpG7bGR6LtnK/AJWl9Qrii+xXM
X-Google-Smtp-Source: APXvYqxDMzfcq50MmsCHnbndLMMIlZ87Q2oRr6+KOiC2N0jbRgDD8W3UG1L+AAbTy5uxjMPdjjsu+w==
X-Received: by 2002:ae9:e64d:: with SMTP id x13mr18102219qkl.445.1563240478787; 
 Mon, 15 Jul 2019 18:27:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 101/102] drm/amdgpu: drop unused function definitions
Date: Mon, 15 Jul 2019 20:27:40 -0500
Message-Id: <20190716012741.32036-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkM3B1gWMtaP0Zd5ubGV1J0z2Ab2bK0O7bj32JCIbXw=;
 b=jW9Bewo7tmccLmMZA48ZY9XGCT6PXsvVEvv+hCVL3mBij+gmAvGax+bZ5rMXrqXpDa
 eWwwqed3KvMVCIlveD48y4X99JjOVvKSy35D3JQLc4AlKWa+u9Y3zktKyzkrcX9uToOu
 n6dAU1ApCOK6xu1/t+lvVqoHDRFWUFHQPO7KljFJQqL+yjwmFfVzWGQBWjp00c8pBkAj
 jLNQN4EXs9GY4XCs5QCtdgIdzy2A5QeadbfPUNfmOxDYzhYpuA98fnKwQoxYoORZEGs8
 Xtki79OTsLdfdKg3mM4NH1MSsgX68u5JN2pnDSLKfSe9FG/2Ck1Olr3wiIkMnSbII/qU
 BItg==
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

VGhlc2Ugd2VyZSBkcm9wcGVkIGFuZCB0aGUgaGVhZGVycyBuZXZlciBnb3QgY2xlYW5lZCB1cC4K
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5oIHwg
MTQgLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuaAppbmRl
eCBiNzlkMmE2Mjk3NjguLjI2ZDg4NzliZmY5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5oCkBAIC01NSwyMCArNTUsNiBAQCB1aW50
MzJfdCBrZ2RfZ2Z4X3Y5X2FkZHJlc3Nfd2F0Y2hfZ2V0X29mZnNldChzdHJ1Y3Qga2dkX2RldiAq
a2dkLAogCQkJCQl1bnNpZ25lZCBpbnQgd2F0Y2hfcG9pbnRfaWQsCiAJCQkJCXVuc2lnbmVkIGlu
dCByZWdfb2Zmc2V0KTsKIAotdWludDMyX3Qga2dkX2dmeF92OV9lbmFibGVfZGVidWdfdHJhcChz
dHJ1Y3Qga2dkX2RldiAqa2dkLAotCQkJCXVpbnQzMl90IHRyYXBfZGVidWdfd2F2ZV9sYXVuY2hf
bW9kZSwKLQkJCQl1aW50MzJfdCB2bWlkKTsKLXVpbnQzMl90IGtnZF9nZnhfdjlfZGlzYWJsZV9k
ZWJ1Z190cmFwKHN0cnVjdCBrZ2RfZGV2ICprZ2QpOwotdWludDMyX3Qga2dkX2dmeF92OV9zZXRf
ZGVidWdfdHJhcF9kYXRhKHN0cnVjdCBrZ2RfZGV2ICprZ2QsCi0JCQkJCWludCB0cmFwX2RhdGEw
LAotCQkJCQlpbnQgdHJhcF9kYXRhMSk7Ci11aW50MzJfdCBrZ2RfZ2Z4X3Y5X3NldF93YXZlX2xh
dW5jaF90cmFwX292ZXJyaWRlKHN0cnVjdCBrZ2RfZGV2ICprZ2QsCi0JCQkJCQl1aW50MzJfdCB0
cmFwX292ZXJyaWRlLAotCQkJCQkJdWludDMyX3QgdHJhcF9tYXNrKTsKLXVpbnQzMl90IGtnZF9n
Znhfdjlfc2V0X3dhdmVfbGF1bmNoX21vZGUoc3RydWN0IGtnZF9kZXYgKmtnZCwKLQkJCQkJdWlu
dDhfdCB3YXZlX2xhdW5jaF9tb2RlLAotCQkJCQl1aW50MzJfdCB2bWlkKTsKLQogYm9vbCBrZ2Rf
Z2Z4X3Y5X2dldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3ZhbGlkKHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsCiAJCXVpbnQ4X3Qgdm1pZCk7CiB1aW50MTZfdCBrZ2RfZ2Z4X3Y5X2dldF9hdGNfdm1pZF9w
YXNpZF9tYXBwaW5nX3Bhc2lkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
