Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F349061
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE496E05A;
	Mon, 17 Jun 2019 19:50:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6F86E053
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:18 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so6984563qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgAj5SK8FFIjmj9tEV5+K750PyM/R+txuCmG7fW1QAs=;
 b=aM1q5mlPYq/ma4mypdFOSB62ey5Nr0AM6RNH7ZhdzSr6MAesGfDaTq7EsE3DxPvStj
 W6cDg1nq5gJNcCBZ4+tXBD56j/rlRWsKyOV3bxhLKL15HSdeAFmEJqCoy66w1f3r0TdX
 wJzZXvKgdsyMcKg9/GF312PS3kKEmZuPhDNVOztujm8M5/7yfPj3UrsGtXkTK7wkdUBN
 a9oNdVWefpsWREFuB53TC5in2IgYXr4LRrHzSc85w9lOTJ+l8YuDJZsusqWYMS6Jdz90
 uhesetgy3FLLSbU5iJ+mJ0VqyOT2nOnRAcTVU1pc5z1PtHWWRL7HU6D1kiYaFKVMgAeL
 dHMQ==
X-Gm-Message-State: APjAAAWNTKDqZK86m9XUPBMNq2bZgVuvhpbn08qma7Gb58kRgAVEmKz4
 nfcaGgyH3ABHCAD/y2SoL86g3QIDxmjpOA==
X-Google-Smtp-Source: APXvYqyv1QX34S1FB86/lb2VPcM9IAH/fyqoSYO/5PD9/ZO1Q0Jn6vs8MOPKZJKv0cShVaaHfR3/pw==
X-Received: by 2002:a37:6112:: with SMTP id v18mr24269445qkb.126.1560801017976; 
 Mon, 17 Jun 2019 12:50:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 421/459] drm/amd/display: fix a potential issue in DSC logic
Date: Mon, 17 Jun 2019 14:49:10 -0500
Message-Id: <20190617194948.18667-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgAj5SK8FFIjmj9tEV5+K750PyM/R+txuCmG7fW1QAs=;
 b=p7DpwpmeevFGQgcyWN8qK9YoWvQVL+aZTnTNw/uni1Mt2VXx/zCi++pMTZoIY0yUEE
 H10tmlUi1ZXAZO935EG86w79tUjwqnPKx3k3KYpW+++Y6aAbo3l/+TIN1S8ipgi8qG8R
 qOVGqGPOZnZKJmgcryiNNpf59LPsvAd2IyCalrJSpEoCVN5NYZnTm0M4LH86FjjQXGAK
 ORWT0qedyMRUPsMqnL1Zwg+lxbzAUPXl9HPeSGf8llW5w/Uk780RRhknKEL0klMHCS9b
 sW/I262F1Hzh2hcBb1MdsGOQYK9BGXZEptGmpEZ5EaNcBqcu9OUwTe7IBWSA787SXZPr
 y3Mw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpJbiBjb21wdXRl
IGRzYyBiYW5kd2lkdGggcmFuZ2UgdGhlcmUgaXMgYW4gdW5pbml0aWFsaXplZCB2YXJpYWJsZQoK
W2hvd10KSW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgdG8gdGhlIGNvcnJlY3QgdmFsdWUuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IE5pa29sYSBDb3JuaWogPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYyB8IDE0ICsrKysrKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYwppbmRleCA5NGE2MjNkYzM3ZjQuLjI1MmMz
ZDBhMjU1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9k
Y19kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5j
CkBAIC04MjYsMTAgKzgyNiwxNiBAQCBib29sIGRjX2RzY19jb21wdXRlX2JhbmR3aWR0aF9yYW5n
ZSgKIAlzdHJ1Y3QgZGNfZHNjX2NvbmZpZyBjb25maWc7CiAKIAlnZXRfZHNjX2VuY19jYXBzKGRj
LCAmZHNjX2VuY19jYXBzLCB0aW1pbmctPnBpeF9jbGtfMTAwaHopOwotCWlzX2RzY19wb3NzaWJs
ZSA9IHNldHVwX2RzY19jb25maWcoZHNjX3NpbmtfY2FwcywKLQkJCSZkc2NfZW5jX2NhcHMsCi0J
CQkwLAotCQkJdGltaW5nLCAmY29uZmlnKTsKKworCWlzX2RzY19wb3NzaWJsZSA9IGludGVyc2Vj
dF9kc2NfY2Fwcyhkc2Nfc2lua19jYXBzLCAmZHNjX2VuY19jYXBzLAorCQkJdGltaW5nLT5waXhl
bF9lbmNvZGluZywgJmRzY19jb21tb25fY2Fwcyk7CisKKwlpZiAoaXNfZHNjX3Bvc3NpYmxlKQor
CQlpc19kc2NfcG9zc2libGUgPSBzZXR1cF9kc2NfY29uZmlnKGRzY19zaW5rX2NhcHMsCisJCQkJ
JmRzY19lbmNfY2FwcywKKwkJCQkwLAorCQkJCXRpbWluZywgJmNvbmZpZyk7CisKIAlpZiAoaXNf
ZHNjX3Bvc3NpYmxlKQogCQlnZXRfZHNjX2JhbmR3aWR0aF9yYW5nZShtaW5fYnBwLCBtYXhfYnBw
LCAmZHNjX2NvbW1vbl9jYXBzLCB0aW1pbmcsIHJhbmdlKTsKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
