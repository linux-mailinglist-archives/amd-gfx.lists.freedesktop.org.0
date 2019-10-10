Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6649D2DAA
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C54F6EB6E;
	Thu, 10 Oct 2019 15:26:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6556EB71
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:34 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m61so9265328qte.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUMFytj8IZ5eLEILNWsbBXcRKJGNJ+rkfsaXKakzu/E=;
 b=FizAyyW1LXffn/3Xh0xxjJlnu1rGLVMRAep0bbcqqf8D2ZCTwtdJL0aKhl1tgFRiQU
 nHP9WrNmntLFCtPpOk5sgme0aHr0zOJKVXStxVMHNwZJGG/GTmnxvybW7HJ2i2moK5q0
 pUqKHnKVRCOpYgM3qO2EtL1xgmHDD2+NQebOZk6fn9lkWUtULyHVkCrYb0jc9rpd/8Df
 aKVy/EEIpgnG13+3R8OV7+x0l1QFMz0Iv2ZU4U1dh7jFK0UuWNDhQWiz/ftpJIDdl70k
 dNnocZw7d37tG+t6ayOsXIpQGA7Ck8AG9ZoLjxSzuunN8Olj2dZe3tiGN35bSdU3T8RL
 9kng==
X-Gm-Message-State: APjAAAUwELqwvOQoIvcU1z5yrS1vuBKZmEsTiUa7han5ooCeUO6k/IkF
 7LxpUmqLxkJ4VXdalJrG8F/tbwbM
X-Google-Smtp-Source: APXvYqyqOFFTDDLprotQd9A/eiiqmdzMPxJPMBnh4myz4CHOrHMViVri8GXA+1zdHJ0JuQldFFbKZQ==
X-Received: by 2002:ac8:363b:: with SMTP id m56mr11267587qtb.22.1570721193140; 
 Thu, 10 Oct 2019 08:26:33 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] Misc runpm and baco fixes
Date: Thu, 10 Oct 2019 10:26:14 -0500
Message-Id: <20191010152619.31011-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUMFytj8IZ5eLEILNWsbBXcRKJGNJ+rkfsaXKakzu/E=;
 b=gl/fj3KPkTw7rS8JtJhSP2IzJAH3brM2cKsPnELQRUlxHs9bVn9qxE9/gzX1j8sNbf
 xZoQ06UoHCt9h3NPewi/AU4B/Bd7LSxIeikMGC6ZOD6FKpgGQExeIBG3a1avvCcyq79m
 bBsfziQBPaVQrCOkISWrV8dSmyr+x8zvRU1M5FdBRAvIUEgLPcLTMLGeRaafGtmmzMjF
 uqX9dUUJJwS5Lh3eATdjfb4Lo/7d1gvziT0lMbiV5tTPRup4AF+WveTjwbbqmKvVylPl
 y5rQvo4cSrzaDIS6v+Xg3b1AFpxYuBH1kX3W8/2g0x9LxDpAe5ThCPbg/nSnk54Paabt
 xSDg==
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

V2hpbGUgY2xlYW5pbmcgdXAgdGhlIHJ1bnRpbWUgcG0gY29kZSBpbiBhbWRncHUsCkkgY2FtZSBh
Y3Jvc3MgYSBmZXcgdGhpbmdzLiAgVGhlc2UgcGF0Y2hlcyBmaXgKdGhlbSB1cC4gIFBsZWFzZSBy
ZXZpZXchCgpBbGV4IERldWNoZXIgKDUpOgogIGRybS9hbWRncHU6IG1vdmUgcGNpX3NhdmVfc3Rh
dGUgaW50byBzdXNwZW5kIHBhdGgKICBkcm0vYW1kZ3B1OiBtb3ZlIGdwdSByZXNldCBvdXQgb2Yg
YW1kZ3B1X2RldmljZV9zdXNwZW5kCiAgZHJtL2FtZGdwdTogc2ltcGxpZnkgQVRQWCBkZXRlY3Rp
b24KICBkcm0vYW1kZ3B1OiByZW1vdmUgaW5fYmFjb19yZXNldCBoYWNrCiAgZHJtL2FtZGdwdS9z
b2MxNTogYWRkIHN1cHBvcnQgZm9yIGJhY28gcmVzZXQgd2l0aCBzd1NNVQoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAyIC0KIC4uLi9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5jICB8IDEyICstLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAgNiArLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICB8ICA3ICsrLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgICAgIHwgNTMgKysrKysrKysrKysrLS0tLS0tLQog
Li4uL2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jICAgIHwgIDQgKy0KIDYg
ZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
