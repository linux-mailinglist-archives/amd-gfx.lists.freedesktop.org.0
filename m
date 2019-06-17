Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC448DD7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2A78931F;
	Mon, 17 Jun 2019 19:17:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BA389308
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12164457qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3xAbegsCDHs5JoFwIF8QD1WiaMrSX9rfZXn5hbmFHY=;
 b=G0ZBYIsq13rG8N+BBfLpvsaKSIyRGo4lPmdnTSnC8tRKz9RrVc+8Ze9YjDh33VpIf+
 iKo162LhCC5/T9+I5A0OTKzMIUF0crHP1GDa9ePzXsdmtuqEvMX6uiVWsjvrBR5omS4r
 F6ummMR9sbJbaNUgwA5ZpF0FT0hWmm/fGu9w4NnujoC/7V2yxCmfFYPwBHU19NjmSv4T
 2HC7Nxm2QJRXQ1tmC/NZ0FE9RQL+UT03m60eXjjvlAMXH3EBJMdyBHV6gvvYgCPrs7sU
 5SYoioAyW19ti4dZm8FvxpInPhNY4k+SObFfzM9V/kAhJwO9rT4AF3xq5Wwr4juTxKFk
 aBkw==
X-Gm-Message-State: APjAAAVvigEEq3Wid6EjdFiU30qH4C0DzrdnHywhpBNl+ElvzBFcpeFz
 5DM9MbADJ9Oy22wKSW/CURERiDJa0WA=
X-Google-Smtp-Source: APXvYqznMrnu9YdgdYUXYsNh5D5mP1jk/kNaRce9G8t0dMVoTlWwT3WodQo0aligqU8I/Nq4MPkaOw==
X-Received: by 2002:a0c:b659:: with SMTP id q25mr22292560qvf.29.1560799052722; 
 Mon, 17 Jun 2019 12:17:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 029/459] drm/amdgpu: query vram type from atomfirmware
 vram_info
Date: Mon, 17 Jun 2019 14:09:50 -0500
Message-Id: <20190617191700.17899-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r3xAbegsCDHs5JoFwIF8QD1WiaMrSX9rfZXn5hbmFHY=;
 b=Go8ZvqHSswaTlnEOmzjK3cZZ75ZISfJfA4LCLy9ETv5XpYWwm7Gl/DhpSxd/qc5dRY
 c1iErqAw8amPLJnjTbKOSZaxqOggYNmlt2bYCyBA42Z1rjQLM/MsKln6xra1A0wTRQog
 VWgerUs30fLXv+R5qHtmbLHw8+iQaAw2P4ZdSLZXU00in8y65dFxd4BKyUXMjxL9vrRy
 1r9nubwRIRaLZLbtJz4fEW35HNvHUnJr9H3FOVuGmXCT2CQApCyihP8Mq2tyVqvJCfds
 A05ujNJceDSUdnfjkYDWok4+9zVV5ZJRIohzwLfZLBlArZdjRZz5L19Hn5VZssiQiFU/
 CWdg==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdnJhbV90eXBlIGlz
IHNhdmVkIGluIG1lbWJlciB2cmFtX21vZHVsZVswXS5tZW1vcnlfdHlwZQoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hdG9tZmlybXdhcmUuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
dG9tZmlybXdhcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tZmly
bXdhcmUuYwppbmRleCBmOTZkNzVjNmUwOTkuLjQxMDExOGRmMTZlZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21maXJtd2FyZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tZmlybXdhcmUuYwpAQCAtMTE4LDYgKzEx
OCw3IEBAIHVuaW9uIHVtY19pbmZvIHsKIAogdW5pb24gdnJhbV9pbmZvIHsKIAlzdHJ1Y3QgYXRv
bV92cmFtX2luZm9faGVhZGVyX3YyXzMgdjIzOworCXN0cnVjdCBhdG9tX3ZyYW1faW5mb19oZWFk
ZXJfdjJfNCB2MjQ7CiB9OwogLyoKICAqIFJldHVybiB2cmFtIHdpZHRoIGZyb20gaW50ZWdyYXRl
ZCBzeXN0ZW0gaW5mbyB0YWJsZSwgaWYgYXZhaWxhYmxlLApAQCAtMTc5LDYgKzE4MCw5IEBAIHN0
YXRpYyBpbnQgY29udmVydF9hdG9tX21lbV90eXBlX3RvX3ZyYW1fdHlwZSAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJCWNhc2UgQVRPTV9ER1BVX1ZSQU1fVFlQRV9IQk0yOgogCQkJdnJh
bV90eXBlID0gQU1ER1BVX1ZSQU1fVFlQRV9IQk07CiAJCQlicmVhazsKKwkJY2FzZSBBVE9NX0RH
UFVfVlJBTV9UWVBFX0dERFI2OgorCQkJdnJhbV90eXBlID0gQU1ER1BVX1ZSQU1fVFlQRV9HRERS
NjsKKwkJCWJyZWFrOwogCQlkZWZhdWx0OgogCQkJdnJhbV90eXBlID0gQU1ER1BVX1ZSQU1fVFlQ
RV9VTktOT1dOOwogCQkJYnJlYWs7CkBAIC0yMjcsNiArMjMxLDkgQEAgaW50IGFtZGdwdV9hdG9t
ZmlybXdhcmVfZ2V0X3ZyYW1fdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWNh
c2UgMzoKIAkJCQltZW1fdHlwZSA9IHZyYW1faW5mby0+djIzLnZyYW1fbW9kdWxlWzBdLm1lbW9y
eV90eXBlOwogCQkJCXJldHVybiBjb252ZXJ0X2F0b21fbWVtX3R5cGVfdG9fdnJhbV90eXBlKGFk
ZXYsIG1lbV90eXBlKTsKKwkJCWNhc2UgNDoKKwkJCQltZW1fdHlwZSA9IHZyYW1faW5mby0+djI0
LnZyYW1fbW9kdWxlWzBdLm1lbW9yeV90eXBlOworCQkJCXJldHVybiBjb252ZXJ0X2F0b21fbWVt
X3R5cGVfdG9fdnJhbV90eXBlKGFkZXYsIG1lbV90eXBlKTsKIAkJCWRlZmF1bHQ6CiAJCQkJcmV0
dXJuIDA7CiAJCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
