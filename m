Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7B48DD1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A517892D5;
	Mon, 17 Jun 2019 19:17:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC82B892E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:25 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so6941020qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkYtO/ESKWs0TaD3I2tBTkzdGNoJZ1YGAd+htRBLd8c=;
 b=DWRupSXPgtPZ5jwwE1UdspV8Zk+k8lT+PDQMkNvjf+nF71LjOfVi6AwXXMDeOdBS4n
 gTplveq8GjMo1nToID0WkhmuuMgQtxQvL1SrJIXnr41saRXNLeFQkkQimBuuiAYVyW80
 iYnaTSeyUbY0hxtERwD/fVyjBAOMNbVSxosaehQubSMHixvg371CJeP0UOgnu11tsyXf
 odva7xjOpKjJ/VRO2GJKInQzc3lK+qb1SOT7mENvLVzPJIr/s9ky8kHjHjFaibXDfbY9
 WjzPLEeL88iGhF6J8pMWgGKYqyuvfVJrAx4ocKvxaPO0VHjXfAAOTYnf91NHBN1VbHT3
 GC8Q==
X-Gm-Message-State: APjAAAVKyt9iTP1bm0TAeSeshxYXnzLWEN/gI/WZAhiLg2YuC13afUcJ
 t/X2Xi7wpYwoFkTT0rgkuzIGDj2oL58=
X-Google-Smtp-Source: APXvYqyEL4CzuIqhyBGWPo9Wm4yg+CuwOpdyw6czO1u9UJXa9yq9Zu8cf+sRH3/hdVQAfPa6D7c2rg==
X-Received: by 2002:a37:a30a:: with SMTP id m10mr43363586qke.288.1560799044529; 
 Mon, 17 Jun 2019 12:17:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 023/459] drm/amdgpu: add gpu_info_firmware v1_1 structure for
 navi10
Date: Mon, 17 Jun 2019 14:09:44 -0500
Message-Id: <20190617191700.17899-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkYtO/ESKWs0TaD3I2tBTkzdGNoJZ1YGAd+htRBLd8c=;
 b=QnGSTGSIso6v+jwVlby7mGgSDoCn6ZtOVdlbBbbUlBXT3JhT90FQGSMK75ceem30Xr
 GObkIjGVUc3zU/1Iq1k6RTkcKsbPdR6c9yHoMj1Ida0OvVtIPJTQDrGl4pfpPXjluFBU
 BEb2RJH9ISldGTcdAY+PodKmuCaGcZT7vituYadDeeMIXFSnv1uWVHMOaOHdQFmwDWLb
 xceZS5soTxp8G4Dj9nVHCr+emaj+u5NawdUIajk9uU9270oxMk0EENlk7SR8O+w1bp+I
 SWJn/UEqw5gPFUyNn3LTgIDQ1sQjx65ZXjuvr/t0w7Q0tWzMyrx6Foccp7grygIAvqCa
 raWA==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdHdvIG5ldyBtZW1i
ZXJzIHRoYXQgc3BlY2lmaWMgZm9yIG5hdmkxMCBhcmUgaW5jbHVkZWQgaW4gdjJfMDoKbnVtX3Nj
X3Blcl9zaCBhbmQgbnVtX3BhY2tlcl9wZXJfc2MKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhh
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91Y29kZS5oIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCmluZGV4IGVjNGMyZWEx
ZjA1YS4uMTM0N2QzZTNjZWE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdWNvZGUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dWNvZGUuaApAQCAtMTYxLDYgKzE2MSwxMiBAQCBzdHJ1Y3QgZ3B1X2luZm9fZmlybXdhcmVfdjFf
MCB7CiAJdWludDMyX3QgZ2NfbGRzX3NpemU7CiB9OwogCitzdHJ1Y3QgZ3B1X2luZm9fZmlybXdh
cmVfdjFfMSB7CisJc3RydWN0IGdwdV9pbmZvX2Zpcm13YXJlX3YxXzAgdjFfMDsKKwl1aW50MzJf
dCBudW1fc2NfcGVyX3NoOworCXVpbnQzMl90IG51bV9wYWNrZXJfcGVyX3NjOworfTsKKwogLyog
dmVyc2lvbl9tYWpvcj0xLCB2ZXJzaW9uX21pbm9yPTAgKi8KIHN0cnVjdCBncHVfaW5mb19maXJt
d2FyZV9oZWFkZXJfdjFfMCB7CiAJc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgaGVhZGVy
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
