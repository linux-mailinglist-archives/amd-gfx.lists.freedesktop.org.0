Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B448DC6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3FE892B0;
	Mon, 17 Jun 2019 19:17:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88A2892B0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so12205133qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8e4Mvtx7l6dbmIU02XcMy4TPHfLF1NtJ60YPHiUovY=;
 b=HXY6CKcMde+VHWmkQkod5wFY3z/rrkgbZYTAbbqupprgTWMA1i9UIO5dlOEG10ylyC
 K1WJSVFj2qBhTKj1Xl3HA3CbNSH32g+/L0Cz5TF+pOyxNBJJuwkEFOBJWjkCvgJFFCj3
 CCYrL4pZikXCogP/npNNtFiNhzW0itqleYYxngYtsFOKtRr+0uCJpBtNkg6V1bv+CXMt
 98HZwECscTpe1wZpQhQROM31PhPZceblZul8QErxPeOIJ575aHb4xLqELINFkPSn+zFU
 3dpXxQlaZz9HRpvE0UdHsvnWZOxWeJ23aeTgmeVawsE3vmW3c9d7WPn2Eyj6fAvhELVs
 DmhA==
X-Gm-Message-State: APjAAAW/9Ne7ijN2C6pw8hAlDnGJkf1Gtny9kFmXhdfreTsQkzdx/oXA
 zgp5bX+CyuumjqjvmrZT68OX3+T6ORc=
X-Google-Smtp-Source: APXvYqxntZ3qV366MwuPJILMmKsmQV+jJ+pXJTLNFVGuvsrPB5YcVJE0R6xN9r+/fF8sp9uuBotKFQ==
X-Received: by 2002:ac8:7549:: with SMTP id b9mr16899560qtr.198.1560799038691; 
 Mon, 17 Jun 2019 12:17:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 016/459] drm/amdgpu: add navi10 asic type
Date: Mon, 17 Jun 2019 14:09:37 -0500
Message-Id: <20190617191700.17899-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8e4Mvtx7l6dbmIU02XcMy4TPHfLF1NtJ60YPHiUovY=;
 b=WiYac0wJZBKrKDGmZL6BwjVYlWGCu9xv9Wz9iup7Ux7Qr9XiLXUruIz8Kuc3r5RCEQ
 kg5iuBtllVvGCB1oBNkGL2HQLSEK66KvpF4wVHPVlYT7sOHNQBA6l6bVwFESJ/PvYwRW
 NFOrYMm0bCnRMFlVgjWYmoPAhBRWp0+MazQNt11m5vuV2nVpq3lJJ/+mQ9reTD7QvL8V
 1B7ug0wZam79rL6fuCHrFyhjHYAksoCl/7YSa3T2eZ6jLi5ctAdAPyVq5VjQUruUvpc8
 x73INT8zkRDSskkNlKOZw/SvJvRqJD1qeMPTUTmprK37veraenCNJ4ZHdGDeCeUPr4tQ
 y5HQ==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCAxICsKIGluY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCAgICAgICAgICAgICAgICB8
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZTI2MzAzYmM1NjdlLi4zZmY2OGJkMmIw
MTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTk0
LDYgKzk0LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmFtZGdwdV9hc2ljX25hbWVbXSA9IHsKIAki
VkVHQTEyIiwKIAkiVkVHQTIwIiwKIAkiUkFWRU4iLAorCSJOQVZJMTAiLAogCSJMQVNUIiwKIH07
CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCBiL2luY2x1ZGUvZHJt
L2FtZF9hc2ljX3R5cGUuaAppbmRleCBkZDYzZDA4Y2M1NGUuLmJjYzJiY2YzMjg4NiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vYW1kX2FzaWNfdHlwZS5oCisrKyBiL2luY2x1ZGUvZHJtL2FtZF9h
c2ljX3R5cGUuaApAQCAtNDksNiArNDksNyBAQCBlbnVtIGFtZF9hc2ljX3R5cGUgewogCUNISVBf
VkVHQTEyLAogCUNISVBfVkVHQTIwLAogCUNISVBfUkFWRU4sCisJQ0hJUF9OQVZJMTAsCiAJQ0hJ
UF9MQVNULAogfTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
