Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867348F62
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94889C56;
	Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073B089C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w17so5830048qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29hczki7lPh2t1pULg/zN2Bdr2a3QORHCvNvxZ2kwIE=;
 b=QUczrZ8asYmJcRZjHwvskzLF9mgfCx3y/fEjL1Fv6HBvcQ76h1cxHobqdAOlEPCZmE
 GTpFXCZSF2axxzTmXzNxXaAUnprGduMrr3oA4KAOf55jNvb1APZha3s6RzW23CqFQCJD
 Tsa+fLC8fXt5/9zsOdKJEHkXjWfdm0ez9oh8RrkT9WDPZEG4hT0W9fEuQ5z/Wy+Uvuxn
 gSf2+47bqt3+2jAH+vHMglP78e/SvtMwOb0LCQpcJY9pUcQQyc4sLN7XAIXBx6Ppl4UD
 DqwW4DEfysqinvkAiZPN5T3pWcGbDQrEiKrc57drrvjfU2ebp5rYrWQqXxyijFO42Ei1
 iSmw==
X-Gm-Message-State: APjAAAUktXm3Y4unxquG3N3yGKA54brGH4A2ITbOJ1eN1d364QpFX7qV
 4XWlDDTOYIz7ec6sl18qeqw6/x6T+ok=
X-Google-Smtp-Source: APXvYqxTJVAtjsgWeIkusK2S/e9nB0z0Yq7m6wLNRTKvz1bQDaXdR80ZdvL4R4a7pm1O9VrSCwHagQ==
X-Received: by 2002:a0c:b084:: with SMTP id o4mr23312109qvc.227.1560799907762; 
 Mon, 17 Jun 2019 12:31:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 238/459] drm/amd/powerplay: add funciton force_dpm_limit for
 navi10
Date: Mon, 17 Jun 2019 14:30:05 -0500
Message-Id: <20190617193106.18231-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29hczki7lPh2t1pULg/zN2Bdr2a3QORHCvNvxZ2kwIE=;
 b=Uajfw5lDTapj2nniTNWZzw6uCkaFZDgAzxEU8UfghhECLX7x9zlx8CwZPr9p/0Cnve
 O+flVKKharL4mFSD2CoSBHe2D3hrZPiZP6mfybOx0nb2sfMZqBACSQ9vugLiybvuXGkk
 a258dnHHlTXVx9fEXW+13Uwgaa08Bvl23eGk2wkDYBHltSDGIj0cRBvT4RhvwBb1EQss
 yhMqPJnZ1QNDnBFc2vHYf2rEIf575RaVmjy0EGM/zRcjToyKJf118NUtCNGpWQUu4oiZ
 YRHUX7ZXhiaaV0SGw1C4/1Ey32Xra5Hiiv4gieolcTcQhXQ7yaL7EcurTUdQNYrc/wde
 Fu7A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBmb3JjZV9kcG1fbGltaXQgZm9yIG5hdmkxMCBhc2ljCgpTaWduZWQtb2ZmLWJ5OiBLZXZp
biBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmlu
ZGV4IDdlN2UwYTYwNGFlZi4uNzJiNmRlODNlNjZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC02OTUsNiArNjk1LDM0IEBAIHN0YXRpYyBpbnQgbmF2
aTEwX2Rpc3BsYXlfY29uZmlnX2NoYW5nZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAly
ZXR1cm4gcmV0OwogfQorCitzdGF0aWMgaW50IG5hdmkxMF9mb3JjZV9kcG1fbGltaXRfdmFsdWUo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgaGlnaGVzdCkKK3sKKwlpbnQgcmV0ID0gMCwg
aSA9IDA7CisJdWludDMyX3QgbWluX2ZyZXEsIG1heF9mcmVxLCBmb3JjZV9mcmVxOworCWVudW0g
c211X2Nsa190eXBlIGNsa190eXBlOworCisJZW51bSBzbXVfY2xrX3R5cGUgY2xrc1tdID0gewor
CQlTTVVfR0ZYQ0xLLAorCQlTTVVfTUNMSywKKwkJU01VX1NPQ0NMSywKKwl9OworCisJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUoY2xrcyk7IGkrKykgeworCQljbGtfdHlwZSA9IGNsa3NbaV07
CisJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBjbGtfdHlwZSwgJm1pbl9mcmVx
LCAmbWF4X2ZyZXEpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQlmb3JjZV9mcmVx
ID0gaGlnaGVzdCA/IG1heF9mcmVxIDogbWluX2ZyZXE7CisJCXJldCA9IHNtdV9zZXRfc29mdF9m
cmVxX3JhbmdlKHNtdSwgY2xrX3R5cGUsIGZvcmNlX2ZyZXEsIGZvcmNlX2ZyZXEpOworCQlpZiAo
cmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkudGFibGVzX2lu
aXQgPSBuYXZpMTBfdGFibGVzX2luaXQsCiAJLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2aTEwX2Fs
bG9jYXRlX2RwbV9jb250ZXh0LApAQCAtNzE2LDYgKzc0NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5nZXRfY2xvY2tfYnlfdHlw
ZV93aXRoX2xhdGVuY3kgPSBuYXZpMTBfZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5LAog
CS5wcmVfZGlzcGxheV9jb25maWdfY2hhbmdlZCA9IG5hdmkxMF9wcmVfZGlzcGxheV9jb25maWdf
Y2hhbmdlZCwKIAkuZGlzcGxheV9jb25maWdfY2hhbmdlZCA9IG5hdmkxMF9kaXNwbGF5X2NvbmZp
Z19jaGFuZ2VkLAorCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUgPSBuYXZpMTBfZm9yY2VfZHBtX2xp
bWl0X3ZhbHVlLAogfTsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
