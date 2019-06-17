Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01E48EC7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051389991;
	Mon, 17 Jun 2019 19:27:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8089930
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:50 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m14so6935342qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t59OWAdlP26iiX2H7GGQuFrin9DdUSc2GzW/uic0Umc=;
 b=s6wm6QbKtROH0NjrtTRKnZnNV/Qz+lQ8piSnQNwvvSzSGeRAuVOnFCeqpA4LlXwRqh
 1nXfFGjZj/1bfjmfRQutKmW0mLhTN9OcWj2KnnLQqb9oGmaQrCM/np5XUJ3xLr/+Dqdd
 nksx6z+TA08awssP8YYWYlGS+FzZVo0yPuerjitOguvQJWNyIYbaSEJNhYcQbyTtqkfw
 xgSRk3wBVkxNgDxz0X3CmW4EaaPS6rjxp7ai2KNl0VW5bRwJZQSbX+PzcjR/FSMquuJf
 nvvgh3uck4L/Za+4t3mZH91EZWd3FKsUKPqvRBC5quHEecjlxTzFnJtGcV3LIAJNr++n
 YNJQ==
X-Gm-Message-State: APjAAAXIfeqzzslh8TT2RjLIMBSXQzwjXAE7cR/tHCStl6A3W68DxRS5
 vCn/5qVBrIn5yv5cHqDoJjYYfXLGaZo=
X-Google-Smtp-Source: APXvYqy4BQLfPcZL5VWu5JgtX+eoSnemQKiKsRC3+ezSAMd+dHxtIDVSWO2/StN0xlfiiz+UaYd5NQ==
X-Received: by 2002:a37:640f:: with SMTP id y15mr21719494qkb.79.1560799669524; 
 Mon, 17 Jun 2019 12:27:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 138/459] drm/amdkfd: add more navi10 pci ids
Date: Mon, 17 Jun 2019 14:26:03 -0500
Message-Id: <20190617192704.18038-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t59OWAdlP26iiX2H7GGQuFrin9DdUSc2GzW/uic0Umc=;
 b=o+gr4EhJd2vGAUt6mqQglZbXGJRZ2JTN1DN+Sph4oSqWF7VeuZ29MKj4LSj2+6OaG7
 TbuGLM/RIgWcqqGR5UGsA8vujedoRsCICIDP2fON02UEEOfhHguaz1ZUOpsNGDvJ69km
 fH1m5eM/9fFtatJ7cAgla1z7vssypv/8JyNLvyCoYRvqKBO60CU/HeCTQ3/ESwhsYYox
 0IkmEhrtQSmUf1KRD8GIjHsmKfWNKoQ3C5J1/ipz8y33QfvGwQB8hJBehT/utZCHQJlo
 +0yrOP5B59s4POHvztsdtiJ9EankE7mOviHklcP/aHv6GVrBj0nXqbzs6XyghwpmsC6Y
 9hpA==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDQgKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYwppbmRleCBjN2ZjMDExMjY0ZjAuLjI2ZWE0NmRlMzcyMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtNDU0LDYgKzQ1NCwxMCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRfZGV2aWNlc1tdID0gewogCXsgMHg2
NmFmLCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZlZ2EyMCAqLwogCS8qIE5hdmkxMCAqLwog
CXsgMHg3MzEwLCAmbmF2aTEwX2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLworCXsgMHg3MzEy
LCAmbmF2aTEwX2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLworCXsgMHg3MzE4LCAmbmF2aTEw
X2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLworCXsgMHg3MzFhLCAmbmF2aTEwX2RldmljZV9p
bmZvIH0sCS8qIE5hdmkxMCAqLworCXsgMHg3MzFmLCAmbmF2aTEwX2RldmljZV9pbmZvIH0sCS8q
IE5hdmkxMCAqLwogfTsKIAogc3RhdGljIGludCBrZmRfZ3R0X3NhX2luaXQoc3RydWN0IGtmZF9k
ZXYgKmtmZCwgdW5zaWduZWQgaW50IGJ1Zl9zaXplLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
