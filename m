Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8648EA9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0C898BC;
	Mon, 17 Jun 2019 19:27:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D94898B7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:32 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so6965859qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=717wBZciT0f2XZXGVxl0XWrzLATVQfXWJ9E+YngUmVY=;
 b=d/fXobUc3K7qloAG/JwXVI/s5v1KViPv6UnG5A3k8a1nRavkR0W8LJt2i8A9UbAgI+
 JopdGtLXO6jcS11JH5vR5kACJn9yEl6n9egCbg7L+TXaHORMyv2yfrPu8H9mOCG4uDpJ
 q3IyLtgQVVodWB46AJue2PzKRK1Usjklo6Lc8LgWVtwvIdT94hZoBPQV5X/dsPAYOxau
 wfh0DklS4ls9BxLAzmdzRn470osAhYfLM/L/IsPrQZPGZ4HDun1bmjOiNvtmFcf4Md3c
 HvK04XoHv9D5OKiCvgM12Xd9VyAabSqEojrrtERcyMUSs39OVMKeWdhBQjPDfH3XrcnZ
 ChtA==
X-Gm-Message-State: APjAAAXo4gUWPzkJx8xnC+cwC5eXU0VZPPeCD5noJV9Rp+TRgtcBvaMB
 qNmzadPvzeypsLSaSU1+3XW4xGf6yaA=
X-Google-Smtp-Source: APXvYqyIw2rLU8SR/Cbh+7W86st1lpBBmD/MSZLpXWchsK8MLVpBsQNYUYVHPwMwfYfZOfOrYD4LSw==
X-Received: by 2002:a37:f50f:: with SMTP id l15mr72885451qkk.343.1560799651629; 
 Mon, 17 Jun 2019 12:27:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 121/459] drm/amdgpu/mes: enable mes on navi10 and later asic
Date: Mon, 17 Jun 2019 14:25:46 -0500
Message-Id: <20190617192704.18038-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=717wBZciT0f2XZXGVxl0XWrzLATVQfXWJ9E+YngUmVY=;
 b=qRr2tl7qJ2YpdMw4/KsfUL9+VFne+YquyNgFEuVC2Oypme1keGql/7lV46NOOvw7Vt
 0kJkScWRqj7dgoy3QfzQfGBtAK0ZWHUPPGwWaxYN6F4KqqvjwsUMZnnXlAIE/hRtAfFt
 C6mtjTD7hSV7Jt76VzgALea9EGkux96ukxNennZvll3OZzkcfg9xnOyoRmkIbfa62xuK
 Pc+Fs0wwKjCIq8u6on+emA61+qZX6wXE0uIz+FTRNVuY4LbkhhY/VFqsT5ULDcgibZuh
 b4Ph7IMsIcxlZZClV4S1M0ujUxggfOOXMBjURfivTu7XYjjvp3Cjetc1slKuEXaKxDhV
 V8Uw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCldoZW4gYW1kZ3B1X21lcyBpcyBl
bmFibGVkIGFuZCBhc2ljIGZhbWlseSBpcyBuYXZpMTAgYW5kCmxhdGVyIGFzaWMsIGVuYWJsZSBt
ZXMgcGVyIGRldmljZS4KCkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwppbmRleCBmYWNmNmFlNzkwNDAuLjE4MmRjODM0ZjdiNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMjU3Nyw2ICsyNTc3LDkg
QEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlp
ZiAoYW1kZ3B1X21jYnApCiAJCURSTV9JTkZPKCJNQ0JQIGlzIGVuYWJsZWRcbiIpOwogCisJaWYg
KGFtZGdwdV9tZXMgJiYgYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwKQorCQlhZGV2LT5l
bmFibGVfbWVzID0gdHJ1ZTsKKwogCWlmIChhbWRncHVfZGlzY292ZXJ5KSB7CiAJCXIgPSBhbWRn
cHVfZGlzY292ZXJ5X2luaXQoYWRldik7CiAJCWlmIChyKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
