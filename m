Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495907E41C
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770636E7C1;
	Thu,  1 Aug 2019 20:30:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F476E7BD
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m14so27407548qka.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ThtOBJ1n49v19m3pMWfszz1x3ElsW0BA3n5mkQq9fA=;
 b=dX7ZIGomZ20/GAAU6Eu2Wq9A2g3EHJPg1WBbmkTDkYmE0Hz7A3CP/vfaBso4JyXp+6
 dLuziqyVxbHWiDk37piftLNYS4fmWTilIidv0VaOa9CYNGlfoQ/jJFsdIKpLFYec4isv
 PwIGZqqb09Ob9MWuIfo+UbFdsdE4E9BWh46HPu4fJUO9rDsz983KgOOXlARZfhoFZ6B1
 tak89Omu8J6FSe1Yv9jHmhxN1WeT3R00VJL0YzrZ8RwdlZg17YEGOq8mzf11ZAtNS/sa
 l0XefCQBJAlLz4Sijn7R/wdu7L4JfkRzdEJ3Tw7SNDCFmJv/xaM1U4nGTbZfe+EDVt6n
 xO1Q==
X-Gm-Message-State: APjAAAUHG0Zm1tFRhSlYoM1nXXuWkJbZHP4O/0Jk33Uf6pQfS3B3Lz0+
 CR4b7FZWhflQSIKjVa0QO7vO3n5j
X-Google-Smtp-Source: APXvYqySSibGY3qUxUSifBrZgOBSsiXDCib3bZAjwuGcFYKBGMyq41phSP6aqUmfWjufToOGDqqgKg==
X-Received: by 2002:a37:a013:: with SMTP id j19mr90354518qke.401.1564691409308; 
 Thu, 01 Aug 2019 13:30:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/36] drm/amdgpu: add gpu_info firmware for navi12
Date: Thu,  1 Aug 2019 15:29:25 -0500
Message-Id: <20190801202957.29791-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ThtOBJ1n49v19m3pMWfszz1x3ElsW0BA3n5mkQq9fA=;
 b=e2/vXNAQRkoclRimYE508GWX7sB63bT8n8r8lDFnEmhKHP36JP3aj13ZcwKNTvktrZ
 sqoiD/tDi0wuB9+Y1PKmhHiTfDl5BEBUO5+KFZswXCiYs6tEJ0Vz5HjzJ7KtiBuN8do7
 6ppYOvXKRkHHFcINZtcWJGwoT3uNroTQhabAe1F9mC5rdG7GJq9z7fKPiQ6YnDKKqXpS
 8gdenqtgV98bxxvGVfxeYzu/lEn8MGxV9D8KjVQzU/5vlmeGAWdx2APH8Q4527TTJX/9
 zr8s30pgUkULuKaEc6ndknHgk6cQQdisat4+3mP5pMWKqsE+bPMxtePlUVI+D470YB2f
 uynA==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmdwdV9pbmZvIGZpcm1h
cmUgc3RvcmUgYXNpYyBjb25maWd1cmF0aW9uIGRldGFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBYaWFv
amllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDQ3NDgz
ZDAzY2NkNi4uMzdiYjQyMTg5OWYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCkBAIC03Miw2ICs3Miw3IEBAIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jh
dmVuMl9ncHVfaW5mby5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVzX2dw
dV9pbmZvLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX2dwdV9pbmZvLmJp
biIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X2dwdV9pbmZvLmJpbiIpOworTU9E
VUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEyX2dwdV9pbmZvLmJpbiIpOwogCiAjZGVmaW5lIEFN
REdQVV9SRVNVTUVfTVMJCTIwMDAKIApAQCAtMTQ2OCw2ICsxNDY5LDkgQEAgc3RhdGljIGludCBh
bWRncHVfZGV2aWNlX3BhcnNlX2dwdV9pbmZvX2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOwogCQlicmVhazsK
KwljYXNlIENISVBfTkFWSTEyOgorCQljaGlwX25hbWUgPSAibmF2aTEyIjsKKwkJYnJlYWs7CiAJ
fQogCiAJc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX2dwdV9p
bmZvLmJpbiIsIGNoaXBfbmFtZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
