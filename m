Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA448DC8
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99560892B8;
	Mon, 17 Jun 2019 19:17:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB64892B1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so12211142qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rCNCWVnVvJ4GVv8r20B0Olz5h8EOzO8dvZOV0i7qMI=;
 b=PYXIxeV6GGwKoVHaDP/UYkDSkdGKYZxYsAnGDgi7W6vj4uGuagPiu/tuQNrVSSHxQ0
 gcbhTu1oVw5lX5OolRxQ2K9yNY0k4qZ3tFU9YntI/r/lFTtNZ47qkU4jcijVdgwKCtSp
 u5MnuOCmUMIlD7xPQ9rOIGp+opocyj2CxKcgQwp/QEti0OjwU9Yt55TDstVin2ZujBWU
 nYw0JkOM2gJHExCpmchLHN6VozrJwEZOvItpXQtt8DUNTwnVzIY/RmBdySnm39FF+uVs
 Z5D8TiJENTp/PHoqHLJr7yWNb/EWQrGLC6Tg7dMfA7c8GKjCK9lydpmn6qmT0zUz2wzj
 m41w==
X-Gm-Message-State: APjAAAUUYi6t0RfhB20/RBvxg2tUzQbYxrojG+THwaaxdciuMz0JSDe+
 sE35GaTa0J8pXuMorIKScBZ8XsMk834=
X-Google-Smtp-Source: APXvYqx1Y2qjw0iOGCtT2D0vhfAioWxphD4Qo+/xAkdOAknBzlQGF2gXXZvc5eOOiXmn41jXLgHu5A==
X-Received: by 2002:a0c:91ef:: with SMTP id r44mr4610685qvr.113.1560799039493; 
 Mon, 17 Jun 2019 12:17:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 017/459] drm/amdgpu: add NV series gpu family id
Date: Mon, 17 Jun 2019 14:09:38 -0500
Message-Id: <20190617191700.17899-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rCNCWVnVvJ4GVv8r20B0Olz5h8EOzO8dvZOV0i7qMI=;
 b=PaPCApj/FbLabZ/0McSBu1i9M4Nj6PI8uwUVjZyBsGdjkeXZJFmDt3zEVxGXgJv3dE
 JySe3wi1h6KMe9tXlwCe11tx51EGv4Qvj+asXy8smk3+1BX7ycBQdE8HRBVAR7yTIbSx
 8KV2PKzI2+jTnrWBLP550dmBxwLsiTw/MVNZ507yaDhyTd92DAPSvgVnRgJbhOrHAC+Y
 X7EC1TQJHGaPkr3MtkHJ9LaEm4H+mTmLr3w7unHuA0VnJDW0Aj6q3f/rCm0lXciTeEps
 oFM0PnlctEtTDtzej7IDT5n0mSVEnT8rFNWrGwlTP2IbMfOPopXS9WKIlH9t0CCZ01x4
 fl5Q==
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
dWNoZXJAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRleCA4
M2E5NmY1ZmY3YTIuLjBmNWVjY2JkNTJiYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9h
bWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTEwNDcs
NiArMTA0Nyw3IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm9fdmNlX2Nsb2NrX3RhYmxlIHsKICNk
ZWZpbmUgQU1ER1BVX0ZBTUlMWV9DWgkJCTEzNSAvKiBDYXJyaXpvLCBTdG9uZXkgKi8KICNkZWZp
bmUgQU1ER1BVX0ZBTUlMWV9BSQkJCTE0MSAvKiBWZWdhMTAgKi8KICNkZWZpbmUgQU1ER1BVX0ZB
TUlMWV9SVgkJCTE0MiAvKiBSYXZlbiAqLworI2RlZmluZSBBTURHUFVfRkFNSUxZX05WCQkJMTQz
IC8qIE5hdmkxMCAqLwogCiAvKgogICogRGVmaW5pdGlvbiBvZiBmcmVlIHN5bmMgZW50ZXIgYW5k
IGV4aXQgc2lnbmFscwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
