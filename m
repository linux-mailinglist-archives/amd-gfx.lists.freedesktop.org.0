Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA3FE34C
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Nov 2019 17:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F58D6E995;
	Fri, 15 Nov 2019 16:51:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C4C6E958
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 16:50:58 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m4so8596274qke.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 08:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVgxIWcj/FlBXGVRaxV/L0LEMIri/0ix2aG74MCVJXk=;
 b=XSEoylnDvEPHZIeiMgGdqHulq5CEr25dOxo55CP/Qc7ou4CUv0ybVB/wNaFIdJcQdH
 +nM7i8+P1L5uSzW7RFv6D23oZbAvenKPgD6iR6LorItY5hJODQwwlHvC3NBPE/maBPfp
 kfx4PqlHLlTcQdn5mnxXmEgOPO+aBsu83p3zj+Ud7iTtI19yVFXQIr0gLcPFkbncbp7Y
 OJuF6UrQD/EkjVl4zxDLtbuzIgP4Foq+6myx4C0ZFKuEkAn+wSkrATJlzaOlRl6MaDPT
 sly4oIbPADsQHy+JILe0zRt4D4rNIg1bSgYgcyCz38PsWK+XlaqXFJBj89D4lh16ywBq
 KH4w==
X-Gm-Message-State: APjAAAXwu+ogCIxe1YcSxZQsIcbYC8BUuBvqD2txmwlMBSklsEafnMnA
 XWTqvFE7JgmKdcVnTtR0u+JY5OJs
X-Google-Smtp-Source: APXvYqxnjq/dwG0B6CwHz8/cih7zvaLEoyqrP+kPLCcDv82B75tw/9bA1xo8eNQl8pBhGSgHHbGu3Q==
X-Received: by 2002:a37:6354:: with SMTP id x81mr5613352qkb.316.1573836657090; 
 Fri, 15 Nov 2019 08:50:57 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:56 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Subject: [PATCH 10/20] drm/amdgpu: split swSMU baco_reset into enter and exit
Date: Fri, 15 Nov 2019 11:50:28 -0500
Message-Id: <20191115165038.56646-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVgxIWcj/FlBXGVRaxV/L0LEMIri/0ix2aG74MCVJXk=;
 b=kud+mVtwM4rBQutreGW53E9Hq6DXKEs+Ac5s249ubn6wUvx7duqSUGFxGYvKgm0mcD
 r+dX81XgCJ5UKPGfQxiPNqvYGr5Y64hhUqsRzMkyN//FF1OLZtsqSsxFxPev0m2OWn24
 VXxnkarpX7HIfhy5vRpzfQ9QcS1taCDoijlHOw8rjOpuCBzCXOJNnBOe4w/3x+6aQSIS
 fgvUGzd6GLvTPIevLgLm0C3ZQauWNDNmdqDjFBrF66b6bWvq9l91Nm00SkPsT7+IO+aM
 oTrpFH7a672Twqy9HT0d4WD0zKmJrJ3yhzuL4XAciJQrOOv+EGPauCaUQuiZ/oQ+RYif
 C+cQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QkFDTyAtIEJ1cyBBY3RpdmUsIENoaXAgT2ZmCgpTbyB3ZSBjYW4gdXNlIGl0IGZvciBwb3dlciBz
