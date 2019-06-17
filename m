Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1848E10
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24651895E2;
	Mon, 17 Jun 2019 19:18:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F781895B2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l128so6941768qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwapLISu+kvXHQlei+CrjE1EkFeqiUZRpogdVNsbK2c=;
 b=ETZz0IvYBdoMt1yrQfpucIrppSn/0P+EgkMGbba4V7ceCNsMP2petWGlXpuW5O1DT4
 GnXaqObQZlxB5juVbNPS6Kz0Zsc6sWqtvgkBBFm+6VO7SLbVgTbHS6KO1PNUCsXgg+mf
 aQhcY2ROa6I8L4Y+yp7hdEnS/xnbQKGqTV1qvB7UZ48AifB3pjgYUPWIBEvMNfdOi3rm
 7FxaflV3ggyNM1N4xgAnEvz2HT+2VZjPRza3oEUgP3ISH6ZCiCBN/4idYyhy10x6k9qO
 AaAT74XsL6vPBGIRlaD8nndeJ4xM7j2hNSWdGiHXY3WrxqUEapU4o3gNbuaTW3lNI9LM
 H4Uw==
X-Gm-Message-State: APjAAAV2aLVXV/SW0NIzJa1sjAN2c3qBGLrpVa5tZHCGfCooNd+is3Gy
 gBN/JwGRtnMm0mSIYVoX1E56y134opA=
X-Google-Smtp-Source: APXvYqwGpXOLYAt7U15TJ6j9/NaoY6izSxOyA8b49W69DOrrisNio95+5Z+ugIsFzb+ZIpOatCscBA==
X-Received: by 2002:a37:624c:: with SMTP id w73mr387289qkb.139.1560799098673; 
 Mon, 17 Jun 2019 12:18:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 079/459] drm/amdgpu/psp: initialize autoload_supported flag in
 psp_sw_init
Date: Mon, 17 Jun 2019 14:10:40 -0500
Message-Id: <20190617191700.17899-68-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwapLISu+kvXHQlei+CrjE1EkFeqiUZRpogdVNsbK2c=;
 b=tGy1EXuAtJ0gseIs5UEXS/U2fWFXIDZnFRa5zqxgxMalpGqNvkk+niffypi6N6tD1P
 SNLsHzDqZX9Xb3RZ+0WDjE2Ya0Uaax/YIDK+G9o0CiNTcC7gIFSEYxatNEuws6sPqjc+
 BuSkeSAfw97PkvrGeE45Q2U6vlXHFN1R1yYEL7+eIpF6TdCMpNqhVoW6V4GUxl/CPXRw
 MX2a0wcagJFEmVD4k6ycGCOENr+XTgWoSNRD6q6mJ+MF+OuWwd0/KoiLDcdILs+KGfsF
 k5yk1eCJy+wlShuKsgSuUAV2axsJP5F+N9PlPLjMfPxLOvKxNC6ShmbpUXYP9OrRw7Kd
 gBzw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKUkxDIGF1dG9sb2Fk
IGlzIHN1cHBvcnRlZCBzaW5jZSBmcm9tIE5hdmkxMAoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9A
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5NYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMK
aW5kZXggMjk3YjFlMWUzZTQ5Li5mNGU0ZDdiOTE4YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKQEAgLTQ2LDEzICs0NiwxOSBAQCBzdGF0aWMgaW50IHBzcF9lYXJs
eV9pbml0KHZvaWQgKmhhbmRsZSkKIAljYXNlIENISVBfVkVHQTEwOgogCWNhc2UgQ0hJUF9WRUdB
MTI6CiAJCXBzcF92M18xX3NldF9wc3BfZnVuY3MocHNwKTsKKwkJcHNwLT5hdXRvbG9hZF9zdXBw
b3J0ZWQgPSBmYWxzZTsKIAkJYnJlYWs7CiAJY2FzZSBDSElQX1JBVkVOOgogCQlwc3BfdjEwXzBf
c2V0X3BzcF9mdW5jcyhwc3ApOworCQlwc3AtPmF1dG9sb2FkX3N1cHBvcnRlZCA9IGZhbHNlOwog
CQlicmVhazsKIAljYXNlIENISVBfVkVHQTIwOgorCQlwc3BfdjExXzBfc2V0X3BzcF9mdW5jcyhw
c3ApOworCQlwc3AtPmF1dG9sb2FkX3N1cHBvcnRlZCA9IGZhbHNlOworCQlicmVhazsKIAljYXNl
IENISVBfTkFWSTEwOgogCQlwc3BfdjExXzBfc2V0X3BzcF9mdW5jcyhwc3ApOworCQlwc3AtPmF1
dG9sb2FkX3N1cHBvcnRlZCA9IHRydWU7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAt
RUlOVkFMOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
