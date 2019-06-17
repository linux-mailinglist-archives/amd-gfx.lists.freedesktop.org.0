Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C548DFF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5826D894DE;
	Mon, 17 Jun 2019 19:18:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4F2894E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:08 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so6929504qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kXWGY9tQSqybdcn/8yjy5MTKohug5tsyFJgnzmdELUU=;
 b=JHQARyuqd99196YcGQq3Qn3e7u/MTiPMg6NzIba8qzAB0To3HidbXVJh8DqNXTCsVC
 p1vsJfkzA4t7YTG6ZHLD/Pp0QWDtdC27WVNDiPqhq1d8XQofCGw+0WkBs0IsU2thuzWC
 96sBYPImCG1S0XSdPYPErXJs+8C0SGWuym/V3vOCoOYXvkfrXcyjuAo4K+meN/5h7EEA
 tOQ2LdzjWqtZhLP6E0lMwfBo0FGL5cpvGl8SY4JcU5CRscb4sYnKB+9lSPeXRz4WVAZE
 tSRt3B5o4cC+VVxO99EWUQ/Sb0ynZTeStavR2NGF+6Usimg9IiKTm2R3YIjFRbYAtj7z
 pQ3g==
X-Gm-Message-State: APjAAAU0X47SvcZfgC8q0fiaJajRLxzTEyh5TkcGR3G+VcOeAaeWCDoK
 N4MjZUikFLlbkVsdee9lByN0BA2az1c=
X-Google-Smtp-Source: APXvYqwy9jzAKiqH/6tA7LTVVZpM/mJKj5NkaU4v73yklnEMsBliZdHD04Z6hfj9I2wV2p7VM8nUZg==
X-Received: by 2002:a37:9042:: with SMTP id s63mr11073586qkd.344.1560799087150; 
 Mon, 17 Jun 2019 12:18:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 066/459] drm/amdgpu: add structure to support build-in toc to
 psp sos
Date: Mon, 17 Jun 2019 14:10:27 -0500
Message-Id: <20190617191700.17899-55-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kXWGY9tQSqybdcn/8yjy5MTKohug5tsyFJgnzmdELUU=;
 b=h+bCODdb0vgHWv5nkOOTEqbFf5AAos7CNFzedkQ8FhsjUUWEV8hpwseJwdHuKZZGTv
 OtlQZ6g8b3xomApjDNs0panVFXz7H+JCVRgUlc1rgV3odwa5dbcowdORXKVdZ3Hh5EAu
 gPU4vm+5OtnFUNw/hs2DG8QWpqe9qbcNIa1anL8pn1tKHKjwD78wSVBAnpbBuK8P1b8B
 zBFCU7avPRF4B2JFaCkSa4Q3SSdB2g7b7Yxn+A96IFaRnetbYCzys7WIidqLr55skwW/
 jr4Yo3Nxw0Ses15NSB2jFTUCK8tA+2c/1tPvJ+RcYCh07tDgK31gYXpRAE12tOC7SK9o
 PUOw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGFibGUgT2YgQ29u
dGVudCAoVE9DKSBpcyB1c2VkIGJ5IFJMQyB0byBhdXRvIGxvYWQgZ2MgZmlybXdhcmVzLgpQU1Ag
bmVlZCB0byBwYXJzZSB0aGUgdG9jIHRvIGNhbGN1bGF0ZSB0aGUgdG1yIHNpemUgbmVlZGVkIGFu
ZApsb2FkIGdjIGZpcm13YXJlcyB0byB0bXIgZm9yIFJMQyB0byBhdXRvIGxvYWQgdGhlbSBmaW5h
bGx5CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Vjb2RlLmggfCA5ICsrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCmluZGV4IGNm
NDk1MzliMGIwNy4uOWNjNzQxODAwNjgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5oCkBAIC0xNTQsOCArMTU0LDEwIEBAIHN0cnVjdCBwc3BfY29udGV4dAogCXVpbnQz
Ml90CQkJc29zX2ZlYXR1cmVfdmVyc2lvbjsKIAl1aW50MzJfdAkJCXN5c19iaW5fc2l6ZTsKIAl1
aW50MzJfdAkJCXNvc19iaW5fc2l6ZTsKKwl1aW50MzJfdAkJCXRvY19iaW5fc2l6ZTsKIAl1aW50
OF90CQkJCSpzeXNfc3RhcnRfYWRkcjsKIAl1aW50OF90CQkJCSpzb3Nfc3RhcnRfYWRkcjsKKwl1
aW50OF90CQkJCSp0b2Nfc3RhcnRfYWRkcgogCiAJLyogdG1yIGJ1ZmZlciAqLwogCXN0cnVjdCBh
bWRncHVfYm8JCSp0bXJfYm87CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdWNvZGUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29k
ZS5oCmluZGV4IDc3ZWM2ODc4N2MzZS4uYTMxYjFiZDFmNzIyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaApAQCAtNTcsNiArNTcsMTQgQEAgc3RydWN0IHBzcF9m
aXJtd2FyZV9oZWFkZXJfdjFfMCB7CiAJdWludDMyX3Qgc29zX3NpemVfYnl0ZXM7CiB9OwogCisv
KiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25fbWlub3I9MSAqLworc3RydWN0IHBzcF9maXJtd2Fy
ZV9oZWFkZXJfdjFfMSB7CisJc3RydWN0IHBzcF9maXJtd2FyZV9oZWFkZXJfdjFfMCB2MV8wOwor
CXVpbnQzMl90IHRvY19oZWFkZXJfdmVyc2lvbjsKKwl1aW50MzJfdCB0b2Nfb2Zmc2V0X2J5dGVz
OworCXVpbnQzMl90IHRvY19zaXplX2J5dGVzOworfTsKKwogLyogdmVyc2lvbl9tYWpvcj0xLCB2
ZXJzaW9uX21pbm9yPTAgKi8KIHN0cnVjdCB0YV9maXJtd2FyZV9oZWFkZXJfdjFfMCB7CiAJc3Ry
dWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgaGVhZGVyOwpAQCAtMTg3LDYgKzE5NSw3IEBAIHVu
aW9uIGFtZGdwdV9maXJtd2FyZV9oZWFkZXIgewogCXN0cnVjdCBtY19maXJtd2FyZV9oZWFkZXJf
djFfMCBtYzsKIAlzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92MV8wIHNtYzsKIAlzdHJ1Y3Qg
cHNwX2Zpcm13YXJlX2hlYWRlcl92MV8wIHBzcDsKKwlzdHJ1Y3QgcHNwX2Zpcm13YXJlX2hlYWRl
cl92MV8xIHBzcF92MV8xOwogCXN0cnVjdCB0YV9maXJtd2FyZV9oZWFkZXJfdjFfMCB0YTsKIAlz
dHJ1Y3QgZ2Z4X2Zpcm13YXJlX2hlYWRlcl92MV8wIGdmeDsKIAlzdHJ1Y3QgcmxjX2Zpcm13YXJl
X2hlYWRlcl92MV8wIHJsYzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
