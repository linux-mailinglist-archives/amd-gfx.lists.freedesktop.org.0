Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC948ECA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E29899A5;
	Mon, 17 Jun 2019 19:28:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7B38997A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s22so6927120qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/23a4bRX1NXQwo/cLSwg5KIJSLKddWY75/yx6PuNSI=;
 b=e9TFCDJHzyxddrac+1432icE9DLNnFvyYsZ78deID4l5rU7RuOi7dHu7nKJc6guKf+
 Eaf/B2RjW5uIbEb8/d26jQo3mJ/4HL4Phz3G/+ZYYBovolRTm+2XtguWwj5rOpAv2WnW
 y0HRhLSzFfsdz2soYHJQmtZR4xOeM8xsjLSX1JAY1WJIsP+3mQ2N2rMCW4T6T1Onl5A3
 COntVwqkzHe8WndEnoi8cLrf0dyagNm8NOhcoCl4S/NJbo0NrXekLKXDKLWAkzCV7S3B
 IBERBKcQ78z47+wpUoi5iGzruQ5N0RIdIDj3gkUWvji70Lfkzhr0w1RGNQWfKutboI9T
 +2hw==
X-Gm-Message-State: APjAAAWOl8lWHWXYPaj1iQsxzxMIN6eK2ePNyWEPh2+IErQDzxzc85q2
 CEZPUJMS4mKOxID0hFX/7u6Cs1qfeU0=
X-Google-Smtp-Source: APXvYqzSFSQq+gL2RLwuoE9RP1ZuY6t7j5tqdjJ2q8gE6mPi5YeCvc/UYiXwKni0BdaAc53H2E98/A==
X-Received: by 2002:a37:8a81:: with SMTP id m123mr6912194qkd.360.1560799676483; 
 Mon, 17 Jun 2019 12:27:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 146/459] drm/amd/powerplay: add navi10 smc ucode init and
 navi10 ppt functions setting
Date: Mon, 17 Jun 2019 14:26:11 -0500
Message-Id: <20190617192704.18038-47-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/23a4bRX1NXQwo/cLSwg5KIJSLKddWY75/yx6PuNSI=;
 b=W0hBzWuhb+C1vB6Az8RljCHi3HHL4+tsNRFWR23U6FQwR5V+hpa2Oohis0J62RtKPd
 QL4k38RBFd1nkV8GEV+jKX5rrsl48rB90GNq9zZjKeUIKliRiprxeFfZwu0QYtGRYJ94
 gKNuCSqV/n+YrU9Uo/6/yhbotCWTAOiwq1Od1iwRX5Buz+O43BSojFpMbDr0AsYGtK5x
 4EiwfJ73+6ZFA7s+e1M0QjWSQD98Ook2UDu2mxxkBUuck9W+gc29vBq72jqGpQlYtehI
 bi5R9HgrhLPSgX6tg9bXjdFo4o87RrGyJdGftGOq+MNSIDWsK0ggsXutXnvb1cT70oga
 hsOQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyBuYXZp
MTAgc21jIHVjb2RlIGluaXQgYW5kIHBwdCBmdW5jdGlvbnMgc2V0dGluZy4KClNpZ25lZC1vZmYt
Ynk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpo
YW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggMjY2
NDQxNjhkNThjLi40ZGNiZjZlZTdlOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jCkBAIC0zMSw2ICszMSw3IEBACiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgi
CiAjaW5jbHVkZSAiYXRvbS5oIgogI2luY2x1ZGUgInZlZ2EyMF9wcHQuaCIKKyNpbmNsdWRlICJu
YXZpMTBfcHB0LmgiCiAjaW5jbHVkZSAicHBfdGhlcm1hbC5oIgogCiAjaW5jbHVkZSAiYXNpY19y
ZWcvdGhtL3RobV8xMV8wXzJfb2Zmc2V0LmgiCkBAIC0xNjUsNiArMTY2LDkgQEAgc3RhdGljIGlu
dCBzbXVfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJY2Fz
ZSBDSElQX1ZFR0EyMDoKIAkJY2hpcF9uYW1lID0gInZlZ2EyMCI7CiAJCWJyZWFrOworCWNhc2Ug
Q0hJUF9OQVZJMTA6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTAiOworCQlicmVhazsKIAlkZWZhdWx0
OgogCQlCVUcoKTsKIAl9CkBAIC0yMDk2LDYgKzIxMDAsOSBAQCB2b2lkIHNtdV92MTFfMF9zZXRf
c211X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJ
CXZlZ2EyMF9zZXRfcHB0X2Z1bmNzKHNtdSk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTA6
CisJCW5hdmkxMF9zZXRfcHB0X2Z1bmNzKHNtdSk7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXBy
X3dhcm4oIlVua25vd24gYXNpYyBmb3Igc211MTFcbiIpOwogCX0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
