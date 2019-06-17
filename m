Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3452648ECB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB19D899AB;
	Mon, 17 Jun 2019 19:28:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7889996
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:58 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so12255290qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nHqad6GlNXzWx8/TNC50uPJSV7uE2fQas6XatiEaxtI=;
 b=GSdZVcmtsfc6Kjk4lRi+AIXzqfF/xTCZSqLX18HJ5dtaXMfKg1Hcny8L53gPYId4+c
 To6Ne01OHj5/KhmZjGPqREWbzAv3enxSPWhCP7z6vgcAMWs15mhWS1J+ngCA6vZr3ml5
 LeWebYDXenKo4GRyGMD5u1t8eLY4/zOGyveptEn/d197EZM1Wmpwsdztu8X9zf4dk0fB
 oN0Ffn1hvJkEHXmewL9025ZdG4UAvcMZ8b1b64Gc+2LVK8wAYYu4Me1Ev+nyKQwg97Jf
 2dljJGbht0pRglVI4Jcw8ErarlXN1ayd5DebLX65IVEOnMzNNPLIlcF7anrxzcRxjqbo
 kThg==
X-Gm-Message-State: APjAAAXMlDODzqOVb6w26d2COmpSVaUNKn2zgHEK7BbfhM5aUtjfyZcV
 +UsvJBCtid4I8pDfnSxbGvPhV3G1/cA=
X-Google-Smtp-Source: APXvYqw6bmDxjYDXGiDmK9i9V14yfzd9LXZqt8vUUbD5TfQZI6UJURGqtE8nDG1u9+z8sAW9mlzhIw==
X-Received: by 2002:a0c:87ec:: with SMTP id 41mr11415810qvk.196.1560799677399; 
 Mon, 17 Jun 2019 12:27:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 147/459] drm/amd/powerplay: move bootup value before read
 pptable from vbios
Date: Mon, 17 Jun 2019 14:26:12 -0500
Message-Id: <20190617192704.18038-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHqad6GlNXzWx8/TNC50uPJSV7uE2fQas6XatiEaxtI=;
 b=pARZVvEysCJgfGxw2LEZIcnBdIqtQttz08oBXNS1uPbrwLJBV0450hdOLY8l1nD/qF
 dldrhl211qzmBgar865GCtv+wvpiRwdToQmjgus5mgXi1ASfbF65+WUUdIb5jucAUkTj
 q84bmCehYAOZpOS2KtpbXi5VLEpPYEHN4hI8JP9BsAosw2ax05JWhWKRDB3jHhdzLAm+
 wMD4chCSrIf6271r7+8e/6LPvHuYMIaEjo+TJPMXN0xdVgpLlmY3Q9UhgX1q4Qq3whS9
 +iGdY3KvtyujljbRypCyiXFO9SE0PmBBxdsThozSqmfIgr+HsURG8yMXT1dHBJTIo/7i
 cq8g==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkluIG5hdmkxMCwgd2UgbmVlZCBy
ZWFkIHRoZSBwcF90YWJsZV9pZCBmcm9tIGJvb3R1cCB2YWx1ZSwgdGhlbiBkZWNpZGUgd2hldGhl
cgp1c2UgbG9hZCB0aGUgc29mdCBwcHRhYmxlLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxy
YXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
YyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBh
M2E2MDk5YWI4Y2QuLjg4ZmQ3OWQ1YWNhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYwpAQCAtNjI4LDEyICs2MjgsMTIgQEAgc3RhdGljIGludCBzbXVfc21j
X3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCXJldHVybiByZXQ7CiAK
IAlpZiAoaW5pdGlhbGl6ZSkgewotCQlyZXQgPSBzbXVfcmVhZF9wcHRhYmxlX2Zyb21fdmJpb3Mo
c211KTsKKwkJLyogZ2V0IGJvb3RfdmFsdWVzIGZyb20gdmJpb3MgdG8gc2V0IHJldmlzaW9uLCBn
ZnhjbGssIGFuZCBldGMuICovCisJCXJldCA9IHNtdV9nZXRfdmJpb3NfYm9vdHVwX3ZhbHVlcyhz
bXUpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAotCQkvKiBnZXQgYm9vdF92YWx1ZXMg
ZnJvbSB2YmlvcyB0byBzZXQgcmV2aXNpb24sIGdmeGNsaywgYW5kIGV0Yy4gKi8KLQkJcmV0ID0g
c211X2dldF92Ymlvc19ib290dXBfdmFsdWVzKHNtdSk7CisJCXJldCA9IHNtdV9yZWFkX3BwdGFi
bGVfZnJvbV92YmlvcyhzbXUpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
