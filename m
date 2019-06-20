Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDCD4C450
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 02:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DBF6E483;
	Thu, 20 Jun 2019 00:02:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6B86E483
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 00:02:24 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u13so218228iop.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 17:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9lP0nsvUloe99Ox0ZU5tzwKh7CeGDS+T2vSutdDSAw=;
 b=S9/lL4yN193qgYViOX7VjZrL1FG39/t0zsUH+MxeO/8n7KcvLjF4owVeB/+JTSLs+1
 l8yJk0NywqvJPl6SKXN/rMBopAQjKFa99f2MUlkAHjRNtNoRI4As4NFfK+EmZ3sdb/24
 4fa3ytsbHnI3LC9uU0e+1qJuTEs85cY6oKCqU+B4WVUog3OrMIg9kDTSK7UzdXh+fTgD
 NNrooUVDKtnZxQDRcRYHdR1d88eVElS7GLOc4Yw4LeoQGmllOxg6Eqk2HSjPt1oHYhWz
 4XKYoGrQlL8tAQQqszH3hKSDAbD/hEGgLxoQbGEtOlsOspaeeS6igeuFSQVdu/hMHPpF
 HQ2A==
X-Gm-Message-State: APjAAAUryYUY7QhA3rMKdvArZPKN/rxejf0JDyS9fayP1tF0X9jQr85T
 gD3aw/RYVAaRNZtLM3NQrcKLTxkk
X-Google-Smtp-Source: APXvYqyL08ccPV0amvPaIZgehT7I0PFjsimEB9+nFBA/zJjxlkKgDzmy0DSWpqBzvHoK3eq6c8iBiQ==
X-Received: by 2002:a6b:fb02:: with SMTP id h2mr8736611iog.289.1560988943525; 
 Wed, 19 Jun 2019 17:02:23 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id s6sm14047489ioo.31.2019.06.19.17.02.22
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 17:02:22 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: fix transform feedback GDS hang on gfx10
Date: Wed, 19 Jun 2019 20:02:15 -0400
Message-Id: <20190620000216.14272-1-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9lP0nsvUloe99Ox0ZU5tzwKh7CeGDS+T2vSutdDSAw=;
 b=DyipGhyXJT29eEumo6W2bXysDlCYBLfg6IrCjt3PYkyl44VLZAc2tw67pQ53Q6sgg2
 VXxuQcEfjzxXkXR4frqsj/HOSzoeWiWYqepGQaBnHWn2L+MNerO7QjJLVj6cmrJBBk9m
 KRLF/bMN/wb6Fukkh5pgnepz39ImuIrRogJysuG9iwFqgGNXAAzRPqrc3dAyotYNeowv
 1CSlmVTHhdFM6oH+MDfZAkIbEFZbsiUw8p8NncdQdI6m8aGQx8liSJyY/eOwXy6OEy0G
 /Yd3oAf0QELsCtTtPE4hedZCqpcWyQZRb08mZToCsEo+LebM+qHC9elQJ862UMGieOhN
 E6ug==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5oIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYyAgfCAxMiArKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2RzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2RzLmgKaW5kZXggZGFkMjE4NmY0ZWQ1Li5kZjhhMjM1NTQ4MzEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZHMuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2RzLmgKQEAgLTI0LDIxICsyNCwyMiBAQAogI2lmbmRl
