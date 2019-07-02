Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4E5D77C
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A836E073;
	Tue,  2 Jul 2019 20:29:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC26E073
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:33 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so20129449qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0PQR66/H62b9yw3XBE4YNzths3sBEUEgFJXDEJsVj0=;
 b=C/qiTK5ZCGLew53VroZuYZx6BnjPpIDR2tQyUsHt0vKCzsbX5IynCillnt+Cn7lbOz
 PZHIICMhSF2b99G84j2o20Ah73RWMaalZSQMtl4ych4/A2G/tm4/AhlMsft0bljNEUf1
 2owllwnyC7ouNGk/06ktumSPmPm2S4qIf+Yd4A9udq4XadwO+ym0sfembS+RVdoimzGB
 xYaIlrk+fCyU7K14lo0ZHz9R0k3K5RMHCJlyFSNhWfKaaZoEHWx+oM00nqyL2rRkSLx9
 jJjE7/9KGw/msYy9YhIlqPgfDik5HvhwBjcYuGP9pUdRekIowEt4R+cidZZIDl0h3SAT
 kLFw==
X-Gm-Message-State: APjAAAWOmJb+usteIeaPIg/VQB98vE6krpajgeyYrjjeVKZX0ekXu7hY
 uRFK7VtHK7J1pu4Lz5cSjA2y7E/9wgk=
X-Google-Smtp-Source: APXvYqwHT8ZFQHcDe04poteOyAISqPRcwfwzkdJau3UKbAymniIVJiUkhgW0Yy2Ua2sd+PQ6JC3HiQ==
X-Received: by 2002:a0c:b4ae:: with SMTP id c46mr28536792qve.230.1562099372948; 
 Tue, 02 Jul 2019 13:29:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 42/53] drm/amdgpu: declare asd firmware for navi14
Date: Tue,  2 Jul 2019 15:28:33 -0500
Message-Id: <20190702202844.17001-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0PQR66/H62b9yw3XBE4YNzths3sBEUEgFJXDEJsVj0=;
 b=py8XmGQRIZcTbk3GRti3iJDz1YDALUQi46PjHtjwW1LfpUEiGkOJ0jaXCmkYCCHy9O
 UHkGNwXvWopU6gt2P4t0fx/DG0PmjQQwjupCz0XPKlUu6HoJRUBEksLeXm2zEhH0cMZH
 26wUYpKlvydBW55GY+c1dXyi+VPHfUdD4kGL3TVKtwO03J7Aq/SrQn5uPmT0NCmvjjA8
 N8Uffx/Ar5zzOVyyEDlPTOsyRbWUOKORfRrU1s9BH3yJBDMv69znkZUApLdinlPXxthd
 St7vxBRP/NFKXN/VXT65o1+U+xXbTaoJ2AtJvfS78t8X9BzbFy8RyCktYbm0zpT7UrCt
 wjrg==
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
Cc: Snow Zhang <snow.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNvIHRoZSBkZXBlbmRl
bmN5IGdldHMgcHJvcGVybHkgdHJhY2tlZC4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8
eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBTbm93IFpoYW5nPHNub3cuemhhbmdA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpp
bmRleCA3ZTcwNzBkNTUzMDEuLjdmZDg4NGQ4NzM4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMKQEAgLTQyLDYgKzQyLDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
dmVnYTIwX3RhLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX3Nvcy5iaW4i
KTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9hc2QuYmluIik7CiBNT0RVTEVfRklS
TVdBUkUoImFtZGdwdS9uYXZpMTRfc29zLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
bmF2aTE0X2FzZC5iaW4iKTsKIAogLyogYWRkcmVzcyBibG9jayAqLwogI2RlZmluZSBzbW5NUDFf
RklSTVdBUkVfRkxBR1MJCTB4MzAxMDAyNAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
