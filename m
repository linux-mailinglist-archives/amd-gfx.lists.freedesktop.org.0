Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89B48F74
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24989C98;
	Mon, 17 Jun 2019 19:32:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BEA89C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:12 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so6936349qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aTr0kmniMGFPZ4hui30dLHK8zOS++yd62XPKe0jBUZc=;
 b=Q65+JJ6JYD/lkkCP8SKFU5VISkyLgrDwaUFxSeCYM4OaTYX10U0SKpXxHTvpP1as1Z
 TFuFDM32qyDvB7M5QyiPAQ5isrq6hcqWkQi/xPkpp177Le0AohCas967J2g9AjsW8+qe
 8Anyh1lkLLnkYrBmihaMJPaXCSRXPRk2FVSbcq6+lD1cVupfs3PtoekomjAlF9akwMYY
 2K5WrSZgE8FTAixtwvPWQVYCMSKq76MK7sRQYrTnHFCI7ESPJQVjOy+8Q5eBNv6tHh0s
 77zdShSy76y9mtuFSnQTn0Oeing83s1cB3pH4xkwCaKjPmNofLETIH9eD5hLtx9aYAC5
 Z7AA==
X-Gm-Message-State: APjAAAUoqbHEcpkfu/FChYvDnSOr8hjQ+kwwih/HB0W23C/zvZgJSwrA
 DFsJFEsTE+wo7t+xH4NlpIymI0tMnPM=
X-Google-Smtp-Source: APXvYqy2pM4zFSNMffdvVlvJ/Y+sqNfXE/ApAYrwdP5i5euwJff5DSD9NarlEiVY329pw+jovHI79g==
X-Received: by 2002:a05:620a:5a:: with SMTP id
 t26mr18450396qkt.201.1560799931626; 
 Mon, 17 Jun 2019 12:32:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 263/459] drm/amd/powerplay: add sclk sysfs interface support
 for navi10
Date: Mon, 17 Jun 2019 14:30:30 -0500
Message-Id: <20190617193106.18231-64-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aTr0kmniMGFPZ4hui30dLHK8zOS++yd62XPKe0jBUZc=;
 b=oWBApfDVroItyTTObKFuiOY/JVKvqV/40FD4o0a7t4AR5UPJs3wc5lnyWhRiT5nSEV
 HmvuLVT1oK+swAuVAq3gjTn7O1wWobwOXF7b6xbaHIsOlaq7ASA9XQVJaaUIZO2O2XiR
 UJZx14blU1jLjpYjE9fPtQ8+rimDMzpWyRJKRy/y9+CNvpz4iAGA3kmbsPYfV3X0seXf
 imJPdvPb+AufCBqzXMiUS+BdDADYYHhZHUxxqhfgE2DtKskY4txV6eO6PsY9Ieh3Q8n5
 j1mJM7HHgMTAqrUfIOOIGKf4dyQtCp6CZ893si+BsksJoAdK9mXKOwuC6bLI5eg6Ajo3
 0f8w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.Wang@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCm1pc3Mgc2NsayBzdXBwb3J0
IGluIGZvcmNlX2Nsa19sZXZlbHMgZnVuY3Rpb24KClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcg
PGtldmluMS5XYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNGYzZDg2MDQ1NDBkLi5kZWNlNTdm
Yzc1MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAg
LTY0OCw2ICs2NDgsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCiAJc3dpdGNoIChjbGtfdHlwZSkgewogCWNhc2UgU01VX0dG
WENMSzoKKwljYXNlIFNNVV9TQ0xLOgogCWNhc2UgU01VX1NPQ0NMSzoKIAljYXNlIFNNVV9NQ0xL
OgogCWNhc2UgU01VX1VDTEs6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