ZiBfX0FNREdQVV9HRFNfSF9fCiAjZGVmaW5lIF9fQU1ER1BVX0dEU19IX18KIAogc3RydWN0IGFt
ZGdwdV9yaW5nOwogc3RydWN0IGFtZGdwdV9ibzsKIAogc3RydWN0IGFtZGdwdV9nZHMgewogCXVp
bnQzMl90IGdkc19zaXplOwogCXVpbnQzMl90IGd3c19zaXplOwogCXVpbnQzMl90IG9hX3NpemU7
Ci0JdWludDMyX3QJCQlnZHNfY29tcHV0ZV9tYXhfd2F2ZV9pZDsKKwl1aW50MzJfdCBnZHNfY29t
cHV0ZV9tYXhfd2F2ZV9pZDsKKwl1aW50MzJfdCB2Z3RfZ3NfbWF4X3dhdmVfaWQ7CiB9OwogCiBz
dHJ1Y3QgYW1kZ3B1X2dkc19yZWdfb2Zmc2V0IHsKIAl1aW50MzJfdAltZW1fYmFzZTsKIAl1aW50
MzJfdAltZW1fc2l6ZTsKIAl1aW50MzJfdAlnd3M7CiAJdWludDMyX3QJb2E7CiB9OwogCiAjZW5k
aWYgLyogX19BTURHUFVfR0RTX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYwppbmRleCAwMDkwY2JhMmQyNGQuLjc1YTM0Nzc5YTU3YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQyMTMsMjAgKzQyMTMsMjkgQEAgc3RhdGljIHZvaWQg
Z2Z4X3YxMF8wX3JpbmdfZW1pdF9oZHBfZmx1c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQog
fQogCiBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X2liX2dmeChzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsCiAJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IsCiAJCQkJICAg
ICAgIHN0cnVjdCBhbWRncHVfaWIgKmliLAogCQkJCSAgICAgICB1aW50MzJfdCBmbGFncykKIHsK
IAl1bnNpZ25lZCB2bWlkID0gQU1ER1BVX0pPQl9HRVRfVk1JRChqb2IpOwogCXUzMiBoZWFkZXIs
IGNvbnRyb2wgPSAwOwogCisJLyogUHJldmVudCBhIGh3IGRlYWRsb2NrIGR1ZSB0byBhIHdhdmUg
SUQgbWlzbWF0Y2ggYmV0d2VlbiBNRSBhbmQgR0RTLgorCSAqIFRoaXMgcmVzZXRzIHRoZSB3YXZl
IElEIGNvdW50ZXJzLiAobmVlZGVkIGJ5IHRyYW5zZm9ybSBmZWVkYmFjaykKKwkgKiBUT0RPOiBU
aGlzIG1pZ2h0IG9ubHkgYmUgbmVlZGVkIG9uIGEgVk1JRCBzd2l0Y2ggd2hlbiB3ZSBjaGFuZ2UK
KwkgKiAgICAgICB0aGUgR0RTIE9BIG1hcHBpbmcsIG5vdCBzdXJlLgorCSAqLworCWFtZGdwdV9y
aW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19TRVRfQ09ORklHX1JFRywgMSkpOworCWFt
ZGdwdV9yaW5nX3dyaXRlKHJpbmcsIG1tVkdUX0dTX01BWF9XQVZFX0lEKTsKKwlhbWRncHVfcmlu
Z193cml0ZShyaW5nLCByaW5nLT5hZGV2LT5nZHMudmd0X2dzX21heF93YXZlX2lkKTsKKwogCWlm
IChpYi0+ZmxhZ3MgJiBBTURHUFVfSUJfRkxBR19DRSkKIAkJaGVhZGVyID0gUEFDS0VUMyhQQUNL
RVQzX0lORElSRUNUX0JVRkZFUl9DTlNULCAyKTsKIAllbHNlCiAJCWhlYWRlciA9IFBBQ0tFVDMo
UEFDS0VUM19JTkRJUkVDVF9CVUZGRVIsIDIpOwogCiAJY29udHJvbCB8PSBpYi0+bGVuZ3RoX2R3
IHwgKHZtaWQgPDwgMjQpOwogCiAJaWYgKGFtZGdwdV9tY2JwICYmIChpYi0+ZmxhZ3MgJiBBTURH
UFVfSUJfRkxBR19QUkVFTVBUKSkgewogCQljb250cm9sIHw9IElORElSRUNUX0JVRkZFUl9QUkVf
RU5CKDEpOwogCkBAIC01MDk0LDI0ICs1MTAzLDIzIEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9z
ZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWRlZmF1bHQ6CiAJCWJy
ZWFrOwogCX0KIH0KIAogc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9nZHNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAkvKiBpbml0IGFzaWMgZ2RzIGluZm8gKi8KIAlzd2l0
Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6Ci0JCWFkZXYtPmdkcy5n
ZHNfc2l6ZSA9IDB4MTAwMDA7Ci0JCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWFkZXYtPmdkcy5nZHNf
c2l6ZSA9IDB4MTAwMDA7CisJCWFkZXYtPmdkcy52Z3RfZ3NfbWF4X3dhdmVfaWQgPSAweDNmZjsK
IAkJYnJlYWs7CiAJfQogCiAJYWRldi0+Z2RzLmd3c19zaXplID0gNjQ7CiAJYWRldi0+Z2RzLm9h
X3NpemUgPSAxNjsKIH0KIAogc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF91c2VyX3dncF9pbmFj
dGl2ZV9iaXRtYXBfcGVyX3NoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkJCSAg
dTMyIGJpdG1hcCkKIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
