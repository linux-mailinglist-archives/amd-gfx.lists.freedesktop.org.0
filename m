Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B669E07
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834E89E08;
	Mon, 15 Jul 2019 21:25:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2989E05
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:03 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 44so17214647qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLCW/JuBuzB5U3FbV/MRhQy+xt20wVBdUYcOo/A5VQw=;
 b=IOpBToVYKSq9XPxAQC1xFPJ8KxQhy3jYQWKkn2Y/pz4vGUBGeBiBo0yrjPH5FLBawt
 veH39utifTGofHPJfhC/VWdreWkznAjbqw4rOe3RbsDSAjExzWNG3RUg++X8+3PStkD9
 qDndD1jn22iqyu/CfXnpcVFX6VQs30Epuh52tsV6IhJeqkanMPGvtkyamXAx1R2yvYHE
 Jt6D6WuqIVvzgktvDDH0t+LTwEniZWS8QtZAnXldu0EZngiID8x3D7ugaXvGiLEvpP3s
 pUhZK2s2h7Tin43ouRo2nrgz7my2Gg4v7f6HswIAMiAu5cooqkGfrFd7b1IlDKFqGjPX
 oGFg==
X-Gm-Message-State: APjAAAWSpuWn2FyMN7vbjMdeCctiGNs2LbDE0QJKlbiVDUUrArLG3Mof
 mMjvGrg2xQ7OFr1zvN3qvaY368Mi
X-Google-Smtp-Source: APXvYqxTc2OtSIOnH0Wu2AFDLKwVal/ieuySOk1QsIH3vG2OZ+N83ouaGvrz2PlLbGA3VsIyb5RV7Q==
X-Received: by 2002:ad4:4a92:: with SMTP id h18mr20795219qvx.235.1563225902796; 
 Mon, 15 Jul 2019 14:25:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 020/102] drm/amdgpu: support hdp flush for more sdma instances
Date: Mon, 15 Jul 2019 16:23:15 -0500
Message-Id: <20190715212437.31793-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLCW/JuBuzB5U3FbV/MRhQy+xt20wVBdUYcOo/A5VQw=;
 b=Pha2dVMo0GkrwzCxZOjOb/EaLHk+rPUZ15/PNgXa+hMERQk8rm4wekpvMKAZ5u4kxp
 4YT218jI8d1RxKUZ+ZxRNXhwwJvPtIm/uw2azInlSOHbPVqbJaTXpS7hSRKe0RoKvVpX
 Cc+NN3EgMgXwqqxx5fJ7wDYzK+3afuMeq/jBQKosNsd4pRhLtFYe0fdQRBgG2HQxceNK
 jpcXkRbKbNSLM6Ex7I91xFfG3aZE2Bv8NiMsyz9MIPE8d5PiauKru2tM/1/hSJWWJN1R
 Y+/bDUfvr3h/9unAuNaAad6q7+UtrSLK0lclLoWcSyf5UIFIQdCqVQUnX/FWKbe6zTgc
 JrqQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpUaGUgYml0IFJTVkRfRU5HMCB0byBSU1ZEX0VO
