Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4C48EEE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A97089AB9;
	Mon, 17 Jun 2019 19:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A78A89AA7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:27 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id a27so6945244qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=joxoWB0Q4vAn0zcaGCjxGi3leJzncgQlzIC0R/STaNU=;
 b=Fu0JMTiSZuGzv4c28a789LKpiLW5WtJO4uBv8Jugsh3Y7Bj7nSxJN4zaURs5kktJWD
 zO4KeklRY0s1+FQ603uFN7CGF+j+/IrNAB8A/GGVroDxHxhJBma4W0NPvdQdZgDIfIg+
 ToccEpjSKyz53zYF2WLtrmzrvsiX07amJOP2dEdsiXoPNrVaIlRcpkEqqGy3d+3HmCUP
 cwb5Km2XT7vF+XheNMH2PQzOEQ32aJ7dam1CTWVu1Fj+0LhtBUM4M+T0S0gajTYzMpcg
 +OSAAZAonrMNeYuFLKaWByDGKP96KbGGVgTyidcNuZ/t+/ftJRfoLEscwdAjqHyDfLWY
 oDug==
X-Gm-Message-State: APjAAAUl/5InGsL1VTgjU+8rXWgYxQ7pl/T91uo8/wggeFiHUHXFylrM
 uDsxg6BPoQ1X5UpZCReLNHzZY2t/M5M=
X-Google-Smtp-Source: APXvYqzsphukF3DbhOjTHbz2suWBnlCfKq7ad/KibU7+uOB6cPlbSUs3eAVE1w2uqJOe4mFdKjcQSQ==
X-Received: by 2002:a37:5942:: with SMTP id n63mr77310328qkb.69.1560799705964; 
 Mon, 17 Jun 2019 12:28:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 179/459] drm/amd/powerplay: use the table size member in the
 structure instead of getting directly
Date: Mon, 17 Jun 2019 14:26:44 -0500
Message-Id: <20190617192704.18038-80-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joxoWB0Q4vAn0zcaGCjxGi3leJzncgQlzIC0R/STaNU=;
 b=PmfYlCfU+ZavErt1gWCznorHYAwVS8eJ5D1IsHiN6EvLBQuFQZrMqWuWZfgQdPySmg
 U1qSxvqn8m7WKBQqGkKI1cgILGT+OLRX6ffB+5PbwtBEarLweezd5zjaHN1tQ8kgLVgO
 jI8eP8QgwQzVGUOWdDPRt3jd7+QDQr2QAA770RVqDyae57r7FV7ToWt3Rgb8vph9wj8S
 JD6rmdqrSZvpl8HfKA24Yyd/WH1JHRAeRIBGamSSWmDG8igWD/GtgFmjmwfqYkn9SvCQ
 RTw9qahK2b+MHMSbgfOQL8qdQ5XFFSVN9oq2WFkPmf9og7TjTXM8ySkbqw6OOYFTX3Rn
 sbrA==
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
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggdXNlcyB0aGUg
dGFibGUgc2l6ZSBtZW1iZXIgaW4gdGhlIHN0cnVjdHVyZSBpbnN0ZWFkIG9mIGdldHRpbmcKZGly
ZWN0bHksIGJlY2F1c2UgdGhlIHRhYmxlIGlzIGRpZmZlcmVudCBpbiBlYWNoIGFzaWMuCgpTaWdu
ZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2
aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpp
bmRleCAzZTExNDMxNmYzODUuLmUxOTNmNjM4NzlhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTY3NSwxMSArNjc1LDEyIEBAIHN0YXRpYyBpbnQgc211
X3YxMV8wX3BhcnNlX3BwdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJaW50IHJldDsK
IAogCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90
YWJsZTsKKwlzdHJ1Y3Qgc211X3RhYmxlICp0YWJsZSA9ICZ0YWJsZV9jb250ZXh0LT50YWJsZXNb
U01VX1RBQkxFX1BQVEFCTEVdOwogCiAJaWYgKHRhYmxlX2NvbnRleHQtPmRyaXZlcl9wcHRhYmxl
KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXRhYmxlX2NvbnRleHQtPmRyaXZlcl9wcHRhYmxlID0g
a3phbGxvYyhzaXplb2YoUFBUYWJsZV90KSwgR0ZQX0tFUk5FTCk7CisJdGFibGVfY29udGV4dC0+
ZHJpdmVyX3BwdGFibGUgPSBremFsbG9jKHRhYmxlLT5zaXplLCBHRlBfS0VSTkVMKTsKIAogCWlm
ICghdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGUpCiAJCXJldHVybiAtRU5PTUVNOwpAQCAt
MTY0OSw2ICsxNjUwLDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2V0X29kOF9kZWZhdWx0X3Nl
dHRpbmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCQkgICAgICBib29sIGluaXRpYWxp
emUpCiB7CiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+
c211X3RhYmxlOworCXN0cnVjdCBzbXVfdGFibGUgKnRhYmxlID0gJnRhYmxlX2NvbnRleHQtPnRh
Ymxlc1tTTVVfVEFCTEVfT1ZFUkRSSVZFXTsKIAlpbnQgcmV0OwogCiAJLyoqCkBAIC0xNjYyLDcg
KzE2NjQsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXRfb2Q4X2RlZmF1bHRfc2V0dGluZ3Mo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCWlmICh0YWJsZV9jb250ZXh0LT5vdmVyZHJpdmVf
dGFibGUpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAotCQl0YWJsZV9jb250ZXh0LT5vdmVyZHJpdmVf
dGFibGUgPSBremFsbG9jKHNpemVvZihPdmVyRHJpdmVUYWJsZV90KSwgR0ZQX0tFUk5FTCk7CisJ
CXRhYmxlX2NvbnRleHQtPm92ZXJkcml2ZV90YWJsZSA9IGt6YWxsb2ModGFibGUtPnNpemUsIEdG
UF9LRVJORUwpOwogCiAJCWlmICghdGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlKQogCQkJ
cmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
