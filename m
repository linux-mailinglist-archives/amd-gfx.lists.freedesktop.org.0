Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97648EE1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C589A72;
	Mon, 17 Jun 2019 19:28:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C18F89A72
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x2so12260634qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIQj9qim3j+4bycVf4TgGrhe5s7VA0QC/v88KEv7PPQ=;
 b=E4Uz65VI2H/2+E/5DlaE7ySUA8rwpDVLfGudI9ZsIfhumLRNyLVIjNhpxlGC5aYSBx
 sJGBNsZFjcza1r0GiwMFTJIZg38YD9vnEpS3vqF1FNH5ApkEdH90cdPd5oTZtCZ2C9Iq
 XH9mZs0h3Rfa78hIMdjTMMt4YLIzOV5IJFOTJwrft6e5fj4GvDYL0CHoa1J2AAmvKHw8
 6eYqsy+xnIZe6/aADIEjl1MnboleSeJHVO19KMPQO0uwpxbHJAkCD+kvTmec46JUGS94
 EOKaHKH7lE4JnYD4Vvc5kZBvs3dnXj/vGg1nXoBRwLMyo6AFwT8/kPX/OqNGZ2SLmsOO
 h8Iw==
X-Gm-Message-State: APjAAAXg59usSpRGl2j46Jbh9+Nx/CJxmfzxhIT2da9r+fLciKO0fdtN
 OyDtLp1nuVZGfZTW/RLnkWRMIwsnutU=
X-Google-Smtp-Source: APXvYqxJtxli2wI58rmuUiu7/SzS13nMCZqzHWZJ89K1NFpyujtLDjWKemaaaZAmnzIhWPXjjNXz4A==
X-Received: by 2002:a05:6214:3a5:: with SMTP id
 m5mr10463926qvy.7.1560799695661; 
 Mon, 17 Jun 2019 12:28:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 168/459] drm/amd/amdgpu: fw version check with gfxoff
Date: Mon, 17 Jun 2019 14:26:33 -0500
Message-Id: <20190617192704.18038-69-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIQj9qim3j+4bycVf4TgGrhe5s7VA0QC/v88KEv7PPQ=;
 b=urO1zzbV+3GXpS8GKzbrxfkes+7YfRjCCNidzFthEx/wAsjWPlpfUkp51097xH6pbU
 rX7rWVlVRvZGhtymra0Kc6ss2m8XtsyoNnEyIFa82w+pQXPdtcN1a0PpkPnP6tgtQwHq
 sY0yR2XggnSCMcHGTKxAq+vkJLvR4H9uWlcykQEs5qxgjHNQFB4ENySo6eRbm+WMWeYK
 ubIdKtAIWZSX0PArs4/uUA1vXpPtDXSc3g1iL4LDnHkcnH9sVT1SsPDt/GtmP1GVfvnY
 syf52qc4GghRigQKQgQKZT3EYoDSAXarpNshfA1q5PZtskFHkHroCzRTbqbaW4KeAIUH
 osHg==
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
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCjEuIGNoZWNrIHRoZSBm
aXJtd2FyZSB2ZXJzaW9uIHdoZW4gZW5hYmxpbmcgZ2Z4b2ZmCjIuIG92ZXJ3cml0ZSB0aGUgcHB0
YWJsZSB0byBtYWtlIHN1cmUgZ2Z4b2ZmIGlzIHJlYWxseQplbmFibGVkIG9uIG5hdmkxMAoKU2ln
bmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggY2MyNDVmNGM2MWFiLi42M2RmNTllNzMzNWQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTMzMSw3
ICszMzEsNiBAQCBzdGF0aWMgaW50IHNtdV9zZXRfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfVkVHQTIwOgog
CWNhc2UgQ0hJUF9OQVZJMTA6Ci0JCWFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9N
QVNLOwogCQlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX09WRVJEUklWRV9NQVNLKQogCQkJ
c211LT5vZF9lbmFibGVkID0gdHJ1ZTsKIAkJc211X3YxMV8wX3NldF9zbXVfZnVuY3Moc211KTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBiOGQ5ZDFh
NzNiMTYuLmI3OGZhN2ZjMDYyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYwpAQCAtMTE3LDYgKzExNyw4IEBAIHN0YXRpYyBpbnQKIG5hdmkxMF9nZXRfYWxs
b3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJICB1aW50MzJf
dCAqZmVhdHVyZV9tYXNrLCB1aW50MzJfdCBudW0pCiB7CisJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBzbXUtPmFkZXY7CisKIAlpZiAobnVtID4gMikKIAkJcmV0dXJuIC1FSU5WQUw7CiAK
QEAgLTEzOSw2ICsxNDEsMTAgQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX01NSFVCX1BH
KQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfQVRIVUJfUEcpOwogCisJaWYgKGFkZXYtPnBt
LnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykKKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFz
ayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhfU1NfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfR0ZYT0ZGX0JJVCk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTQ5LDYgKzE1NSw3
IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2NoZWNrX3Bvd2VycGxheV90YWJsZShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKIAogc3RhdGljIGludCBuYXZpMTBfYXBwZW5kX3Bvd2VycGxheV90YWJsZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IHNtdS0+YWRldjsKIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxlX2NvbnRleHQgPSAm
c211LT5zbXVfdGFibGU7CiAJUFBUYWJsZV90ICpzbWNfcHB0YWJsZSA9IHRhYmxlX2NvbnRleHQt
PmRyaXZlcl9wcHRhYmxlOwogCXN0cnVjdCBhdG9tX3NtY19kcG1faW5mb192NF81ICpzbWNfZHBt
X3RhYmxlOwpAQCAtMjM0LDYgKzI0MSwxMCBAQCBzdGF0aWMgaW50IG5hdmkxMF9hcHBlbmRfcG93
ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCS8qIE12ZGQgU3ZpMiBEaXYg
UmF0aW8gU2V0dGluZyAqLwogCXNtY19wcHRhYmxlLT5NdmRkUmF0aW8gPSBzbWNfZHBtX3RhYmxl
LT5NdmRkUmF0aW87CiAKKwlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX0dGWE9GRl9NQVNL
KQorCQkqKHVpbnQ2NF90ICopc21jX3BwdGFibGUtPkZlYXR1cmVzVG9SdW4gfD0gRkVBVFVSRV9N
QVNLKEZFQVRVUkVfR0ZYX1NTX0JJVCkKKwkJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhP
RkZfQklUKTsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