RzUgaW4gR1BVX0hEUF9GTFVTSF9SRVEvR1BVX0hEUF9GTFVTSF9ET05FCmNhbiBiZSBsZXZlcmFn
ZWQgZm9yIHNkbWEgaW5zdGFuY2UgMn43IHRvIHBvbGwgcmVnaXN0ZXIvbWVtb3J5LgoKU2lnbmVk
LW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CkFja2VkLWJ5OiBTbm93IFpoYW5nIDwgU25v
dy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
ICAgfCAgNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jIHwg
MTcgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRf
MC5jIHwgIDUgKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDg1NzVlZDY3MTNj
My4uZTljMzg2Y2VjMmFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAtNjUx
LDYgKzY1MSwxMiBAQCBzdHJ1Y3QgbmJpb19oZHBfZmx1c2hfcmVnIHsKIAl1MzIgcmVmX2FuZF9t
YXNrX2NwOTsKIAl1MzIgcmVmX2FuZF9tYXNrX3NkbWEwOwogCXUzMiByZWZfYW5kX21hc2tfc2Rt
YTE7CisJdTMyIHJlZl9hbmRfbWFza19zZG1hMjsKKwl1MzIgcmVmX2FuZF9tYXNrX3NkbWEzOwor
CXUzMiByZWZfYW5kX21hc2tfc2RtYTQ7CisJdTMyIHJlZl9hbmRfbWFza19zZG1hNTsKKwl1MzIg
cmVmX2FuZF9tYXNrX3NkbWE2OworCXUzMiByZWZfYW5kX21hc2tfc2RtYTc7CiB9OwogCiBzdHJ1
Y3QgYW1kZ3B1X21taW9fcmVtYXAgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQu
YwppbmRleCBiZmFhYTMyN2FlM2MuLjJlMTA5OGM1YzMyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbmJpb192N180LmMKQEAgLTMxLDYgKzMxLDE3IEBACiAKICNkZWZpbmUgc21uTkJJRl9N
R0NHX0NUUkxfTENMSwkweDEwMTNhMjFjCiAKKy8qCisgKiBUaGVzZSBhcmUgbmJpbyB2N180XzEg
cmVnaXN0ZXJzIG1hc2suIFRlbXBvcmFyaWx5IGRlZmluZSB0aGVzZSBoZXJlIHNpbmNlCisgKiBu
YmlvIHY3XzRfMSBoZWFkZXIgaXMgaW5jb21wbGV0ZS4KKyAqLworI2RlZmluZSBHUFVfSERQX0ZM
VVNIX0RPTkVfX1JTVkRfRU5HMF9NQVNLCTB4MDAwMDEwMDBMCisjZGVmaW5lIEdQVV9IRFBfRkxV
U0hfRE9ORV9fUlNWRF9FTkcxX01BU0sJMHgwMDAwMjAwMEwKKyNkZWZpbmUgR1BVX0hEUF9GTFVT
SF9ET05FX19SU1ZEX0VORzJfTUFTSwkweDAwMDA0MDAwTAorI2RlZmluZSBHUFVfSERQX0ZMVVNI
X0RPTkVfX1JTVkRfRU5HM19NQVNLCTB4MDAwMDgwMDBMCisjZGVmaW5lIEdQVV9IRFBfRkxVU0hf
RE9ORV9fUlNWRF9FTkc0X01BU0sJMHgwMDAxMDAwMEwKKyNkZWZpbmUgR1BVX0hEUF9GTFVTSF9E
T05FX19SU1ZEX0VORzVfTUFTSwkweDAwMDIwMDAwTAorCiBzdGF0aWMgdm9pZCBuYmlvX3Y3XzRf
cmVtYXBfaGRwX3JlZ2lzdGVycyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlXUkVH
MzJfU09DMTUoTkJJTywgMCwgbW1SRU1BUF9IRFBfTUVNX0ZMVVNIX0NOVEwsCkBAIC0yMjAsNiAr
MjMxLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmJpb19oZHBfZmx1c2hfcmVnIG5iaW9fdjdf
NF9oZHBfZmx1c2hfcmVnID0gewogCS5yZWZfYW5kX21hc2tfY3A5ID0gR1BVX0hEUF9GTFVTSF9E
T05FX19DUDlfTUFTSywKIAkucmVmX2FuZF9tYXNrX3NkbWEwID0gR1BVX0hEUF9GTFVTSF9ET05F
X19TRE1BMF9NQVNLLAogCS5yZWZfYW5kX21hc2tfc2RtYTEgPSBHUFVfSERQX0ZMVVNIX0RPTkVf
X1NETUExX01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hMiA9IEdQVV9IRFBfRkxVU0hfRE9ORV9f
UlNWRF9FTkcwX01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hMyA9IEdQVV9IRFBfRkxVU0hfRE9O
RV9fUlNWRF9FTkcxX01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hNCA9IEdQVV9IRFBfRkxVU0hf
RE9ORV9fUlNWRF9FTkcyX01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hNSA9IEdQVV9IRFBfRkxV
U0hfRE9ORV9fUlNWRF9FTkczX01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hNiA9IEdQVV9IRFBf
RkxVU0hfRE9ORV9fUlNWRF9FTkc0X01BU0ssCisJLnJlZl9hbmRfbWFza19zZG1hNyA9IEdQVV9I
RFBfRkxVU0hfRE9ORV9fUlNWRF9FTkc1X01BU0ssCiB9OwogCiBzdGF0aWMgdm9pZCBuYmlvX3Y3
XzRfZGV0ZWN0X2h3X3ZpcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IDFkY2U5NzRlMGM1OC4uZmMwMTUwMmJhZjAw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtNjI3LDEwICs2Mjcs
NyBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y0XzBfcmluZ19lbWl0X2hkcF9mbHVzaChzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcpCiAJdTMyIHJlZl9hbmRfbWFzayA9IDA7CiAJY29uc3Qgc3RydWN0IG5i
aW9faGRwX2ZsdXNoX3JlZyAqbmJpb19oZl9yZWcgPSBhZGV2LT5uYmlvX2Z1bmNzLT5oZHBfZmx1
c2hfcmVnOwogCi0JaWYgKHJpbmctPm1lID09IDApCi0JCXJlZl9hbmRfbWFzayA9IG5iaW9faGZf
cmVnLT5yZWZfYW5kX21hc2tfc2RtYTA7Ci0JZWxzZQotCQlyZWZfYW5kX21hc2sgPSBuYmlvX2hm
X3JlZy0+cmVmX2FuZF9tYXNrX3NkbWExOworCXJlZl9hbmRfbWFzayA9IG5iaW9faGZfcmVnLT5y
ZWZfYW5kX21hc2tfc2RtYTAgPDwgcmluZy0+bWU7CiAKIAlzZG1hX3Y0XzBfd2FpdF9yZWdfbWVt
KHJpbmcsIDAsIDEsCiAJCQkgICAgICAgYWRldi0+bmJpb19mdW5jcy0+Z2V0X2hkcF9mbHVzaF9k
b25lX29mZnNldChhZGV2KSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