YXZpbmdzIHJhdGhlciB0aGFuIGp1c3QgcmVzZXQuCgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgICAg
ICAgICAgICAgICB8ICA3ICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgICAgICAgICAgICB8IDEwICsrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYyAgICB8IDIwICsrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jICB8ICAzICsrLQogLi4uL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggfCAgMyArKy0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICB8ICAzICsrLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgIHwgIDkgKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAgfCAgMyArKy0KIDkgZmlsZXMg
Y2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMKaW5kZXggYjI1YjcyYTczMDQ4Li43YjE5YTgzODE2NzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYwpAQCAtMzUyLDcgKzM1MiwxMiBAQCBzdGF0aWMgaW50IG52X2FzaWNfcmVzZXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKG52X2FzaWNfcmVzZXRfbWV0aG9kKGFk
ZXYpID09IEFNRF9SRVNFVF9NRVRIT0RfQkFDTykgewogCQlpZiAoIWFkZXYtPmluX3N1c3BlbmQp
CiAJCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2KTsKLQkJcmV0ID0gc211X2JhY29fcmVzZXQo
c211KTsKKwkJcmV0ID0gc211X2JhY29fZW50ZXIoc211KTsKKwkJaWYgKHJldCkKKwkJCXJldHVy
biByZXQ7CisJCXJldCA9IHNtdV9iYWNvX2V4aXQoc211KTsKKwkJaWYgKHJldCkKKwkJCXJldHVy
biByZXQ7CiAJfSBlbHNlIHsKIAkJaWYgKCFhZGV2LT5pbl9zdXNwZW5kKQogCQkJYW1kZ3B1X2lu
Y192cmFtX2xvc3QoYWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCAxYWNi
YjM4ZjYzODQuLjNlMzdhM2FmNTllYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBA
IC01MDksOSArNTA5LDE1IEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7
CiAJCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKKwkJaW50IHJldDsKIAot
CQlpZiAoc211X2JhY29fcmVzZXQoc211KSkKLQkJCXJldHVybiAtRUlPOworCQlyZXQgPSBzbXVf
YmFjb19lbnRlcihzbXUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQlyZXQgPSBz
bXVfYmFjb19leGl0KHNtdSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OwogCX0gZWxzZSB7
CiAJCXZvaWQgKnBwX2hhbmRsZSA9IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7CiAJCWNvbnN0
IHN0cnVjdCBhbWRfcG1fZnVuY3MgKnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNz
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDc1M2Mx
YWZjZmFhMy4uMzU2YmUyMjkxMGRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jCkBAIC0yNDI4LDE0ICsyNDI4LDI4IEBAIGludCBzbXVfYmFjb19nZXRfc3Rh
dGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2JhY29fc3RhdGUgKnN0YXRlKQog
CXJldHVybiAwOwogfQogCi1pbnQgc211X2JhY29fcmVzZXQoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCitpbnQgc211X2JhY29fZW50ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJaW50
IHJldCA9IDA7CiAKIAltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsKIAotCWlmIChzbXUtPnBwdF9m
dW5jcy0+YmFjb19yZXNldCkKLQkJcmV0ID0gc211LT5wcHRfZnVuY3MtPmJhY29fcmVzZXQoc211
KTsKKwlpZiAoc211LT5wcHRfZnVuY3MtPmJhY29fZW50ZXIpCisJCXJldCA9IHNtdS0+cHB0X2Z1
bmNzLT5iYWNvX2VudGVyKHNtdSk7CisKKwltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOworCisJ
cmV0dXJuIHJldDsKK30KKworaW50IHNtdV9iYWNvX2V4aXQoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCit7CisJaW50IHJldCA9IDA7CisKKwltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsKKworCWlm
IChzbXUtPnBwdF9mdW5jcy0+YmFjb19leGl0KQorCQlyZXQgPSBzbXUtPnBwdF9mdW5jcy0+YmFj
b19leGl0KHNtdSk7CiAKIAltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCmluZGV4IDU4YzdjNGEzMDUzZS4u
ZjI1MWU0MDIxNDdjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
cmN0dXJ1c19wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1
c19wcHQuYwpAQCAtMjE1Niw3ICsyMTU2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsKIAkuYmFjb19pc19zdXBwb3J0PSBzbXVfdjEx
XzBfYmFjb19pc19zdXBwb3J0LAogCS5iYWNvX2dldF9zdGF0ZSA9IHNtdV92MTFfMF9iYWNvX2dl
dF9zdGF0ZSwKIAkuYmFjb19zZXRfc3RhdGUgPSBzbXVfdjExXzBfYmFjb19zZXRfc3RhdGUsCi0J
LmJhY29fcmVzZXQgPSBzbXVfdjExXzBfYmFjb19yZXNldCwKKwkuYmFjb19lbnRlciA9IHNtdV92
MTFfMF9iYWNvX2VudGVyLAorCS5iYWNvX2V4aXQgPSBzbXVfdjExXzBfYmFjb19leGl0LAogCS5n
ZXRfZHBtX3VsdGltYXRlX2ZyZXEgPSBzbXVfdjExXzBfZ2V0X2RwbV91bHRpbWF0ZV9mcmVxLAog
CS5zZXRfc29mdF9mcmVxX2xpbWl0ZWRfcmFuZ2UgPSBzbXVfdjExXzBfc2V0X3NvZnRfZnJlcV9s
aW1pdGVkX3JhbmdlLAogCS5vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMgPSBzbXVfdjExXzBfb3Zl
cnJpZGVfcGNpZV9wYXJhbWV0ZXJzLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKaW5kZXggOTk5NDQ1YzVjMDEwLi43MjVhY2Q2ZDVlMDAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtNTQy
LDcgKzU0Miw4IEBAIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsKIAlib29sICgqYmFjb19pc19zdXBw
b3J0KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJZW51bSBzbXVfYmFjb19zdGF0ZSAoKmJh
Y29fZ2V0X3N0YXRlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50ICgqYmFjb19zZXRf
c3RhdGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9iYWNvX3N0YXRlIHN0YXRl
KTsKLQlpbnQgKCpiYWNvX3Jlc2V0KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CisJaW50ICgq
YmFjb19lbnRlcikoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOworCWludCAoKmJhY29fZXhpdCko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKm1vZGUyX3Jlc2V0KShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSk7CiAJaW50ICgqZ2V0X2RwbV91bHRpbWF0ZV9mcmVxKShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsIHVpbnQzMl90ICptaW4s
IHVpbnQzMl90ICptYXgpOwogCWludCAoKnNldF9zb2Z0X2ZyZXFfbGltaXRlZF9yYW5nZSkoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLCB1aW50MzJf
dCBtaW4sIHVpbnQzMl90IG1heCk7CkBAIC02MjQsNyArNjI1LDggQEAgYm9vbCBzbXVfYmFjb19p
c19zdXBwb3J0KHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAogaW50IHNtdV9iYWNvX2dldF9z
dGF0ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfYmFjb19zdGF0ZSAqc3RhdGUp
OwogCi1pbnQgc211X2JhY29fcmVzZXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOworaW50IHNt
dV9iYWNvX2VudGVyKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKK2ludCBzbXVfYmFjb19leGl0
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAogaW50IHNtdV9tb2RlMl9yZXNldChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9zbXVfdjExXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9zbXVfdjExXzAuaAppbmRleCA2MDYxNDkwODU2ODMuLjVhMjc3MTM2ZjJhYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjQ4LDcgKzI0
OCw4IEBAIGVudW0gc211X2JhY29fc3RhdGUgc211X3YxMV8wX2JhY29fZ2V0X3N0YXRlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KTsKIAogaW50IHNtdV92MTFfMF9iYWNvX3NldF9zdGF0ZShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfYmFjb19zdGF0ZSBzdGF0ZSk7CiAKLWludCBz
bXVfdjExXzBfYmFjb19yZXNldChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CitpbnQgc211X3Yx
MV8wX2JhY29fZW50ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOworaW50IHNtdV92MTFfMF9i
YWNvX2V4aXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCiBpbnQgc211X3YxMV8wX2dldF9k
cG1fdWx0aW1hdGVfZnJlcShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5
cGUgY2xrX3R5cGUsCiAJCQkJCQkgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCk7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMTRiZTM1MGE2MTI3
Li5mODQzZWNiMDlkYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKQEAgLTIwNjQsNyArMjA2NCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9m
dW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5iYWNvX2lzX3N1cHBvcnQ9IHNtdV92MTFfMF9i
YWNvX2lzX3N1cHBvcnQsCiAJLmJhY29fZ2V0X3N0YXRlID0gc211X3YxMV8wX2JhY29fZ2V0X3N0
YXRlLAogCS5iYWNvX3NldF9zdGF0ZSA9IHNtdV92MTFfMF9iYWNvX3NldF9zdGF0ZSwKLQkuYmFj
b19yZXNldCA9IHNtdV92MTFfMF9iYWNvX3Jlc2V0LAorCS5iYWNvX2VudGVyID0gc211X3YxMV8w
X2JhY29fZW50ZXIsCisJLmJhY29fZXhpdCA9IHNtdV92MTFfMF9iYWNvX2V4aXQsCiAJLmdldF9k
cG1fdWx0aW1hdGVfZnJlcSA9IHNtdV92MTFfMF9nZXRfZHBtX3VsdGltYXRlX2ZyZXEsCiAJLnNl
dF9zb2Z0X2ZyZXFfbGltaXRlZF9yYW5nZSA9IHNtdV92MTFfMF9zZXRfc29mdF9mcmVxX2xpbWl0
ZWRfcmFuZ2UsCiAJLm92ZXJyaWRlX3BjaWVfcGFyYW1ldGVycyA9IHNtdV92MTFfMF9vdmVycmlk
ZV9wY2llX3BhcmFtZXRlcnMsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jCmluZGV4IGZjOTY3OWVhMjM2OC4uNjA3MTUxMGVkMjA2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMTY4OCw3ICsxNjg4LDcgQEAgaW50IHNtdV92
MTFfMF9iYWNvX3NldF9zdGF0ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfYmFj
b19zdGF0ZSBzdGF0ZSkKIAlyZXR1cm4gcmV0OwogfQogCi1pbnQgc211X3YxMV8wX2JhY29fcmVz
ZXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCitpbnQgc211X3YxMV8wX2JhY29fZW50ZXIoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJaW50IHJldCA9IDA7CiAKQEAgLTE3MDIsNiArMTcw
MiwxMyBAQCBpbnQgc211X3YxMV8wX2JhY29fcmVzZXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
CiAKIAltc2xlZXAoMTApOwogCisJcmV0dXJuIHJldDsKK30KKworaW50IHNtdV92MTFfMF9iYWNv
X2V4aXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJaW50IHJldCA9IDA7CisKIAlyZXQg
PSBzbXVfdjExXzBfYmFjb19zZXRfc3RhdGUoc211LCBTTVVfQkFDT19TVEFURV9FWElUKTsKIAlp
ZiAocmV0KQogCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jCmluZGV4IDBiNDg5MjgzMzgwOC4uMDJlZGU1YzhiNzNhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0zMjU3LDcgKzMyNTcsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIwX3BwdF9mdW5jcyA9IHsKIAku
YmFjb19pc19zdXBwb3J0PSBzbXVfdjExXzBfYmFjb19pc19zdXBwb3J0LAogCS5iYWNvX2dldF9z
dGF0ZSA9IHNtdV92MTFfMF9iYWNvX2dldF9zdGF0ZSwKIAkuYmFjb19zZXRfc3RhdGUgPSBzbXVf
djExXzBfYmFjb19zZXRfc3RhdGUsCi0JLmJhY29fcmVzZXQgPSBzbXVfdjExXzBfYmFjb19yZXNl
dCwKKwkuYmFjb19lbnRlciA9IHNtdV92MTFfMF9iYWNvX2VudGVyLAorCS5iYWNvX2V4aXQgPSBz
bXVfdjExXzBfYmFjb19leGl0LAogCS5nZXRfZHBtX3VsdGltYXRlX2ZyZXEgPSBzbXVfdjExXzBf
Z2V0X2RwbV91bHRpbWF0ZV9mcmVxLAogCS5zZXRfc29mdF9mcmVxX2xpbWl0ZWRfcmFuZ2UgPSBz
bXVfdjExXzBfc2V0X3NvZnRfZnJlcV9saW1pdGVkX3JhbmdlLAogCS5vdmVycmlkZV9wY2llX3Bh
cmFtZXRlcnMgPSBzbXVfdjExXzBfb3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzLAotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
