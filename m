Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895248DDE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A2489322;
	Mon, 17 Jun 2019 19:17:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AE892EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7217527qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWt9fLznPgXzUa6ytFIjFhmSXZgVycpIFjB1R9VddNc=;
 b=HeJq9gjb9+s7pAvuEZ4DiytRjcmjYd+m/uysa7LY5uH4aE4zZFBlA4TRzLx13Q56SI
 cBrAo/Mnph87nHcleWZn6JOoDLXFRF9Szxq25qnt+icGmuFHbH8PLEXQ8eB7RWHoMRpL
 jEHwTFF81mOINaaEsGypOdaXrSy7uB6tL35+Eda0RCBpZRBJNvb21h04NpUcfububHab
 GyCGRUdYIWrHRjwnRLc4aDUNdcG6ONB1ls6Oyl6f/y/XqX8OBQKCl0uEAkCF2AIKkOVV
 FO5/SDctItcCcGouYLMr+Kj+aeEjbjQ8ZrtloxDMA7iNUZK1sF0NKDdXnUnRHB9ojXs9
 INHA==
X-Gm-Message-State: APjAAAWG9NkpY7I5sZbcUwG1zDXKOj0cxVv/y+e5cJtO+wgY7oDnQoXh
 QzBemi4DjAkeJzqtrjvUEuUb73rVKfk=
X-Google-Smtp-Source: APXvYqxcI6+K+WAyTL/l9Ds5XI0zRcvo+hxVNHAl1xEEvWDWEnBOEQXHezA+CCwn6jHjgG/X86T0tQ==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr1644891qvh.225.1560799056659; 
 Mon, 17 Jun 2019 12:17:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 033/459] drm/amdgpu/gfx10: new approach to load pfp fw (v4)
Date: Mon, 17 Jun 2019 14:09:54 -0500
Message-Id: <20190617191700.17899-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWt9fLznPgXzUa6ytFIjFhmSXZgVycpIFjB1R9VddNc=;
 b=Hdb5p7WUNsouR+c2udauCH9fwz4QPrfQ5p9X2sQbKfT5V+d0EgBMPFprLH4RoUrZJL
 caP4xjmQ6E+dfZ/Mx9YQU7m7Wz9OMcAdgymuoTh2HLcnQlYCN1yEt4EnUk29Q0usDcFN
 Nxge0vIQuNtPB/PInFF5CpBHcYgzn06IxssPf/PMGChdH/4a1QP8Cts/KYq0NrsARNM4
 +Y1nKoowutGccqDZMnUAWJy+E+sjkj5mXYKD1MBJEJNenIpWTiBo7+m6zx3Z4sNerKrv
 WIWP035b9S+yeAwm99EzLXW5BlVoHKZ5PTNsoQoCNLLhgnjULyKGmDsFFbmQCseLlM4v
 RacA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKZ2Z4MTAgYWxsb3dz
IHRvIG9ubHkgdXBsb2FkIHBmcCBqdW1wdGFibGUgd2hpbGUgc2F2ZSB0aGUgd2hvbGUKcGZwIGlt
YWdlIGF0IGd0dCBtZW1vcnkuCgp2MjogcHJvZ3JhbSBDUF9QRlBfSUNfQkFTRV9DTlRMIHRvIGRl
ZmF1bHQgdmFsdWUKdjM6IHN3aXRjaCB0byB1c2UgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCB0
byBjcmVhdGUgcGZwIGZ3IGJvCnY0OiBzcGxpdCBjb21tb24gY29kZSBmcm9tIGdmeDEwIGNvZGUK
ClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQWNrZWQt
Ynk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCmluZGV4IGFmMGJiMmIwMmFiZC4uNTc0NTUw
ZTllOWU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCkBAIC0xOTUs
MTAgKzE5NSwxNyBAQCBzdHJ1Y3Qgc3Ffd29yayB7CiAJdW5zaWduZWQgaWhfZGF0YTsKIH07CiAK
K3N0cnVjdCBhbWRncHVfcGZwIHsKKwlzdHJ1Y3QgYW1kZ3B1X2JvCQkqcGZwX2Z3X29iajsKKwl1
aW50NjRfdAkJCXBmcF9md19ncHVfYWRkcjsKKwl1aW50MzJfdAkJCSpwZnBfZndfcHRyOworfTsK
Kwogc3RydWN0IGFtZGdwdV9nZnggewogCXN0cnVjdCBtdXRleAkJCWdwdV9jbG9ja19tdXRleDsK
IAlzdHJ1Y3QgYW1kZ3B1X2dmeF9jb25maWcJY29uZmlnOwogCXN0cnVjdCBhbWRncHVfcmxjCQly
bGM7CisJc3RydWN0IGFtZGdwdV9wZnAJCXBmcDsKIAlzdHJ1Y3QgYW1kZ3B1X21lYwkJbWVjOwog
CXN0cnVjdCBhbWRncHVfa2lxCQlraXE7CiAJc3RydWN0IGFtZGdwdV9zY3JhdGNoCQlzY3JhdGNo
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
