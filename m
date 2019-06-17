Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CAC49002
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3428F89E32;
	Mon, 17 Jun 2019 19:46:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7F589E3F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so7020715qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGFdpBmRY2XFJESYJ/BBrzEU1qkOJYUYwCPs9WDHYkE=;
 b=rnwEsjHfAvbfBVPwhUiYSxPfIRJ/UrEknrNV9Abovuyi/4gxsCEf8I/yOoBbTOf+Y6
 bv7x0ZyrcioGTy9c/9RP0LfwcVbbuSwsJpfNUbCHz4a4OwmUJMD2E0dKxTkUGos76+71
 0Qeua3ciAwX/JxVrg+T9zrTTD3gL8fr09he1WdvAy0Gvy7McAw9uOB+ld4jRYfkJKwEz
 6hvSvtLXHutOWlTHZJmSrq5TnsVhGNsWj/N3RRCjvu0Sn88ffLDwPaeSZRZzgGu1USAn
 zFoCAz+JeOxIKqW5onTxslIzKih0lvSB3KvvPqN/6t+RhIc8cO7xVApdqLGtszZyHz/A
 O5bQ==
X-Gm-Message-State: APjAAAVBMqUpGAZqVkN5iTOsyk9suHH73VOZlW9l7bbkJSPo1wvmVhiz
 o+JU64lsWOVTc7eRBwlXVN86enxvE+c=
X-Google-Smtp-Source: APXvYqwJNyrgqwJwWgr0HINKbj84uaouktarqPmaBhF2IeSpiLqRiqPx/cYmU0ceyMsZ95d4VSytiQ==
X-Received: by 2002:ae9:c208:: with SMTP id j8mr90088634qkg.264.1560800795750; 
 Mon, 17 Jun 2019 12:46:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 340/459] drm/amd/display: update dcn2 dc_plane_cap
Date: Mon, 17 Jun 2019 14:44:41 -0500
Message-Id: <20190617194540.18497-41-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGFdpBmRY2XFJESYJ/BBrzEU1qkOJYUYwCPs9WDHYkE=;
 b=agV70vqpp0Q88yIGC2Igd95LOkdo7mP1dVXUuUpPw4p2KohTuXm8AbylyS/caOpKg6
 BRhZmrrRrs86cAHKobn97G4jOcGDguMqraM6M+D4NNQVyxni391xQoJv3IZx3F4O00fB
 N2DJF8ho3e9OJg56oGCtY/guUWiEr6FLR+f7y5wIvl6BIuJBNoBwqKiW2UNsp94KCF0e
 wqPYIc9446T1JNFaULuPBpiJJNH3OlHTCHI4AT0CtBEiFZUj4cOyAFhC7H3mdQtJANOK
 FPxT58gAGHajLU4xVckQ60uCEEEb7sSzhF3s8pGlzGYQ4uubuHxuVywxi/eh/MCEuwNt
 SQNw==
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

VG8gZGVhbCB3aXRoIHJlYmFzaW5nIHRoZSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIxICsrKysrKysrKysrKysrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5k
ZXggMTZiZTIyYTIwOTFkLi5hZjRlMjQ0N2E1ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC02MDEsMTAgKzYw
MSwyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRjX3BsYW5lX2NhcCBwbGFuZV9jYXAgPSB7CiAJ
LnR5cGUgPSBEQ19QTEFORV9UWVBFX0RDTl9VTklWRVJTQUwsCiAJLmJsZW5kc193aXRoX2Fib3Zl
ID0gdHJ1ZSwKIAkuYmxlbmRzX3dpdGhfYmVsb3cgPSB0cnVlLAotCS5zdXBwb3J0c19hcmdiODg4
OCA9IHRydWUsCiAJLnBlcl9waXhlbF9hbHBoYSA9IHRydWUsCi0JLnN1cHBvcnRzX2FyZ2I4ODg4
ID0gdHJ1ZSwKLQkuc3VwcG9ydHNfbnYxMiA9IHRydWUKKworCS5waXhlbF9mb3JtYXRfc3VwcG9y
dCA9IHsKKwkJCS5hcmdiODg4OCA9IHRydWUsCisJCQkubnYxMiA9IHRydWUsCisJCQkuZnAxNiA9
IHRydWUKKwl9LAorCisJLm1heF91cHNjYWxlX2ZhY3RvciA9IHsKKwkJCS5hcmdiODg4OCA9IDE2
MDAwLAorCQkJLm52MTIgPSAxNjAwMCwKKwkJCS5mcDE2ID0gMQorCX0sCisKKwkubWF4X2Rvd25z
Y2FsZV9mYWN0b3IgPSB7CisJCQkuYXJnYjg4ODggPSAyNTAsCisJCQkubnYxMiA9IDI1MCwKKwkJ
CS5mcDE2ID0gMQorCX0KIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNfZGVidWdfb3B0aW9u
cyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
