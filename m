Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A4348F7E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4239D89CBC;
	Mon, 17 Jun 2019 19:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17ED89C99
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12197225qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Nj2PSF2kEhG/loPHXpqQI/dkGm2rtIuapp1WSUy/Xw=;
 b=FZXydmG+KwWIFaG3krYynZRiyHZ1p7qsU8NQuRmJ4bH32S1atIR4i16canxm89zmTZ
 oHlZsRr0UGwO5GyOvp+XDgskgR911Fx/PWkc7vCnys5Hiy5SoqQ0iGByIzqyvXGjFoZC
 DBG3dg+eJSPlmnTk09XujVm9WnfcVdK8BnVgWbqXAM9nhmTUydIAoMyO8YZkSCUfBxxn
 CS73ryPPoWhN1Ff5O9Yp6ylp0IoO2kzM0gonHMuDP2IJnnZuG7YjEfoh/QOiAXkUuU/c
 h+6aQvlECAhP9HJrclABqpAXhh+C5qaTdyduCAbXxSCAirVwRqOJWLgqX3LIjvn88DeL
 A27A==
X-Gm-Message-State: APjAAAXARo6H115+J9YSojVQcfdEPGnyB33Hoq2UleeZH1Q81FD2+IzJ
 xeqppcF6T6hyw84n19aLQppJeTVOPs0=
X-Google-Smtp-Source: APXvYqziGEGXhVSpW4uMm+hlTeLlrmeeyY3MYOt85pQ4eGtoQUs0Eq7y+iFzvUSxb0oOzGpJMOrvRw==
X-Received: by 2002:a0c:b39e:: with SMTP id t30mr23177730qve.212.1560799941937; 
 Mon, 17 Jun 2019 12:32:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 275/459] drm/amd/powerplay: remove smu callback funciton
 get_mclk(get_sclk)
