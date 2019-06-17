Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E248DDD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF97D89309;
	Mon, 17 Jun 2019 19:17:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93E1892EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so12125946qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N54eLjXyRsawpCZ7RlRSLR2aFlzebLctAPVlSyxcfVQ=;
 b=DYLyM2r8wDGpfQc68wV7o4VVLHIxIcC/vsPF0mu3ZLDDIg8Mtwjvt8gKWR1oUYbGZ7
 bWDKvA+ubDKFQmzbKAhaUTTUYiupKtsPo/OVEIlLu6gIpVl2bZ8PEi1AaAtejvCba6Zm
 iepWWJ9jTetQkcjx+/CV9P2E5egr8SpJ+nYDFzTPGAMkLO7fbdfbSPTdcmDn5jBqhw/j
 OoxKpzi7eA4NYIwCwlZdWTO/fKkb7cdEu/wHZZ0aELXMYVZ7H3dDmzwcXqHibvd0Jzx0
 u+M3b0/u1nmgc0SHfzVL3blqsiN0cquoU0ot7u72MxkbyQqQSyXT1rfTUir9ent7e4ue
 Tw5Q==
X-Gm-Message-State: APjAAAW2K1JWpRzyrFyPDYApBpHp7YBlmggVWLsuuv8bBywQpSCoiaZV
 yX/ree0OMcebfns0P/3PqQXNdLExr3c=
X-Google-Smtp-Source: APXvYqxkmeBK7k8/yN7K1wAGHIqdLcInjuN9tLZqkLIstFg0XipC43QrARUnchUL5oeof+A3ezuThg==
X-Received: by 2002:ac8:929:: with SMTP id t38mr7001341qth.287.1560799057680; 
 Mon, 17 Jun 2019 12:17:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 034/459] drm/amdgpu/gfx10: new approach to load ce fw (v4)
Date: Mon, 17 Jun 2019 14:09:55 -0500
Message-Id: <20190617191700.17899-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N54eLjXyRsawpCZ7RlRSLR2aFlzebLctAPVlSyxcfVQ=;
 b=Zz4tZYZlCTA9wrCwfXae0Em6+HmizHakdEJwUXRcLRQJwDOrNqI9fjA/GcTci8sSJ6
 3I+kyn5erSsnY6nNZurnsx2MFD3Ao2ICEkgLz7sPKMafOLj1Z8k8lTc292oHTK/o/LFa
 G+1xQi+1e8X+Tss7md1TSULxn2vGI8SQT37nKQqSr55R3xm5WCfk9YygmzPo02z8uO1J
 XwQgQ7Q7jE/EV+obQ8TBnpUB33WWP2nZ9HhCmWi/MUNewRx0aYhjEwf1F6Sdi29LPNJi
 wFgBCYgQiC5XYaNWaFtmdgVzZaxh95dphsdGBfRQVZgafdznF49EAgDy8qD80rkw46dj
 Zafg==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKZ2Z4MTAgYWxsb3dz
IHRvIG9ubHkgdXBsb2FkIGNlIGp1bXB0YWJsZSB3aGlsZSBzYXZlIHRoZSB3aG9sZQpjZSBpbWFn
ZSBhdCBndHQgbWVtb3J5LgoKdjI6IHByb2dyYW0gQ1BfQ0VfSUNfQkFTRV9DTlRMIHRvIGRlZmF1
bHQgdmFsdWUKdjM6IHN3aXRjaCB0byB1c2UgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCB0byBj
cmVhdGUgY2UgZncgYm8KdjQ6IHNwbGl0IGNvbW1vbiBjb2RlIGZyb20gZ2Z4MTAgY29kZQoKU2ln
bmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpBY2tlZC1ieTog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZh
bi5xdWFuQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4Lmgg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggNTc0NTUwZTllOWU4Li44NWNiMGUwNzU1
YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTIwMSwxMSAr
MjAxLDE4IEBAIHN0cnVjdCBhbWRncHVfcGZwIHsKIAl1aW50MzJfdAkJCSpwZnBfZndfcHRyOwog
fTsKIAorc3RydWN0IGFtZGdwdV9jZSB7CisJc3RydWN0IGFtZGdwdV9ibwkJKmNlX2Z3X29iajsK
Kwl1aW50NjRfdAkJCWNlX2Z3X2dwdV9hZGRyOworCXVpbnQzMl90CQkJKmNlX2Z3X3B0cjsKK307
CisKIHN0cnVjdCBhbWRncHVfZ2Z4IHsKIAlzdHJ1Y3QgbXV0ZXgJCQlncHVfY2xvY2tfbXV0ZXg7
CiAJc3RydWN0IGFtZGdwdV9nZnhfY29uZmlnCWNvbmZpZzsKIAlzdHJ1Y3QgYW1kZ3B1X3JsYwkJ
cmxjOwogCXN0cnVjdCBhbWRncHVfcGZwCQlwZnA7CisJc3RydWN0IGFtZGdwdV9jZQkJY2U7CiAJ
c3RydWN0IGFtZGdwdV9tZWMJCW1lYzsKIAlzdHJ1Y3QgYW1kZ3B1X2tpcQkJa2lxOwogCXN0cnVj
dCBhbWRncHVfc2NyYXRjaAkJc2NyYXRjaDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
