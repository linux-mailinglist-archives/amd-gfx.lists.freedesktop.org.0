Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3548F85
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384F89CD9;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6089CBA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so12260800qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=va5cbi+fIE1opJQHGJj5IH9zXaSA8HPOYUuumhCob74=;
 b=EmfzyA6BPsqx8xfyhFCEUocYYtjh/R6kdFYxRn09mwS+gAA/tu7BtnPJHu1/6Fa/Jd
 tSNPh09XkhxkMbVlhrLcJVr5PgLdo7oqvVCGKPLYqP1Fudm1+W1KQELsbqncGA9J1e3d
 VHr5GWTO8v7CnAqC3c9f21dcbkGCZDZOfXBpoLBix6B5H4flIZdz9RP/dQ2vCa8jBpIy
 JIZYla6LN1vMjiNwtLDoY62YifG3mGB8lP2OFYoyS41jxL0xZS7jIsQw8y13O8xmy+Cj
 K5j6f4azYoCX5B4rEx9JH7NTaJV9Lcdey2J5Yauu2Dtlat/IKXxH0U+X72Ctu7VFdggL
 dYag==
X-Gm-Message-State: APjAAAX3rkzwx9kPvbvLiYLb8aO99coihJuSDpPR8l1fa5CJAKcjFSCQ
 NvzbB7C4Me9Vf1x0V4W1dICyQJ1PHJw=
X-Google-Smtp-Source: APXvYqwtIQkJ4c4p7u39m04n30Ud84DLZ8/fpYVGBCsxRg5wp29q3jLjC21Ca/y+VUWziaCBm02qRg==
X-Received: by 2002:ac8:5407:: with SMTP id b7mr89427821qtq.48.1560799944423; 
 Mon, 17 Jun 2019 12:32:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 278/459] drm/amd/powerplay: wake up azalia from d3 by sending
 smu message
