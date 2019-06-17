Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6348E15
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5BF89622;
	Mon, 17 Jun 2019 19:18:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD038961E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:26 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x2so12219363qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Bef2PijNOKj/zO655I8rq3L2/lEzu5StvidqboPik8=;
 b=ToLt+zFsSeGo3r/sr/D55RlHFpMhO6Ys251doi5MnCNmx92XEqi9lYiXnx3+VjxoKi
 4kwSvIyuQzesgQwyWEilxq8aIyaspFrAwp/InN4UsOfURAV3x3j996s2Hu3kUI42RVT/
 o3clEFZCRpygYcxhrfX1M0pSm5ZZ1ID61tt6msuaAueP1W7JmvOP2b6JqoacVw+XhhGB
 K6abn+7Jffk8G9YEOr+0dE8MOWYxJFG/KRaqX1r6JePdi+Uc7HExWiQZ6kWpI3XJvLox
 LjJ+miqy5lhFVX4i7SDPADSJ06vDSsYjPE6+8rH3BZkV/YRgLvxNgMLggJvQWZYCOJht
 q8vw==
X-Gm-Message-State: APjAAAUJYFFXYroVbxu+QPzJDLKecqudqrz/PHegSI9yYZ4To1D/ylb4
 n+gFEUCkwMvei6EyYgDhY+DrQnE9IxQ=
X-Google-Smtp-Source: APXvYqxZlSUPWQs48iHoPiG656FvI40FEbJIIcmWHgmFj8TzyJ86rHLEKDHVIZEc9cFY4lxMB5k3mg==
X-Received: by 2002:ac8:2bf1:: with SMTP id n46mr42235390qtn.372.1560799104651; 
 Mon, 17 Jun 2019 12:18:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 086/459] drm/amdgpu: enable virtual display feature for navi10
Date: Mon, 17 Jun 2019 14:10:47 -0500
Message-Id: <20190617191700.17899-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Bef2PijNOKj/zO655I8rq3L2/lEzu5StvidqboPik8=;
 b=ZLDv51ip0a8D97U5dqAoJIgT25bfc8JV9zmEE0v7HNDwkKy/OaS/P/y5NDc0iv8A/b
 OOEEdhwVIPXZt6+stZAU9FbwazbfLk0oOd8VEbQ4f/IXAqzksjudyWoMJlXv8IitKWLl
 9owKyXOcU0klP9Qs7P8wG/WgyzqQKtaR1e6hy/SaW33tLeXxTY5m4K5QHGGsPZRI9Uid
 QbQgvkdL0bUubdjQCKfQnGg0gWyLhiizdEOyfZr5xfE92iZLJ5q1wDIQ03kGlzymb4e4
 TiLYqD0KwPv51ATr1Auc01359r23ukpWOTcyGyslqJ7I2Nl1qAK2azFSN+u1Syn4cRhy
 HvhA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Le.Ma" <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIkxlLk1hIiA8TGUuTWFAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IExlLk1hIDxMZS5N
YUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2RjZV92aXJ0dWFsLmMKaW5kZXggZTRjYzFkNDhlYWFiLi44YmU0ZTRmYWNhOGUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwpAQCAtNDU1LDYgKzQ1NSw3IEBAIHN0
YXRpYyBpbnQgZGNlX3ZpcnR1YWxfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZF
R0ExMDoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CisJY2FzZSBDSElQ
X05BVkkxMDoKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJRFJNX0VSUk9SKCJWaXJ0dWFsIGRpc3Bs
YXkgdW5zdXBwb3J0ZWQgQVNJQyB0eXBlOiAweCVYXG4iLCBhZGV2LT5hc2ljX3R5cGUpOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
