Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753748F4D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADB989BF5;
	Mon, 17 Jun 2019 19:31:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089E089BA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p15so12254360qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNB5coCYRA+ABwnlRiKodd8wV681B4gSVgDdssUhyyY=;
 b=HusTLBRgNIIXlWTOnErS93tQsoUL5/T+bsJ3+td0XFHBEDPwyRKYGBPKrpCVqhc0qp
 XB0u5B9VHLNAWOrDdqY3z8KH3qYwk6MoOP4X9h22ZNTVX2k+/E3+jenbiULBwN5UqYr2
 vfmwCkr6U3NwUZhFm1ZJrsQbga2cDNQQYb6G1Yj4/1B10Azhf4MySBfq39SlhuyUbk1I
 EJumdgo3Abip2BAjFb/l2DK0m7bs1rPSoVfUoLF68ZcOr1vqo2t/G4R0i1F8DopXd907
 e6AbksDApq/MVBzPwoWJsyR6idtmLpVTsOZfdh0YO83skTjb3p4azB7ZwuFF2xROS65R
 JI1Q==
X-Gm-Message-State: APjAAAXm8+ep0Rh+qMM6OmEjLRcRM/aK+TdzeYH80Hzj5JlNCpKQQGEj
 s5yXlJD5eYBTOdQXEj55ne+BWvNV3XM=
X-Google-Smtp-Source: APXvYqwDQYT+p80TKt+GS/040m0UvVAvC+zd90UxiAlGx70Ij4Kr0XTyWk5XGmBYfSAlQycMNNn0sw==
X-Received: by 2002:ac8:2f96:: with SMTP id l22mr47256864qta.188.1560799889026; 
 Mon, 17 Jun 2019 12:31:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 217/459] drm/amdgpu/gfx10: drop redundant se/sh selection
Date: Mon, 17 Jun 2019 14:29:44 -0500
Message-Id: <20190617193106.18231-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNB5coCYRA+ABwnlRiKodd8wV681B4gSVgDdssUhyyY=;
 b=YyGftVJYjryuFBj5zVVDyMH1Oj2C1t6sclYxSNVYd8PSofdShTOuGSoIeOp2tFTBS9
 SoJc8m2zBngHl9zSkNQRJkbsezaNzHMLI3cllofuziJZB26RzMvGVwIlzcJKL6lSmYQE
 ISxsRClq32izTg+7qI2kmPN5GN24wTydhzNfLuRPcNGqrH+ttdVjIZij/LZVO8m0bcjK
 G+xndxlqZPtvF7WVkGCUcIKV2Utvw0ign7yIU/B2JXlC8fQ1GLtc8/Vpa3MQVh0vFiKU
 ohWVT2Z598nZSb3YwEBsGyIEPy2xZa8itLIjyprfDtbAED0ZYNRpEnaMcqWakZtXeZD+
 eESA==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCndlIGFscmVhZHkgc2Vs
ZWN0ZWQgc2Uvc2ggYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZm9yIGxvb3AKClNpZ25lZC1vZmYt
Ynk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNr
IFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCAwMTQ2OTdmNmJkMTAuLjYyODlkNzll
OGI2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE0NzEsNyAr
MTQ3MSw2IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF90Y3BfaGFydmVzdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJCQkJfQogCQkJCX0KIAotCQkJCWdmeF92MTBfMF9zZWxlY3Rfc2Vf
c2goYWRldiwgaSwgaiwgMHhmZmZmZmZmZik7CiAJCQkJdG1wID0gUlJFRzMyX1NPQzE1KEdDLDAs
IG1tVVRDTDFfVVRDTDBfSU5WUkVRX0RJU0FCTEUpOwogCQkJCS8qIG9ubHkgb3ZlcnJpZGUgVENQ
ICYgU1FDIGJpdHMgKi8KIAkJCQl0bXAgJj0gMHhmZmZmZmZmZiA8PCAoNCAqIG1heF93Z3BfcGVy
X3NoKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
