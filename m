Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799154901B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619089F47;
	Mon, 17 Jun 2019 19:47:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F6389F27
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:01 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so7021614qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAsfVkfUwXgZr9GkEy1qLgetP/63eZpPh16NOHZJCQw=;
 b=f3I789voUfKJx+Aj04gGo2TscoypI9BKjBWEXcuhGj68gvKvmpDaTIeLyrcwA/9NMF
 qEqe4LKLq332iEoTUaPEmOcz+dXNzMoZ0dUHDI6BWQUgnk7CrY2cyW13erkyp8nTdZuK
 uZYNPV3ms0JU1BNFMhD9uGUaO4ZXGuflc3ly/zsq0KZHQBFcToF1+6kS7pED3svfjTTN
 FqsdJPh3hDjcKBN4rHBZs+5AJfpGF7rxYQd2MTNbQy+Kzs/C1hRpj2Kn/fiMR3+8+cpe
 2+n/I/S/NiIarshw67S2GubkGOj3XBpUxU7gv+LloDj5ImaAbL3VALDVaoPN6H5ifGwB
 buWw==
X-Gm-Message-State: APjAAAVcxm2rpDN5TCP6BS1LE3ARsycSuyj+YqJ4Q7uzJSjQBrttiePE
 O/mHJdfMSSO0eVDWti2+wy0z3akeRoOwqQ==
X-Google-Smtp-Source: APXvYqyOZ+HNBlhpb+WiYWym1Ut/ERSaxsmLKGy/iRSfDljyLngHhByFStl3Gkf1hE+/Lx5GVM0jhw==
X-Received: by 2002:a37:8e83:: with SMTP id
 q125mr90641425qkd.255.1560800819919; 
 Mon, 17 Jun 2019 12:46:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 363/459] drm/amd/display: fixed DCC corruption
Date: Mon, 17 Jun 2019 14:45:04 -0500
Message-Id: <20190617194540.18497-64-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAsfVkfUwXgZr9GkEy1qLgetP/63eZpPh16NOHZJCQw=;
 b=o3kRhWv9u0GlDPLDApT3DbtW0gPASqZ2km3ziD3hxhW/cSNdixV8jvaAHBHvKC8qeW
 oXW32/e1AT+Yi+0SLNvfvbqEw6Dmz3RAKNtN18huAYfhqe5Jdl5L+g73kIgeQEYkrwU8
 MMjAE85K1VHYxaEE6ztxBrt2CGJLtTpc1O0d+SeAfXUXMPNr6tsSKg4tB/KIIsTHfrXq
 VeCziJngAXOqEiR/jcGMkqs2fo0yHH6bdoEQOZldsdM2ZBRPFQS+/w2038zR9X1UNW3R
 nBNyjGg3i2NuTHI1qzwdjqwwhGi9mseAhWOnI70aFcWIind7CST8tFXWpxAYIwe6C0Tf
 0P1Q==
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
Cc: Leo Li <sunpeng.li@amd.com>, Bob Yang <Bob.Yang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Charlene Liu <Charlene.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm9iIFlhbmcgPEJvYi5ZYW5nQGFtZC5jb20+CgpbRGVzY3JpcHRpb25dCnN3YXRoX2J5
dGVzX2hvcnpfd2Mgc2hvdWxkIGJlIDI1Ni82NC82NCBmb3IgMjE2MHAgMzJicHAgc3VyZmFjZQoK
U2lnbmVkLW9mZi1ieTogQm9iIFlhbmcgPEJvYi5ZYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBD
aGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfaHViYnViLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h1YmJ1Yi5jCmluZGV4IDA5ZThkMTBhN2EwMS4uYjNhOTliMTBjZmJkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVi
YnViLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1
YmJ1Yi5jCkBAIC0xOTQsOCArMTk0LDggQEAgc3RhdGljIHZvaWQgaHViYnViMl9kZXRfcmVxdWVz
dF9zaXplKAogCiAJaHViYnViMl9nZXRfYmxrMjU2X3NpemUoJmJsazI1Nl93aWR0aCwgJmJsazI1
Nl9oZWlnaHQsIGJwZSk7CiAKLQlzd2F0aF9ieXRlc19ob3J6X3djID0gaGVpZ2h0ICogYmxrMjU2
X2hlaWdodCAqIGJwZTsKLQlzd2F0aF9ieXRlc192ZXJ0X3djID0gd2lkdGggKiBibGsyNTZfd2lk
dGggKiBicGU7CisJc3dhdGhfYnl0ZXNfaG9yel93YyA9IHdpZHRoICogYmxrMjU2X2hlaWdodCAq
IGJwZTsKKwlzd2F0aF9ieXRlc192ZXJ0X3djID0gaGVpZ2h0ICogYmxrMjU2X3dpZHRoICogYnBl
OwogCiAJKnJlcTEyOF9ob3J6X3djID0gKDIgKiBzd2F0aF9ieXRlc19ob3J6X3djIDw9IGRldGls
ZV9idWZfc2l6ZSkgPwogCQkJZmFsc2UgOiAvKiBmdWxsIDI1NkIgcmVxdWVzdCAqLwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
