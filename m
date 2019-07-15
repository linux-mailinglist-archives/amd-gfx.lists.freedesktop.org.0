Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEA69E14
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F207A89E47;
	Mon, 15 Jul 2019 21:25:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFF589E52
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k10so17319543qtq.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LUiCTVDfwORpbWZS9gzRjFdOL+/sV0vJx8xy32sKOeM=;
 b=C0bx/Dxi971aCYMbM8p8ryieBFtONz2hcLOUJzI6ybQdU47f3G1msLR6AWlayt4xVj
 DnePCKMZPN0bhhay9iwdVhHCvryNpg8/OZg9CH+RZCRZNRw/d1wPzxbVKrCfBqeX46Qh
 joc+BUghcPLIw9xvr68TV39bBlM/WQ3Ig2zImC4nh5V5oORZZuooPTMcP+QXuagajYY6
 q2EGwHooryKW4hKyWl+Egzh4kTuKkMbxDYAXFzgYhzyP1i2gaUOrZ3i12KDCcgvsGnB4
 jgucNfKf0vFjaDA9G0fk3xVf1AAMfO+BxtbMLxZRNEWqvAi0TqAOC6dw4FqVRQ8bQl/R
 e21g==
X-Gm-Message-State: APjAAAWRtY+1vmhDu9tLxOvKdXNxuNpwDRLWyx9PCjrqicshon44n6KP
 LNn+zQRDM5KAQ4kmQA212Lypep4T
X-Google-Smtp-Source: APXvYqzYJR4RYqV4wNXIcGttGkiIA7Cr6ZUygZLxmc4Izp78ohLIz/q263XRdv0wBQMlZvCP4Vh6Ag==
X-Received: by 2002:ac8:6a17:: with SMTP id t23mr19315451qtr.183.1563225914160; 
 Mon, 15 Jul 2019 14:25:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 033/102] drm/amdgpu: skip load cp gfx firmware for Arcturus
Date: Mon, 15 Jul 2019 16:23:28 -0500
Message-Id: <20190715212437.31793-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LUiCTVDfwORpbWZS9gzRjFdOL+/sV0vJx8xy32sKOeM=;
 b=AChwfuRrIIhb1/wSWXpa9UBR+95zpBUKHliSyqcuQm3NYuxi3QrXT6ObwUQAJ1gD3b
 shUsDJOhhev8Y3XbiU0S85YH6KeG4QY83pqJjD1CSgvMMnbujCH/VVrlQ0h0IyT8XcHY
 MuFe4EoN4kPGrq5ellwUGSZb3kIak71g+l586UYbIIlGO5UvOULEV48NPA4VTyWgvXnM
 dlEB5MH7YoIJ99xt+cFvd4n0jErbpiUetLPk3jx2lgQg/lyHFKCPGUXIpPLMKc0erkXo
 oqf3FRDD/zgJa9D4ZhC+vSWfwRxCK7GjUhmtclfDqXcY0lly+KVllUvVUuPzdAD+0rj8
 bCrg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBcmN0dXJ1cyBoYXMgbm8gQ1BHIGNvbXBvbmVu
dCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGVkZDMyMjQ3MjBkZC4uMDY3NmFlMzhlYzFl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTk0MSw5ICs5NDEsMTIg
QEAgc3RhdGljIGludCBnZnhfdjlfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkJQlVHKCk7CiAJfQogCi0JciA9IGdmeF92OV8wX2luaXRfY3BfZ2Z4X21pY3Jv
Y29kZShhZGV2LCBjaGlwX25hbWUpOwotCWlmIChyKQotCQlyZXR1cm4gcjsKKwkvKiBObyBDUEcg
aW4gQXJjdHVydXMgKi8KKwlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHsK
KwkJciA9IGdmeF92OV8wX2luaXRfY3BfZ2Z4X21pY3JvY29kZShhZGV2LCBjaGlwX25hbWUpOwor
CQlpZiAocikKKwkJCXJldHVybiByOworCX0KIAogCXIgPSBnZnhfdjlfMF9pbml0X3JsY19taWNy
b2NvZGUoYWRldiwgY2hpcF9uYW1lKTsKIAlpZiAocikKQEAgLTMzMTksMTAgKzMzMjIsMTIgQEAg
c3RhdGljIGludCBnZnhfdjlfMF9jcF9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCWdmeF92OV8wX2VuYWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQoYWRldiwgZmFsc2UpOwogCiAJ
aWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSAhPSBBTURHUFVfRldfTE9BRF9QU1ApIHsKLQkJ
LyogbGVnYWN5IGZpcm13YXJlIGxvYWRpbmcgKi8KLQkJciA9IGdmeF92OV8wX2NwX2dmeF9sb2Fk
X21pY3JvY29kZShhZGV2KTsKLQkJaWYgKHIpCi0JCQlyZXR1cm4gcjsKKwkJaWYgKGFkZXYtPmFz
aWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKSB7CisJCQkvKiBsZWdhY3kgZmlybXdhcmUgbG9hZGlu
ZyAqLworCQkJciA9IGdmeF92OV8wX2NwX2dmeF9sb2FkX21pY3JvY29kZShhZGV2KTsKKwkJCWlm
IChyKQorCQkJCXJldHVybiByOworCQl9CiAKIAkJciA9IGdmeF92OV8wX2NwX2NvbXB1dGVfbG9h
ZF9taWNyb2NvZGUoYWRldik7CiAJCWlmIChyKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
