Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7098722
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00666EA20;
	Wed, 21 Aug 2019 22:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726B66EA1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:22 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id x4so5103626qts.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkrJsaEV45byagJyMoVHCHajQlTfgC1bvBJEuICQCO8=;
 b=hIxwJXNt3w/KIpnQGubUSigd7yi+WTCIWLBEhl09SSP3ORxF+jp8p+4d+GDte/Xd55
 7V2khUt7kM3O46IbL90pEQxVUUEXKfQr2Ro5DPUJ8zGIh9jloRIPGForJV1XjGI9Quzx
 sF7xsFSNINN8+cYc2uEHaGytDvnTTEvc7AlHh+MmfcRZdWiFYf3hjEHzfBCKqSaYCnqV
 JjRYlR/iBQcvuf8q8FCz/+hbYHXJLzQ4QguDsZhy+b+i08KG3ykudUZZu9141zzFNIrL
 wNq/AXDFkTY5Ho7CueCz7PPxchiFlUesEO66SHrexXpbtgH+v9KfgGKuiUIxwBgrbzT7
 QdKg==
X-Gm-Message-State: APjAAAV9eLdgrRKrbbKDptFXL2u55sgEyPrbQwyXuQ979uVCGQsKHnoD
 KtfM8O4eX+jSsDet3R7JEF1AMZXW
X-Google-Smtp-Source: APXvYqz8zPhN+3gqixh/1u34JSX5Sr7ON+vJLlYo4OMJNPtS1dP1A7/qxd+EdZZaRHp5MUnuuIAL6A==
X-Received: by 2002:ad4:424b:: with SMTP id l11mr17377995qvq.145.1566426261159; 
 Wed, 21 Aug 2019 15:24:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/37] drm/amdgpu: add set_gfx_cgpg implement (v2)
Date: Wed, 21 Aug 2019 17:23:33 -0500
Message-Id: <20190821222359.13578-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkrJsaEV45byagJyMoVHCHajQlTfgC1bvBJEuICQCO8=;
 b=sQedWtlnRyMGvdJ5vjxhs6CivPWmSp4TuvZsD6OKhJ/8EDPc0N7kxi7qJ/HT9WUGFH
 GGWw+YGlbLOUnrMMTO+b6vl049gK9ZPA4N/tNxyLiUAdLNdOVNWyPSbAn83xS6SRwT49
 9VzjmM09sbuBHFLlfYAdxll36kfSHrBrgHWEpE5IzK6qmvXxCJ5EPKQC22QwPeOHydhw
 v2ngDZnZwegbtTja2m5BwjuFg5ttAwYez9Q0WyLfM03bCYU5g/NtFaeU1+zj9ghaMGJh
 UbGttXBFmf+oKb3GnIdDqUwFrw84+Ez5oM+xf0SKWQIolk5iuJ0+Cxsw5vrTGVnjadqJ
 Q2Kw==
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
 Aaron Liu <aaron.liu@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmFkZCBzZXRfZ2Z4X2NncGcgaW1w