Date: Mon, 17 Jun 2019 14:30:45 -0500
Message-Id: <20190617193106.18231-79-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=va5cbi+fIE1opJQHGJj5IH9zXaSA8HPOYUuumhCob74=;
 b=Q7i75J51SvEfn9NS14CbgTX+Z/ji3F+XhMzbftqLvpCpt+LpxNGCRqhM20OCFtzfgB
 vzLXP2GrjdRuTWYxH7oPkKFvUxQBZPs7nT2PAY1gQlE6YtNp+q3H6gJo5dtQ+jWTwh2N
 WS4KwCCFlnHyDDAWC6DxGlZIYzq39qem6s+IfgA8+W9PFu4n1j4xSlfnaXnZDMNoaixb
 +ky3ta1wXIm29/EGPuMCWt3lLkhg9b8aRwIhu1Jj8Dau7A7JPQphkZjU+du+mGPaX9Vd
 DTmXuf38eL5HJX6N5HCReUZlFYzukci+PISX7j2HBf63acitDW9fzMggJ+OhNBXblr5X
 7xnw==
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
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKdGhpcyBpcyBodyB3b3JrYXJv
dW5kIHRvIHdha2UgdXAgYXphbGlhIGZyb20gZDMuIGRpc3BsYXkgYXNpYwphbmQgYXphbGlhIGFy
ZSB0d28gZGlmZmVyZW50IHBjaSBkZXZpY2VzLiB3aGlsZSBkaXNwbGF5IGFzaWMKd2FrZSBmcm9t
IGQzLCBjdXJyZW50IGh3IGRvZXMgbm90IHNlbmQgc2lnbmFsIHRvIGF6YWxpYS4Kd29ya2Fyb3Vu
ZDogZGlzcGxheSBkcml2ZXIgYXNrIHNtdSBzZW5kIG1lc3NhZ2UgdG8gYXphbGlhIGRldmljZQp0
byBsZXQgYXphbGlhIHdha2UgdXAuCgpEZWZpbnRpb24gb2YgU01VIG1lc3NhZ2UsIGxpa2UgUFBT
TUNfTVNHX0JhY3JvQXVkaW9EM1BNRSwgaXMgcGVyCmFzaWMuIEl0IGlzIHNoYXJlZCBieSBkaWZm
ZXJlbnQgT1MuCgpTaWduZWQtb2ZmLWJ5OiBoZXJzZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+
CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCAgICAgIHwgIDQgKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMF9wcHNtYy5oIHwgIDMgKystCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICAgICAgICAgfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgICAgICAgfCAxMiAr
KysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
CmluZGV4IDI2N2M0ZjZlYjMxNy4uOGFjYzE3OTczNTc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAgLTIzOSw2ICsyMzksNyBAQCBlbnVt
IHNtdV9tZXNzYWdlX3R5cGUKIAlTTVVfTVNHX1Bvd2VyRG93blZjbiwKIAlTTVVfTVNHX1Bvd2Vy
VXBKcGVnLAogCVNNVV9NU0dfUG93ZXJEb3duSnBlZywKKwlTTVVfTVNHX0JhY29BdWRpb0QzUE1F
LAogCVNNVV9NU0dfTUFYX0NPVU5ULAogfTsKIApAQCAtNjg3LDYgKzY4OCw3IEBAIHN0cnVjdCBz
bXVfZnVuY3MKIAlpbnQgKCpzZXRfeGdtaV9wc3RhdGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCB1aW50MzJfdCBwc3RhdGUpOwogCWludCAoKmdmeF9vZmZfY29udHJvbCkoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKTsKIAlpbnQgKCpyZWdpc3Rlcl9pcnFfaGFuZGxlciko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOworCWludCAoKnNldF9hemFsaWFfZDNfcG1lKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSk7CiB9OwogCiAjZGVmaW5lIHNtdV9pbml0X21pY3JvY29kZShz
bXUpIFwKQEAgLTg5Myw2ICs4OTUsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5wcHRf
ZnVuY3MtPmdldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlPyAoc211KS0+cHB0X2Z1bmNzLT5n
ZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9yYW5nZSgoc211KSwgKHJhbmdlKSkgOiAwKQogI2RlZmlu
ZSBzbXVfcmVnaXN0ZXJfaXJxX2hhbmRsZXIoc211KSBcCiAJKChzbXUpLT5mdW5jcy0+cmVnaXN0
ZXJfaXJxX2hhbmRsZXIgPyAoc211KS0+ZnVuY3MtPnJlZ2lzdGVyX2lycV9oYW5kbGVyKHNtdSkg
OiAwKQorI2RlZmluZSBzbXVfc2V0X2F6YWxpYV9kM19wbWUoc211KSBcCisJKChzbXUpLT5mdW5j
cy0+c2V0X2F6YWxpYV9kM19wbWUgPyAoc211KS0+ZnVuY3MtPnNldF9hemFsaWFfZDNfcG1lKChz
bXUpKSA6IDApCiAKIGV4dGVybiBpbnQgc211X2dldF9hdG9tX2RhdGFfdGFibGUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IHRhYmxlLAogCQkJCSAgIHVpbnQxNl90ICpzaXplLCB1
aW50OF90ICpmcmV2LCB1aW50OF90ICpjcmV2LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMF9wcHNtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMF9wcHNtYy5oCmluZGV4IDJjYjA2MzY2NDU1Ny4uMzcz
ODYxZGRjY2QwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3YxMV8wX3Bwc21jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L3NtdV92MTFfMF9wcHNtYy5oCkBAIC0xMTgsOCArMTE4LDkgQEAKICNkZWZpbmUgUFBTTUNfTVNH
X1NldEdlbWluaUFwZXJ0dXJlTG93ICAgICAgICAgICAweDQ0CiAKICNkZWZpbmUgUFBTTUNfTVNH
X0dldFZvbHRhZ2VCeURwbU92ZXJkcml2ZSAgICAgICAweDQ1CisjZGVmaW5lIFBQU01DX01TR19C
YWNvQXVkaW9EM1BNRSAgICAgICAgICAgICAgICAgMHg0OAogCi0jZGVmaW5lIFBQU01DX01lc3Nh
Z2VfQ291bnQgICAgICAgICAgICAgICAgICAgICAgMHg0NworI2RlZmluZSBQUFNNQ19NZXNzYWdl
X0NvdW50ICAgICAgICAgICAgICAgICAgICAgIDB4NDkKIAogdHlwZWRlZiB1aW50MzJfdCBQUFNN
Q19SZXN1bHQ7CiB0eXBlZGVmIHVpbnQzMl90IFBQU01DX01zZzsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBkMTMwZDQ5MWFhODUuLjE1NDEzZjY0NmU1
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMTE0
LDYgKzExNCw3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX21lc3NhZ2VfbWFwW1NNVV9NU0dfTUFYX0NP
VU5UXSA9IHsKIAlNU0dfTUFQKFBvd2VyRG93blZjbiwJCVBQU01DX01TR19Qb3dlckRvd25WY24p
LAogCU1TR19NQVAoUG93ZXJVcEpwZWcsCQlQUFNNQ19NU0dfUG93ZXJVcEpwZWcpLAogCU1TR19N
QVAoUG93ZXJEb3duSnBlZywJCVBQU01DX01TR19Qb3dlckRvd25KcGVnKSwKKwlNU0dfTUFQKEJh
Y29BdWRpb0QzUE1FLAkJUFBTTUNfTVNHX0JhY29BdWRpb0QzUE1FKSwKIH07CiAKIHN0YXRpYyBp
bnQgbmF2aTEwX2Nsa19tYXBbU01VX0NMS19DT1VOVF0gPSB7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDM5YjRjMTYwYWZjNC4uMzVmMTRhMmYxZDJmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMTY2Miw2ICsx
NjYyLDE3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3JlZ2lzdGVyX2lycV9oYW5kbGVyKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgc211X3Yx
MV8wX3NldF9hemFsaWFfZDNfcG1lKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQoreworCWludCBy
ZXQgPSAwOworCisJbXV0ZXhfbG9jaygmc211LT5tdXRleCk7CisJcmV0ID0gc211X3NlbmRfc21j
X21zZyhzbXUsIFNNVV9NU0dfQmFjb0F1ZGlvRDNQTUUpOworCW11dGV4X3VubG9jaygmc211LT5t
dXRleCk7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNtdV9mdW5j
cyBzbXVfdjExXzBfZnVuY3MgPSB7CiAJLmluaXRfbWljcm9jb2RlID0gc211X3YxMV8wX2luaXRf
bWljcm9jb2RlLAogCS5sb2FkX21pY3JvY29kZSA9IHNtdV92MTFfMF9sb2FkX21pY3JvY29kZSwK
QEAgLTE3MTAsNiArMTcyMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X2Z1bmNzIHNtdV92
MTFfMF9mdW5jcyA9IHsKIAkuc2V0X3hnbWlfcHN0YXRlID0gc211X3YxMV8wX3NldF94Z21pX3Bz
dGF0ZSwKIAkuZ2Z4X29mZl9jb250cm9sID0gc211X3YxMV8wX2dmeF9vZmZfY29udHJvbCwKIAku
cmVnaXN0ZXJfaXJxX2hhbmRsZXIgPSBzbXVfdjExXzBfcmVnaXN0ZXJfaXJxX2hhbmRsZXIsCisJ
LnNldF9hemFsaWFfZDNfcG1lID0gc211X3YxMV8wX3NldF9hemFsaWFfZDNfcG1lLAogfTsKIAog
dm9pZCBzbXVfdjExXzBfc2V0X3NtdV9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
