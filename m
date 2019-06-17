Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4848E26
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BF88970E;
	Mon, 17 Jun 2019 19:18:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7343C89733
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so7222251qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KurzAjrSFIKXxjJfI6wDC2ySW20SXjYpyKmmLdat6o=;
 b=LeG4P8rhTricOPJsqFcNjt3tL4piywDh3BIlJ7xXs7WZ5abYQjwq4FqhVwzJfReDZh
 /XoNpcTr8gN9XN6aGDoDTvBftD1iUv071SJ52iol0zyI61w11fOoLecuW/BPXdaUZNvg
 83mLoJt6N/pHwyto8EJTnG9Rh/E6t21isdGaXlEw/NwaiD8eoG0O8Qn2Fh9x86gSha1D
 i/VOeqHXUP5fBx49BCzTegRyNL/8KLMniSVrnOauRtrKQWC/JDJ/HMrP+NjskOsiRVJm
 Xk5Mjp0Lzu4e3MWg2TCmujjsR99tDw0Vjm2Dznrgfr3ywDu+jx41zFoB6TtHQ9ONLuSS
 citg==
X-Gm-Message-State: APjAAAX7XNhKY8ZnQSecB6vY6H8Tmk92MEF4Xfb2O5vZzGPlADCqoUbo
 zzXQF3jIOEhjxv7Cz7hxPEsVPsalXlU=
X-Google-Smtp-Source: APXvYqyJYcy0hsdWhDH88dpH2xdHyGAg2VxyMlOU+VsVvG0fksJInpuOyjENPieKVYO7VhurkTF11Q==
X-Received: by 2002:a0c:b010:: with SMTP id k16mr23284529qvc.170.1560799121413; 
 Mon, 17 Jun 2019 12:18:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 105/459] drm/amdgpu/discovery: stop converting the units of
 base addresses
Date: Mon, 17 Jun 2019 14:11:06 -0500
Message-Id: <20190617191700.17899-94-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KurzAjrSFIKXxjJfI6wDC2ySW20SXjYpyKmmLdat6o=;
 b=rI62EGAjRTOlalqU9F2r6hUpMsNStTuBs9LvjXP1r++5geTQH5msbhoOPP9h1pVNoB
 jV5+2Qod7mL236pkC2Q/Rbg8Yps17o8bJUMLgLOC++C3NKWUAGeCB3gMO5aqnd0Hv4zb
 xIQM8eGPu88Swcs14LzL0Ahh2B5HDCe0wNymsgQ5Iyuwam2399LTIBD2tqsDxfDlnACm
 J2EtqtFu2NtvdfbcET7a3C+I4kaRIOeMcK0567sRjVrddRkeE68mx5OahGL+kTh2PEFJ
 kIdG22ClRE6BU0MT7akwolkG55Anajyg5R/Im8Ns1TteTsK5ES+0v5yoeDat6fFS66L7
 jx5A==
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