bGVtZW50Cgp2MjogY2hlY2sgaWYgdXNpbmcgc3dfc211IChBbGV4KQoKU2lnbmVkLW9mZi1ieTog
QWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgICAgICB8ICA1
ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwg
IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYyAgICAgIHwg
MTAgKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggNmVlYTljNjc1ZDAxLi40OGY4ZDVhZTY3
ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNDU1MSw2ICs0NTUx
LDkgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfdXBkYXRlX2dmeF9jZ19wb3dlcl9nYXRpbmcoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB7CiAJYW1kZ3B1X2dmeF9ybGNfZW50ZXJfc2FmZV9t
b2RlKGFkZXYpOwogCisJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpICYmICFlbmFibGUpCisJ
CXNtdV9zZXRfZ2Z4X2NncGcoJmFkZXYtPnNtdSwgZW5hYmxlKTsKKwogCWlmICgoYWRldi0+cGdf
ZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9HRlhfUEcpICYmIGVuYWJsZSkgewogCQlnZnhfdjlfMF9l
bmFibGVfZ2Z4X2NnX3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKIAkJaWYgKGFkZXYtPnBnX2Zs
YWdzICYgQU1EX1BHX1NVUFBPUlRfR0ZYX1BJUEVMSU5FKQpAQCAtNDgyNiw2ICs0ODI5LDggQEAg
c3RhdGljIGludCBnZnhfdjlfMF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAog
CQkJZ2Z4X3Y5XzBfZW5hYmxlX2NwX3Bvd2VyX2dhdGluZyhhZGV2LCBmYWxzZSk7CiAKIAkJLyog
dXBkYXRlIGdmeCBjZ3BnIHN0YXRlICovCisJCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSAm
JiBlbmFibGUpCisJCQlzbXVfc2V0X2dmeF9jZ3BnKCZhZGV2LT5zbXUsIGVuYWJsZSk7CiAJCWdm
eF92OV8wX3VwZGF0ZV9nZnhfY2dfcG93ZXJfZ2F0aW5nKGFkZXYsIGVuYWJsZSk7CiAKIAkJLyog
dXBkYXRlIG1nY2cgc3RhdGUgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCmluZGV4IDYwNTc2N2U3OTk5Ni4uN2IzNTJjNWE0NTFlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAgLTQ3NSw2
ICs0NzUsNyBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJaW50ICgqY2hlY2tfZndfdmVyc2lvbikoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKnBvd2VyZ2F0ZV9zZG1hKShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgYm9vbCBnYXRlKTsKIAlpbnQgKCpwb3dlcmdhdGVfdmNuKShzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgYm9vbCBnYXRlKTsKKwlpbnQgKCpzZXRfZ2Z4X2NncGcpKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSk7CiAJaW50ICgqd3JpdGVfcHB0YWJsZSko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKnNldF9taW5fZGNlZl9kZWVwX3NsZWVw
KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50ICgqc2V0X3Rvb2xfdGFibGVfbG9jYXRp
b24pKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKQEAgLTU1NSw2ICs1NTYsOCBAQCBzdHJ1Y3Qg
c211X2Z1bmNzCiAJKChzbXUpLT5mdW5jcy0+cG93ZXJnYXRlX3NkbWEgPyAoc211KS0+ZnVuY3Mt
PnBvd2VyZ2F0ZV9zZG1hKChzbXUpLCAoZ2F0ZSkpIDogMCkKICNkZWZpbmUgc211X3Bvd2VyZ2F0
ZV92Y24oc211LCBnYXRlKSBcCiAJKChzbXUpLT5mdW5jcy0+cG93ZXJnYXRlX3ZjbiA/IChzbXUp
LT5mdW5jcy0+cG93ZXJnYXRlX3Zjbigoc211KSwgKGdhdGUpKSA6IDApCisjZGVmaW5lIHNtdV9z
ZXRfZ2Z4X2NncGcoc211LCBlbmFibGVkKSBcCisJKChzbXUpLT5mdW5jcy0+c2V0X2dmeF9jZ3Bn
ID8gKHNtdSktPmZ1bmNzLT5zZXRfZ2Z4X2NncGcoKHNtdSksIChlbmFibGVkKSkgOiAwKQogI2Rl
ZmluZSBzbXVfZ2V0X3ZiaW9zX2Jvb3R1cF92YWx1ZXMoc211KSBcCiAJKChzbXUpLT5mdW5jcy0+
Z2V0X3ZiaW9zX2Jvb3R1cF92YWx1ZXMgPyAoc211KS0+ZnVuY3MtPmdldF92Ymlvc19ib290dXBf
dmFsdWVzKChzbXUpKSA6IDApCiAjZGVmaW5lIHNtdV9nZXRfY2xrX2luZm9fZnJvbV92Ymlvcyhz
bXUpIFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8wLmMKaW5kZXggNjk1
YjlhZjg2NjJiLi5jZjUyM2I4YjJhZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTJfMC5jCkBAIC0xOTgsNiArMTk4LDE1IEBAIHN0YXRpYyBpbnQgc211X3YxMl8wX3Bv
d2VyZ2F0ZV92Y24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZ2F0ZSkKIAkJcmV0dXJu
IHNtdV9zZW5kX3NtY19tc2coc211LCBTTVVfTVNHX1Bvd2VyVXBWY24pOwogfQogCitzdGF0aWMg
aW50IHNtdV92MTJfMF9zZXRfZ2Z4X2NncGcoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wg
ZW5hYmxlKQoreworCWlmICghKHNtdS0+YWRldi0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9H
RlhfUEcpKQorCQlyZXR1cm4gMDsKKworCXJldHVybiBzbXVfdjEyXzBfc2VuZF9tc2dfd2l0aF9w
YXJhbShzbXUsCisJCVNNVV9NU0dfU2V0R2Z4Q0dQRywgZW5hYmxlID8gMSA6IDApOworfQorCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHNtdV9mdW5jcyBzbXVfdjEyXzBfZnVuY3MgPSB7CiAJLmNoZWNr
X2Z3X3N0YXR1cyA9IHNtdV92MTJfMF9jaGVja19md19zdGF0dXMsCiAJLmNoZWNrX2Z3X3ZlcnNp
b24gPSBzbXVfdjEyXzBfY2hlY2tfZndfdmVyc2lvbiwKQEAgLTIwNiw2ICsyMTUsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNtdV9mdW5jcyBzbXVfdjEyXzBfZnVuY3MgPSB7CiAJLnNlbmRfc21j
X21zZyA9IHNtdV92MTJfMF9zZW5kX21zZywKIAkuc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0gPSBz
bXVfdjEyXzBfc2VuZF9tc2dfd2l0aF9wYXJhbSwKIAkucmVhZF9zbWNfYXJnID0gc211X3YxMl8w
X3JlYWRfYXJnLAorCS5zZXRfZ2Z4X2NncGcgPSBzbXVfdjEyXzBfc2V0X2dmeF9jZ3BnLAogfTsK
IAogdm9pZCBzbXVfdjEyXzBfc2V0X3NtdV9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
