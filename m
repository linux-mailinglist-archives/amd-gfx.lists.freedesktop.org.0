Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2E48E96
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166098984C;
	Mon, 17 Jun 2019 19:27:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3920889824
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so6942748qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KurzAjrSFIKXxjJfI6wDC2ySW20SXjYpyKmmLdat6o=;
 b=PoGj1vBJfd7k4cM7yhGJBeZQtEfWx5TLNl5PPLnrSGJ0Ldvv1VtjUkhRR3Geq8ybQc
 pe3PFqe0k4AxV5weMzpcGw5tzws8nqRTIRobZOq/p6SDotHt+X6j98Er/SpiRr12/LHM
 S+BgPS+9D/Q9BI276lrlQPe8f2yQnQNl0MoQik5lirMIWz27usXGpovNHMyTFehKAMzt
 oTIQ4XkOa1yWkFuGY7IdzBtpjzzNQvShsGRBaZsvH5IS0f/VZhHDr+c1XMSAin8M+6pe
 9ybaQHzTAK2bFBQ1KpsxUnc9Vu0m/2BGHVN8zBkLkRioz5JIm/sfp7zlYNhiqHC9kKAu
 UQSQ==
X-Gm-Message-State: APjAAAVFQIZN40WQ3Ce/z/Fk/pCFdtcM1z7GNMAnnTPp5UKNJMjQw2KB
 sd9kHfC7/qrvCZaZS7kn/zBRdF3dcLc=
X-Google-Smtp-Source: APXvYqzTYzTR+TzWStbsRA39dOn/63b8O2TYSRG4HgB/s7o/cg10k9U6oK/LNvMWwwDz8LTOv69Xjw==
X-Received: by 2002:a05:620a:1329:: with SMTP id
 p9mr23077467qkj.224.1560799637074; 
 Mon, 17 Jun 2019 12:27:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 105/459] drm/amdgpu/discovery: stop converting the units of
 base addresses
Date: Mon, 17 Jun 2019 14:25:30 -0500
Message-Id: <20190617192704.18038-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KurzAjrSFIKXxjJfI6wDC2ySW20SXjYpyKmmLdat6o=;
 b=F9l4eSSlUZwUi992TmeQoTdyj/7XsktzRqXwezUWTeDnxuR59xIkxFJjj6/XBU8m9b
 hWfUlIKT8NwnymJXElE0JEAEa8yrCFIJk+MtIulYPwqS0xshnQZ6mTCp6uqb1h6uRlhP
 3c5DIKKtcow6tN5ZkJOz6D5u9UieycrpeZ9ikCy+7uxpOgqxPK4tKi+VBvntBCKbt9rX
 7oG2X4gscmNqWzsTHUThlQTiDn+X46/CgTZgSH48MTnZPsrJy+hPRjaZbAc3lORXiM08
 VXr3NnH1ngrHTJBnoTWaONdMgy0WlBmUjjimWMps28qg56dPY4YAkDNhGr7Pv4EWBKkb
 ZZgg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnRoZSB1bml0IGlzIGFs
cmVhZHkgaW4gZHdvcmQKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFu
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgfCA2
ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKaW5kZXgg
NWY5NjdhZThkNGVkLi42OTc4MDBjNDc0MWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKQEAgLTMwMCwxMSArMzAwLDExIEBAIGludCBhbWRncHVf
ZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAkJ
CQkJZm9yIChrID0gMDsgayA8IG51bV9iYXNlX2FkZHJlc3M7IGsrKykgewogCQkJCQkJLyoKLQkJ
CQkJCSAqIGNvbnZlcnQgdGhlIGVuZGlhbm5lc3MgYW5kIHVuaXQgKGluIGR3b3JkKSBvZiBiYXNl
IGFkZHJlc3NlcyBpbiBwbGFjZSwKKwkJCQkJCSAqIGNvbnZlcnQgdGhlIGVuZGlhbm5lc3Mgb2Yg
YmFzZSBhZGRyZXNzZXMgaW4gcGxhY2UsCiAJCQkJCQkgKiBzbyB0aGF0IHdlIGRvbid0IG5lZWQg
dG8gY29udmVydCB0aGVtIHdoZW4gYWNjZXNzaW5nIGFkZXYtPnJlZ19vZmZzZXQuCiAJCQkJCQkg
Ki8KLQkJCQkJCWlwLT5iYXNlX2FkZHJlc3Nba10gPSBsZTMyX3RvX2NwdShpcC0+YmFzZV9hZGRy
ZXNzW2tdKSA+PiAyOwotCQkJCQkJRFJNX0RFQlVHKCJcdDB4JTA4eFxuIiwgaXAtPmJhc2VfYWRk
cmVzc1trXSA8PCAyKTsKKwkJCQkJCWlwLT5iYXNlX2FkZHJlc3Nba10gPSBsZTMyX3RvX2NwdShp
cC0+YmFzZV9hZGRyZXNzW2tdKTsKKwkJCQkJCURSTV9ERUJVRygiXHQweCUwOHhcbiIsIGlwLT5i
YXNlX2FkZHJlc3Nba10pOwogCQkJCQl9CiAKIAkJCQkJYWRldi0+cmVnX29mZnNldFtod19pcF1b
aXAtPm51bWJlcl9pbnN0YW5jZV0gPQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
