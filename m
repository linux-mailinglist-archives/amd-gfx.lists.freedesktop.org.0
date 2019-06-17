Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E907348DD4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4260F892FE;
	Mon, 17 Jun 2019 19:17:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77E892D5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12163821qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J+cqkE2vAvJ2wUC74W5sncHeEcvrDlYQNVs8k9cdSvA=;
 b=QqY2jhtU0fIfqc4kn2EQwkYx/ODqreWPIpOu6FCV1A7BPV04O2Sizm5/vZYpx7UUu0
 pYzXK4XKnqypMyUKcwEU2TMjimsB+C8GpoF6EY+70YtL83Z+qr2PdCVUOV3mjL+F/84Q
 J64ygK/PmcaY1i6yuCVq7mh1SnOs+CFllyYz4ib2K0r9z01o1MVcGxafuYriHQh2yswx
 2hAEKPXad1lKKgdP0/tcupHdumrd/E4EEhJ3yIblprNPQJJcwQfkdDV2tWLQ/Z7hw4gT
 KwuRhwkPTJHzMxnUDKBbTsyRLC3yCriVZv6OxFQz+OyC9+PoI5rDWl88xwAO42BrS7TV
 AB8w==
X-Gm-Message-State: APjAAAUGJKwh/htBfhyKZpC2oHcfAa8by5XZl9DQGe1iTyZwZppkvYfT
 fJY8Kwuv8shR7Cx3myK4tapsx3zUdQY=
X-Google-Smtp-Source: APXvYqzzTLigukF9sXqCKYKBu1QyxdguGZBUt0UDOWd++yxPjtfjlr5+4DsgocRUrnscJijzaTWSOQ==
X-Received: by 2002:ac8:33f4:: with SMTP id d49mr81714089qtb.23.1560799043736; 
 Mon, 17 Jun 2019 12:17:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 022/459] drm/amdgpu: add navi10 gpu info firmware
Date: Mon, 17 Jun 2019 14:09:43 -0500
Message-Id: <20190617191700.17899-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+cqkE2vAvJ2wUC74W5sncHeEcvrDlYQNVs8k9cdSvA=;
 b=vDzdTkx+GNhl9E601xZW5sKQ/ifa0vZWEx9ZDtbaqresj8nv2fshB3uSvY4GRElB+R
 ZEsRovp+0Guq/GHZ65xxD9khq9Vonqlf9G3Pv/XCIaQFeQdS7XdV8AmKFNR9Mu7KrWFs
 KyM4mr+0ckny51WM+fITj3UGtlv+D3ZmJahs2RinzJh4bnaaUxZQVgGToZIE3h4TXSMT
 wq+mYAXA98g1LD7ub6lPcixAfy8pLZnWFXk0ECn9gLW7alJqEVG8MfpkEVPsHs4TMZPm
 OBYWI5Ie1jzfjSOQcFyxfcgRebmx7n/AhjzgR6KesD++FKH1oLYYCGJGGWP3ZfecOAqB
 UZFA==
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
aWNlLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggM2ZmNjhiZDJiMDE4Li4w
MGE2Njg4MTdjYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKQEAgLTY3LDYgKzY3LDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvdmVnYTEyX2dwdV9p
bmZvLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5fZ3B1X2luZm8uYmluIik7
CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9waWNhc3NvX2dwdV9pbmZvLmJpbiIpOwogTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX2dwdV9pbmZvLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvbmF2aTEwX2dwdV9pbmZvLmJpbiIpOwogCiAjZGVmaW5lIEFNREdQVV9SRVNVTUVf
TVMJCTIwMDAKIApAQCAtMTM3Nyw2ICsxMzc4LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNl
X3BhcnNlX2dwdV9pbmZvX2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQllbHNlCiAJ
CQljaGlwX25hbWUgPSAicmF2ZW4iOwogCQlicmVhazsKKwljYXNlIENISVBfTkFWSTEwOgorCQlj
aGlwX25hbWUgPSAibmF2aTEwIjsKKwkJYnJlYWs7CiAJfQogCiAJc25wcmludGYoZndfbmFtZSwg
c2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX2dwdV9pbmZvLmJpbiIsIGNoaXBfbmFtZSk7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
