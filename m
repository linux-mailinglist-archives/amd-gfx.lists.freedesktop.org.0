Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD754F082
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 23:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6756E929;
	Fri, 21 Jun 2019 21:33:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9546E929
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 21:33:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so8471079qto.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 14:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86gCN9nI7ccoJ4sdF6iN0uBwuNkPgaB9hyB1khFn0OU=;
 b=omCJtYb/L3C1vJzKZd8Ahh3yUGs9BkJMS0/oqsx+B+x+CslLCKSlCGftqqdR4yILuu
 0GU6LNq77iBfDYukRBYlM3x+lx+LTWgN+G0cKk9cTR2S4g4B8sOSQR6Ovzw0Ryt6GEJ4
 45J8r230j7qkL8veeUO8ZIcIhiRJ16p9LTEwT+naXJna5aLeYjV4tY+gBkW2dJ2M7+oB
 Pw5N9OMMXuGNTmB7fy6vw4gk4HSQ2RG1rZC4S7brcl/ieP5vcYxVuoX+6/feExaS49N/
 Y2T+fCf+KQi0vLQ0MF3a/u+74PBomHnnmicPsA4Nf+b7Cudqt5T9a/h5CUbgWu5Vkk86
 dQew==
X-Gm-Message-State: APjAAAURj1mGfNkjYxKp3x2g8KG17LZJfow2dR18DJ8c7uaknoFvZ16I
 tI6upoc1EjkR3/kqL8B4C+NU155lc6I=
X-Google-Smtp-Source: APXvYqy4IoSmsbG1OgOhSXdry6TnwpWjsDUy7eOMDRvKiNqgF/aFeaWZv+G7yNUlT+NwvC0/4QSm5Q==
X-Received: by 2002:a0c:df8a:: with SMTP id w10mr35765761qvl.140.1561152807659; 
 Fri, 21 Jun 2019 14:33:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id m6sm1953772qte.17.2019.06.21.14.33.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 14:33:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: drop unused df init callback
Date: Fri, 21 Jun 2019 16:33:20 -0500
Message-Id: <20190621213320.31205-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86gCN9nI7ccoJ4sdF6iN0uBwuNkPgaB9hyB1khFn0OU=;
 b=iwzhuBUOAFmOs7LQyE/Oid5aMwAj0AgVBkjmOZaofQ6RWCQntwdY7xTT3xKvtMnIYQ
 fRS448tzn61kENXhpj9oxyLD21BtlQUy4O8uDmUBSIBKxPCX4nHSr48ekoM4j6DHl+jl
 CaozNPoyGiYLdY5IbT902x2bG1O8z/jDnOz0/Z1pT14i5st93+2odQ9Yo8VKAJ7i63Gm
 F6EI8Y75LPs2Hz3zpBmMCUsUTeJ4rADTc1mzRCHznCObeGMmRibYWOuKQfYFWsxlfq1k
 KTGuBKCBKTyne6fOTTgfFcmT1QG9ntqhCBOGM80i+9b1EV/cuFD3144AWhmapvQUVXJS
 zEGQ==
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

SXQgd2FzIHJlcGxhY2VkIHdpdGggdGhlIHN3X2luaXQgY2FsbGJhY2sgc28gaXMgbm8gbG9uZ2Vy
Cm5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDEgLQog
MSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCmluZGV4IDcxMThjYTIxYWE0ZS4uODk2YTRiYzYwMDQwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaApAQCAtNjg3LDcgKzY4Nyw2IEBAIHN0cnVjdCBhbWRncHVfbmJpb19mdW5j
cyB7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzIHsKLQl2b2lkICgqaW5pdCkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCXZvaWQgKCpzd19pbml0KShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldik7CiAJdm9pZCAoKmVuYWJsZV9icm9hZGNhc3RfbW9kZSkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJCQkJICAgICAgYm9vbCBlbmFibGUpOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