Date: Mon, 17 Jun 2019 14:30:42 -0500
Message-Id: <20190617193106.18231-76-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Nj2PSF2kEhG/loPHXpqQI/dkGm2rtIuapp1WSUy/Xw=;
 b=YX+6Yj1m8KCzBG80jRe8uGGr+yUaORjFXEgKtIsHdoe+lz7Oh7mpSyqqybB5pQMdb+
 zEKfLA0Z/59da0Exq0jIjgrGAkzU8uTVCXR80HxjmsREqj1W/gCXLfyBLd8zvBmiwg2P
 kvxWHdiwQcEUQIIYZUKIAYFaeTP2CLhYv5edrbpwSndwm4CXqvaG9fN815B4FXLd8A9K
 /NEqzR8oTQ0KC4IVATXkMGTfvjeO78OC7Qf/vKmoEuoO782xhQz0nwfn1RIXSlDjuWTv
 sJaQoJZ+cScVaCc3YfnlvMuEUK2jXiGR/+hgVjD6XWhgGHraFuriQwBt+8nwQuZpxKh5
 1vHw==
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
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnJlbW92ZSBzbXUgY2FsbGJh
Y2s6IGdldF9tY2xrLCBnZXRfc2Nsay4KYmVjYXVzZSB0aGUgZnVuY3Rpb24gc211X2dldF9kcG1f
ZnJlcV9yYW5nZSBoYXMgdGhlIHNhbWUgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYyAg
ICAgICB8IDMyICsrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYyAgICB8IDM0ICsrKysrKy0tCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmggICAgfCAgNiAtLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMgICAgIHwgODUgLS0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA1NCBp
bnNlcnRpb25zKCspLCAxMDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RwbS5jCmluZGV4IGI1Mzk3MTM1YzQxNy4uZjU0YTFlZjUzMjc2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHBtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jCkBAIC05MDcsMTggKzkwNywzOCBAQCBhbWRn
cHVfZ2V0X3ZjZV9jbG9ja19zdGF0ZSh2b2lkICpoYW5kbGUsIHUzMiBpZHgpCiAKIGludCBhbWRn
cHVfZHBtX2dldF9zY2xrKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGxvdykKIHsK
LQlpZiAoaXNfc3VwcG9ydF9zd19zbXUoYWRldikpCi0JCXJldHVybiBzbXVfZ2V0X3NjbGsoJmFk
ZXYtPnNtdSwgbG93KTsKLQllbHNlCisJdWludDMyX3QgY2xrX2ZyZXE7CisJaW50IHJldCA9IDA7
CisJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7CisJCXJldCA9IHNtdV9nZXRfZHBtX2Zy
ZXFfcmFuZ2UoJmFkZXYtPnNtdSwgU01VX0dGWENMSywKKwkJCQkJICAgICBsb3cgPyAmY2xrX2Zy
ZXEgOiBOVUxMLAorCQkJCQkgICAgICFsb3cgPyAmY2xrX2ZyZXEgOiBOVUxMKTsKKwkJaWYgKHJl
dCkKKwkJCXJldHVybiAwOworCQlyZXR1cm4gY2xrX2ZyZXEgKiAxMDA7CisKKwl9CisJZWxzZSB7
CiAJCXJldHVybiAoYWRldiktPnBvd2VycGxheS5wcF9mdW5jcy0+Z2V0X3NjbGsoKGFkZXYpLT5w
b3dlcnBsYXkucHBfaGFuZGxlLCAobG93KSk7CisJfQogfQogCiBpbnQgYW1kZ3B1X2RwbV9nZXRf
bWNsayhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBsb3cpCiB7Ci0JaWYgKGlzX3N1
cHBvcnRfc3dfc211KGFkZXYpKQotCQlyZXR1cm4gc211X2dldF9tY2xrKCZhZGV2LT5zbXUsIGxv
dyk7Ci0JZWxzZQorCXVpbnQzMl90IGNsa19mcmVxOworCWludCByZXQgPSAwOworCWlmIChpc19z
dXBwb3J0X3N3X3NtdShhZGV2KSkgeworCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKCZh
ZGV2LT5zbXUsIFNNVV9VQ0xLLAorCQkJCQkgICAgIGxvdyA/ICZjbGtfZnJlcSA6IE5VTEwsCisJ
CQkJCSAgICAgIWxvdyA/ICZjbGtfZnJlcSA6IE5VTEwpOworCQlpZiAocmV0KQorCQkJcmV0dXJu
IDA7CisJCXJldHVybiBjbGtfZnJlcSAqIDEwMDsKKworCX0KKwllbHNlIHsKIAkJcmV0dXJuIChh
ZGV2KS0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5nZXRfbWNsaygoYWRldiktPnBvd2VycGxheS5wcF9o
YW5kbGUsIChsb3cpKTsKKwl9CiB9CiAKIGludCBhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19i
eV9zbXUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGJsb2NrX3R5cGUsIGJv
b2wgZ2F0ZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRl
eCBhZDhmNmRkNzcxM2QuLjM1NTc4YmU5NWRhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTM1LDMwICsxMzUsNTIgQEAgaW50IHNtdV9nZXRfZHBt
X2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNs
a190eXBlLAogCWlmICghbWluICYmICFtYXgpCiAJCXJldHVybiAtRUlOVkFMOwogCisJc3dpdGNo
IChjbGtfdHlwZSkgeworCWNhc2UgU01VX1VDTEs6CisJCWlmICghc211X2ZlYXR1cmVfaXNfZW5h
YmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsKKwkJCXByX3dhcm4oInVjbGsg
ZHBtIGlzIG5vdCBlbmFibGVkXG4iKTsKKwkJCXJldHVybiAwOworCQl9CisJCWJyZWFrOworCWNh
c2UgU01VX0dGWENMSzoKKwkJaWYgKCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZF
QVRVUkVfRFBNX0dGWENMS19CSVQpKSB7CisJCQlwcl93YXJuKCJnZnhjbGsgZHBtIGlzIG5vdCBl
bmFibGVkXG4iKTsKKwkJCXJldHVybiAwOworCQl9CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWJy
ZWFrOworCX0KKworCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOwogCWNsa19pZCA9IHNtdV9jbGtf
Z2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwotCWlmIChjbGtfaWQgPCAwKQotCQlyZXR1cm4gY2xr
X2lkOworCWlmIChjbGtfaWQgPCAwKSB7CisJCXJldCA9IC1FSU5WQUw7CisJCWdvdG8gZmFpbGVk
OworCX0KIAogCXBhcmFtID0gKGNsa19pZCAmIDB4ZmZmZikgPDwgMTY7CiAKIAlpZiAobWF4KSB7
CiAJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfR2V0TWF4
RHBtRnJlcSwgcGFyYW0pOwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZmFp
bGVkOwogCQlyZXQgPSBzbXVfcmVhZF9zbWNfYXJnKHNtdSwgbWF4KTsKIAkJaWYgKHJldCkKLQkJ
CXJldHVybiByZXQ7CisJCQlnb3RvIGZhaWxlZDsKIAl9CiAKIAlpZiAobWluKSB7CiAJCXJldCA9
IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfR2V0TWluRHBtRnJlcSwg
cGFyYW0pOwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZmFpbGVkOwogCQly
ZXQgPSBzbXVfcmVhZF9zbWNfYXJnKHNtdSwgbWluKTsKIAkJaWYgKHJldCkKLQkJCXJldHVybiBy
ZXQ7CisJCQlnb3RvIGZhaWxlZDsKIAl9CiAKK2ZhaWxlZDoKKwltdXRleF91bmxvY2soJnNtdS0+
bXV0ZXgpOwogCXJldHVybiByZXQ7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDVlNDliMzhkZGQwZC4uNTg4NjFjMDM0MGI5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAg
LTY3OSw4ICs2NzksNiBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJaW50ICgqdXBkYXRlX29kOF9zZXR0
aW5ncykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJICAgdWludDMyX3QgaW5kZXgsCiAJ
CQkJICAgdWludDMyX3QgdmFsdWUpOwotCXVpbnQzMl90ICgqZ2V0X3NjbGspKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBib29sIGxvdyk7Ci0JdWludDMyX3QgKCpnZXRfbWNsaykoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgbG93KTsKIAlpbnQgKCpnZXRfY3VycmVudF9ycG0pKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqc3BlZWQpOwogCXVpbnQzMl90ICgqZ2V0X2Zh
bl9jb250cm9sX21vZGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAlpbnQgKCpzZXRfZmFu
X2NvbnRyb2xfbW9kZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IG1vZGUpOwpA
QCAtODgxLDEwICs4NzksNiBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5wcHRfZnVuY3Mt
PmRwbV9zZXRfdXZkX2VuYWJsZSA/IChzbXUpLT5wcHRfZnVuY3MtPmRwbV9zZXRfdXZkX2VuYWJs
ZSgoc211KSwgKGVuYWJsZSkpIDogMCkKICNkZWZpbmUgc211X2RwbV9zZXRfdmNlX2VuYWJsZShz
bXUsIGVuYWJsZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5kcG1fc2V0X3ZjZV9lbmFibGUgPyAo
c211KS0+cHB0X2Z1bmNzLT5kcG1fc2V0X3ZjZV9lbmFibGUoKHNtdSksIChlbmFibGUpKSA6IDAp
Ci0jZGVmaW5lIHNtdV9nZXRfc2NsayhzbXUsIGxvdykgXAotCSgoc211KS0+ZnVuY3MtPmdldF9z
Y2xrID8gKHNtdSktPmZ1bmNzLT5nZXRfc2Nsaygoc211KSwgKGxvdykpIDogMCkKLSNkZWZpbmUg
c211X2dldF9tY2xrKHNtdSwgbG93KSBcCi0JKChzbXUpLT5mdW5jcy0+Z2V0X21jbGsgPyAoc211
KS0+ZnVuY3MtPmdldF9tY2xrKChzbXUpLCAobG93KSkgOiAwKQogI2RlZmluZSBzbXVfc2V0X3hn
bWlfcHN0YXRlKHNtdSwgcHN0YXRlKSBcCiAJCSgoc211KS0+ZnVuY3MtPnNldF94Z21pX3BzdGF0
ZSA/IChzbXUpLT5mdW5jcy0+c2V0X3hnbWlfcHN0YXRlKChzbXUpLCAocHN0YXRlKSkgOiAwKQog
I2RlZmluZSBzbXVfc2V0X3BwZmVhdHVyZV9zdGF0dXMoc211LCBwcGZlYXR1cmVzKSBcCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDU3YTUwYTkxNjJlOS4u
NmZmZmY1YWI3NGI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YwpAQCAtMTM1MSw4OSArMTM1MSw2IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2dmeF9vZmZfY29u
dHJvbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpCiAJcmV0dXJuIHJldDsK
IH0KIAotCi1zdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY2xvY2tfcmFuZ2VzKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAotCQkJCSAgICAgIHVpbnQzMl90ICpjbG9jaywKLQkJCQkgICAgICBlbnVt
IHNtdV9jbGtfdHlwZSBjbG9ja19zZWxlY3QsCi0JCQkJICAgICAgYm9vbCBtYXgpCi17Ci0JaW50
IHJldDsKLQkqY2xvY2sgPSAwOwotCWlmIChtYXgpIHsKLQkJcmV0ID0gc211X3NlbmRfc21jX21z
Z193aXRoX3BhcmFtKHNtdSwgU01VX01TR19HZXRNYXhEcG1GcmVxLAotCQkJCXNtdV9jbGtfZ2V0
X2luZGV4KHNtdSwgY2xvY2tfc2VsZWN0KSA8PCAxNik7Ci0JCWlmIChyZXQpIHsKLQkJCXByX2Vy
cigiW0dldENsb2NrUmFuZ2VzXSBGYWlsZWQgdG8gZ2V0IG1heCBjbG9jayBmcm9tIFNNQyFcbiIp
OwotCQkJcmV0dXJuIHJldDsKLQkJfQotCQlzbXVfcmVhZF9zbWNfYXJnKHNtdSwgY2xvY2spOwot
CX0gZWxzZSB7Ci0JCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9N
U0dfR2V0TWluRHBtRnJlcSwKLQkJCQlzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsb2NrX3NlbGVj
dCkgPDwgMTYpOwotCQlpZiAocmV0KSB7Ci0JCQlwcl9lcnIoIltHZXRDbG9ja1Jhbmdlc10gRmFp
bGVkIHRvIGdldCBtaW4gY2xvY2sgZnJvbSBTTUMhXG4iKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0K
LQkJc211X3JlYWRfc21jX2FyZyhzbXUsIGNsb2NrKTsKLQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQot
c3RhdGljIHVpbnQzMl90IHNtdV92MTFfMF9kcG1fZ2V0X3NjbGsoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIGJvb2wgbG93KQotewotCXVpbnQzMl90IGdmeF9jbGs7Ci0JaW50IHJldDsKLQotCWlm
ICghc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9HRlhDTEtfQklU
KSkgewotCQlwcl9lcnIoIltHZXRTY2xrc106IGdmeGNsayBkcG0gbm90IGVuYWJsZWQhXG4iKTsK
LQkJcmV0dXJuIC1FUEVSTTsKLQl9Ci0KLQlpZiAobG93KSB7Ci0JCXJldCA9IHNtdV92MTFfMF9n
ZXRfY2xvY2tfcmFuZ2VzKHNtdSwgJmdmeF9jbGssIFNNVV9HRlhDTEssIGZhbHNlKTsKLQkJaWYg
KHJldCkgewotCQkJcHJfZXJyKCJbR2V0U2Nsa3NdOiBmYWlsIHRvIGdldCBtaW4gU01VX0dGWENM
S1xuIik7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0JfSBlbHNlIHsKLQkJcmV0ID0gc211X3YxMV8w
X2dldF9jbG9ja19yYW5nZXMoc211LCAmZ2Z4X2NsaywgU01VX0dGWENMSywgdHJ1ZSk7Ci0JCWlm
IChyZXQpIHsKLQkJCXByX2VycigiW0dldFNjbGtzXTogZmFpbCB0byBnZXQgbWF4IFNNVV9HRlhD
TEtcbiIpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCX0KLQotCXJldHVybiAoZ2Z4X2NsayAqIDEw
MCk7Ci19Ci0KLXN0YXRpYyB1aW50MzJfdCBzbXVfdjExXzBfZHBtX2dldF9tY2xrKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LCBib29sIGxvdykKLXsKLQl1aW50MzJfdCBtZW1fY2xrOwotCWludCBy
ZXQ7Ci0KLQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1f
VUNMS19CSVQpKSB7Ci0JCXByX2VycigiW0dldE1jbGtzXTogbWVtY2xrIGRwbSBub3QgZW5hYmxl
ZCFcbiIpOwotCQlyZXR1cm4gLUVQRVJNOwotCX0KLQotCWlmIChsb3cpIHsKLQkJcmV0ID0gc211
X3YxMV8wX2dldF9jbG9ja19yYW5nZXMoc211LCAmbWVtX2NsaywgU01VX1VDTEssIGZhbHNlKTsK
LQkJaWYgKHJldCkgewotCQkJcHJfZXJyKCJbR2V0TWNsa3NdOiBmYWlsIHRvIGdldCBtaW4gU01V
X1VDTEtcbiIpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCX0gZWxzZSB7Ci0JCXJldCA9IHNtdV92
MTFfMF9nZXRfY2xvY2tfcmFuZ2VzKHNtdSwgJm1lbV9jbGssIFNNVV9HRlhDTEssIHRydWUpOwot
CQlpZiAocmV0KSB7Ci0JCQlwcl9lcnIoIltHZXRNY2xrc106IGZhaWwgdG8gZ2V0IG1heCBTTVVf
VUNMS1xuIik7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0JfQotCi0JcmV0dXJuIChtZW1fY2xrICog
MTAwKTsKLX0KLQogc3RhdGljIGludCBzbXVfdjExXzBfc2V0X29kOF9kZWZhdWx0X3NldHRpbmdz
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCQkgICAgICBib29sIGluaXRpYWxpemUpCiB7
CkBAIC0xNzc3LDggKzE2OTQsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNtdV9mdW5jcyBzbXVf
djExXzBfZnVuY3MgPSB7CiAJLnNldF9kZWVwX3NsZWVwX2RjZWZjbGsgPSBzbXVfdjExXzBfc2V0
X2RlZXBfc2xlZXBfZGNlZmNsaywKIAkuZGlzcGxheV9jbG9ja192b2x0YWdlX3JlcXVlc3QgPSBz
bXVfdjExXzBfZGlzcGxheV9jbG9ja192b2x0YWdlX3JlcXVlc3QsCiAJLnNldF93YXRlcm1hcmtz
X2Zvcl9jbG9ja19yYW5nZXMgPSBzbXVfdjExXzBfc2V0X3dhdGVybWFya3NfZm9yX2Nsb2NrX3Jh
bmdlcywKLQkuZ2V0X3NjbGsgPSBzbXVfdjExXzBfZHBtX2dldF9zY2xrLAotCS5nZXRfbWNsayA9
IHNtdV92MTFfMF9kcG1fZ2V0X21jbGssCiAJLnNldF9vZDhfZGVmYXVsdF9zZXR0aW5ncyA9IHNt
dV92MTFfMF9zZXRfb2Q4X2RlZmF1bHRfc2V0dGluZ3MsCiAJLnVwZGF0ZV9vZDhfc2V0dGluZ3Mg
PSBzbXVfdjExXzBfdXBkYXRlX29kOF9zZXR0aW5ncywKIAkuZ2V0X2N1cnJlbnRfcnBtID0gc211
X3YxMV8wX2dldF9jdXJyZW50X3JwbSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
