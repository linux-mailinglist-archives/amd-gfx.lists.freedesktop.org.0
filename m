Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063F48DF1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F27089415;
	Mon, 17 Jun 2019 19:17:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B99893ED
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so12207768qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcjxVW7qw3HMLfuhAGbaKAe32d8Yx0gq+H4VkwjvwME=;
 b=VgagiHrL1fL9bH7PV6IgeIcmw5xRW8Nb8f59GemwIvc65Km0zM//HjU/Jo3J+5WXwo
 5/iMni1pzZqjbKGbT3zgZ2rJe06amVPtDx+uDzzWEkLhvTQV6/0eyYgJKyHzo8o0Et9Y
 oHeDxtLd/ca1UkZHoIjISbsjmElaZvS2hZBP3rP2QOe0BmmvcC3tPHaNJSglbaodFY0W
 bNn88O5J7B/6uqKlt6xPDHukoDxS10+y6JPQe4AS1VcHfY7xZamnFLN9FZKdXXL5XYmU
 IV6j33SqFMipZSjYWaTSaCn6MCFJ2yTMd8s+ebVsKKrkCQOVNYalYO6NuceAS8L4yDEE
 YSyw==
X-Gm-Message-State: APjAAAVL076qQARQOHwhROvm23EmHR1tbfG/4Z4f5T6N1525qO+Q+NnM
 DwtHWFlVqWls1nWYf2SpXVAE2v+6Gf8=
X-Google-Smtp-Source: APXvYqyC6RyAxzPbGhOhnuorpIF52mHX1GehZ13CYC0iW0Uymjm5yIBWG8KYTDbIkyBelcgMvMVADg==
X-Received: by 2002:a0c:a944:: with SMTP id z4mr22494204qva.92.1560799072746; 
 Mon, 17 Jun 2019 12:17:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 051/459] drm/amdgpu: correct pte mtype field for navi
Date: Mon, 17 Jun 2019 14:10:12 -0500
Message-Id: <20190617191700.17899-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcjxVW7qw3HMLfuhAGbaKAe32d8Yx0gq+H4VkwjvwME=;
 b=k/ksHxA/xaxD35XF44b/alpY07DRwqmoQB/ORxR1lMQt2xewGS+FtJFbalgTj5thX3
 5X8B3UwDU6FsMjBF4AzlwHK6g2OjfM2VemHkKeSOK+Qye2byH5vPPt2NBHRjZkz45KIe
 l5PTS9fbGQXNwUHEUuliNV8Tvi1Ymfc+9ZbD5W0WASJ0ksDFcswblvK1mvQOaf2hglnY
 OKvD/rXDx1a34Qn5pYCAUPlZDkr7uZhjAfvvDgxpfBfRf0RdHdhLSCqQnnIfwWL7GZmB
 H10pUPNbEL2ebZjyVud4j3RsKfZQM5LSxP1wFO3IzA/ibpZODphaDLWyvKX++XUTGSar
 +vsg==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGhlIE1UWVBFIGZp
bGVkIG1vdmVzIGZyb20gYml0cyA1ODo1NyB0byA1MDo0OCBmb3IgTlYxMApBbmQgdGhlIHNpemUg
b2YgTVRZUEUgZmllbGQgaXMgbm93IDNiaXRzCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYyB8IDkgKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uaCB8IDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwppbmRleCA0ZjEw
ZjVhYmEwMGIuLjU2OGMwZjYxYjRkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMKQEAgLTE1NzQsOCArMTU3NCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib19zcGxp
dF9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWZsYWdzICY9IH5BTURHUFVf
UFRFX0VYRUNVVEFCTEU7CiAJZmxhZ3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VY
RUNVVEFCTEU7CiAKLQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9NQVNLOwotCWZsYWdzIHw9
IChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfTVRZUEVfTUFTSyk7CisJaWYgKGFkZXYtPmFz
aWNfdHlwZSA9PSBDSElQX05BVkkxMCkgeworCQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9O
VjEwX01BU0s7CisJCWZsYWdzIHw9IChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfTVRZUEVf
TlYxMF9NQVNLKTsKKwl9IGVsc2UgeworCQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9NQVNL
OworCQlmbGFncyB8PSAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX01UWVBFX01BU0spOwor
CX0KIAogCWlmICgobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCkgJiYKIAkgICAgKGFk
ZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmgKaW5kZXggOTFiYWY5NTIxMmE2Li5jNDEyNWI0NzcxMzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCkBAIC03NSw3ICs3NSw3IEBAIHN0cnVjdCBhbWRn
cHVfYm9fbGlzdF9lbnRyeTsKIAogCiAvKiBGb3IgR0ZYOSAqLwotI2RlZmluZSBBTURHUFVfUFRF
X01UWVBFKGEpICAgICgodWludDY0X3QpYSA8PCA1NykKKyNkZWZpbmUgQU1ER1BVX1BURV9NVFlQ
RShhKQkoKHVpbnQ2NF90KShhKSA8PCA1NykKICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQRV9NQVNL
CUFNREdQVV9QVEVfTVRZUEUoM1VMTCkKIAogI2RlZmluZSBBTURHUFVfTVRZUEVfTkMgMApAQCAt
ODgsNiArODgsMTAgQEAgc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5OwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IEFNREdQVV9QVEVfV1JJVEVBQkxFICBcCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgQU1ER1BVX1BURV9NVFlQRShBTURHUFVfTVRZUEVfQ0Mp
KQogCisvKiBOQVZJMTAgb25seSAqLworI2RlZmluZSBBTURHUFVfUFRFX01UWVBFX05WMTAoYSkg
ICAgICAgKCh1aW50NjRfdCkoYSkgPDwgNDgpCisjZGVmaW5lIEFNREdQVV9QVEVfTVRZUEVfTlYx
MF9NQVNLICAgICBBTURHUFVfUFRFX01UWVBFX05WMTAoN1VMTCkKKwogLyogSG93IHRvIHByb2dy
YW1tIFZNIGZhdWx0IGhhbmRsaW5nICovCiAjZGVmaW5lIEFNREdQVV9WTV9GQVVMVF9TVE9QX05F
VkVSCTAKICNkZWZpbmUgQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfRklSU1QJMQotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
