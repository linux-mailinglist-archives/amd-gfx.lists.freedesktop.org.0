Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652148F8A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F8D89CDD;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA6889CAC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so12260273qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7txZvgBPb7Q374rR8VyPSyy/rxJujz6uLFX2NucFMUw=;
 b=P5QXh1RM8QdqS17yRYgB3VAlpa0DRJEpz7mTJgoM8YFwcUqGh3qfIDVS4eO1itUSOy
 E+cxwBpi7RpcbDH9r5ZZctwQL78eBhSn66fiLROIRxlxR8DMtZ6JmGC1GYBldR4vxOIL
 Fg4iuPytLomRIUba/jP6dXMNgq29mBncuef/2z/25f56gG4l5Zb9it/xdD+5pZ3Gno3f
 xow3iIK/uRm5diXa1xyAidv3KK+CIZCZe99QfijiOpS5WTdAS2bYFHquzBqApCZM1eK1
 UH4ghWGjSRelIQ77SKYtkv1/ACIBpj3ILGd2vnKV6w4xkFZvJWtyHDbeOnsk1dg70Tjm
 ckjw==
X-Gm-Message-State: APjAAAWH3uqujVAdcX1vB8eXPwporIkcKo0+GpuZgPaRsmtKASbDWY+c
 FoA+NxWd4DEGZm6RGebMY3OU+kke8K4=
X-Google-Smtp-Source: APXvYqwuzovM3iQR51LuE5tfKRJhjth82H53i6ybnFGjCedO3gluDZA2kXzpH59JyfpNpl3AzMEj+Q==
X-Received: by 2002:a0c:d4eb:: with SMTP id y40mr22816266qvh.30.1560799936962; 
 Mon, 17 Jun 2019 12:32:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 269/459] drm/amd/powerplay: move function get_metrics_table to
 vega20_ppt
Date: Mon, 17 Jun 2019 14:30:36 -0500
Message-Id: <20190617193106.18231-70-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7txZvgBPb7Q374rR8VyPSyy/rxJujz6uLFX2NucFMUw=;
 b=gEhu6wAeYSSRlZkUqvzSuosajfWkK/cJsXzK6JGRi8DShwaiYzjaHUwtZO0KgadczU
 9MCRqmRoJ2VtAYXJAY+06XyA+7n/uBqUZLuuAnR1zWSu/dZn/5JQUPMjhAgg7HdevqQX
 zDu+c7emWjciMBenug+Nhlfn6tQveXMwIy1owuF2a8mekDjB9o8AkbycNb+UswSMNE6q
 FzwzxnGMiE6JmdP5+tDiUbgjo9uubFnHhnge0VaIvJqLQbfQvydbfNQCydN4uzTKX8vo
 aafsQx+nzv/d8I4qVx20JTLWmyx+z3s9fBGYf/vRoPPMDNcbqUnKri5YKB8FKt2B78tu
 zdgg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBTbXVNZXRyaWNzX3Qg
dGFibGUgaXMgYXNpYyByZWxhdGVkIGRhdGEgc3RydWN0dXJlLgpzbyBtb3ZlIHZlZ2EyMF9wcHQg
ZmlsZSB0byBpbXBsZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2Fu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
ICAgIHwgIDYgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMg
ICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAg
IHwgMzYgKysrLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMgICAgfCAzNyArKysrKysrKysrKysrKysrLS0tCiA0IGZpbGVzIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDQ3MDZlYWYzOWNmNy4uMGZkM2Q4
OTM4NmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVf
c211LmgKQEAgLTQwNiw2ICs0MDYsOCBAQCBzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQKIAl2b2lk
CQkJCSpwb3dlcl9wbGF5X3RhYmxlOwogCXVpbnQzMl90CQkJcG93ZXJfcGxheV90YWJsZV9zaXpl
OwogCXZvaWQJCQkJKmhhcmRjb2RlX3BwdGFibGU7CisJdW5zaWduZWQgbG9uZwkJCW1ldHJpY3Nf
dGltZTsKKwl2b2lkCQkJCSptZXRyaWNzX3RhYmxlOwogCiAJdm9pZAkJCQkqbWF4X3N1c3RhaW5h
YmxlX2Nsb2NrczsKIAlzdHJ1Y3Qgc211X2Jpb3NfYm9vdF91cF92YWx1ZXMJYm9vdF92YWx1ZXM7
CkBAIC01MjQsOCArNTI2LDYgQEAgc3RydWN0IHNtdV9jb250ZXh0CiAKIAl1aW50MzJfdCBzbWNf
aWZfdmVyc2lvbjsKIAotCXVuc2lnbmVkIGxvbmcgbWV0cmljc190aW1lOwotCXZvaWQgKm1ldHJp
Y3NfdGFibGU7CiB9OwogCiBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CkBAIC01ODksNyArNTg5LDcg
QEAgc3RydWN0IHBwdGFibGVfZnVuY3MgewogCWludCAoKnNldF9wcGZlYXR1cmVfc3RhdHVzKShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDY0X3QgcHBmZWF0dXJlcyk7CiAJaW50ICgqZ2V0
X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBjaGFyICpidWYpOwog
CWJvb2wgKCppc19kcG1fcnVubmluZykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwotCXZvaWQg
KCp0YWJsZXNfaW5pdCkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGFibGUg
KnRhYmxlcyk7CisJaW50ICgqdGFibGVzX2luaXQpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBz
dHJ1Y3Qgc211X3RhYmxlICp0YWJsZXMpOwogCWludCAoKnNldF90aGVybWFsX2Zhbl90YWJsZSko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKmdldF9mYW5fc3BlZWRfcGVyY2VudCko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpzcGVlZCk7CiAJaW50ICgqc2V0X3dh
dGVybWFya3NfdGFibGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB2b2lkICp3YXRlcm1hcmtz
LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGQyMGQ0
OThhZjY3NS4uMTMwNzE5NjYzNTY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jCkBAIC00NzksNyArNDc5LDcgQEAgc3RhdGljIGludCBuYXZpMTBfc3RvcmVf
cG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiAwOwogfQog
Ci1zdGF0aWMgdm9pZCBuYXZpMTBfdGFibGVzX2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IHN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcykKK3N0YXRpYyBpbnQgbmF2aTEwX3RhYmxlc19pbml0
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3RhYmxlICp0YWJsZXMpCiB7CiAJ
U01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfUFBUQUJMRSwgc2l6ZW9mKFBQVGFibGVf
dCksCiAJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCAxODk2Y2UxZWNlNmIuLjUz
OGY1MmFiNGI3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMK
QEAgLTQwNyw3ICs0MDcsOSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9pbml0X3NtY190YWJsZXMo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAlzbXVfdGFibGUtPnRhYmxlcyA9IHRhYmxlczsK
IAotCXNtdV90YWJsZXNfaW5pdChzbXUsIHRhYmxlcyk7CisJcmV0ID0gc211X3RhYmxlc19pbml0
KHNtdSwgdGFibGVzKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJcmV0ID0gc211X3Yx
MV8wX2luaXRfZHBtX2NvbnRleHQoc211KTsKIAlpZiAocmV0KQpAQCAtNDI1LDggKzQyNywxMSBA
QCBzdGF0aWMgaW50IHNtdV92MTFfMF9maW5pX3NtY190YWJsZXMoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJa2ZyZWUoc211X3RhYmxlLT50YWJsZXMpOwor
CWtmcmVlKHNtdV90YWJsZS0+bWV0cmljc190YWJsZSk7CiAJc211X3RhYmxlLT50YWJsZXMgPSBO
VUxMOwogCXNtdV90YWJsZS0+dGFibGVfY291bnQgPSAwOworCXNtdV90YWJsZS0+bWV0cmljc190
YWJsZSA9IE5VTEw7CisJc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgPSAwOwogCiAJcmV0ID0gc211
X3YxMV8wX2ZpbmlfZHBtX2NvbnRleHQoc211KTsKIAlpZiAocmV0KQpAQCAtNDQ5LDEzICs0NTQs
NiBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9pbml0X3Bvd2VyKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQogCQlyZXR1cm4gLUVOT01FTTsKIAlzbXVfcG93ZXItPnBvd2VyX2NvbnRleHRfc2l6ZSA9
IHNpemVvZihzdHJ1Y3Qgc211XzExXzBfZHBtX2NvbnRleHQpOwogCi0Jc211LT5tZXRyaWNzX3Rp
bWUgPSAwOwotCXNtdS0+bWV0cmljc190YWJsZSA9IGt6YWxsb2Moc2l6ZW9mKFNtdU1ldHJpY3Nf
dCksIEdGUF9LRVJORUwpOwotCWlmICghc211LT5tZXRyaWNzX3RhYmxlKSB7Ci0JCWtmcmVlKHNt
dV9wb3dlci0+cG93ZXJfY29udGV4dCk7Ci0JCXJldHVybiAtRU5PTUVNOwotCX0KLQogCXJldHVy
biAwOwogfQogCkBAIC00NjgsOSArNDY2LDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfZmluaV9w
b3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlpZiAoIXNtdV9wb3dlci0+cG93ZXJfY29u
dGV4dCB8fCBzbXVfcG93ZXItPnBvd2VyX2NvbnRleHRfc2l6ZSA9PSAwKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAotCWtmcmVlKHNtdS0+bWV0cmljc190YWJsZSk7CiAJa2ZyZWUoc211X3Bvd2VyLT5w
b3dlcl9jb250ZXh0KTsKLQlzbXUtPm1ldHJpY3NfdGFibGUgPSBOVUxMOwogCXNtdV9wb3dlci0+
cG93ZXJfY29udGV4dCA9IE5VTEw7CiAJc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0X3NpemUgPSAw
OwogCkBAIC0xMjI3LDI2ICsxMjIzLDYgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc3RhcnRfdGhl
cm1hbF9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiByZXQ7CiB9CiAK
LXN0YXRpYyBpbnQgc211X3YxMV8wX2dldF9tZXRyaWNzX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAotCQlTbXVNZXRyaWNzX3QgKm1ldHJpY3NfdGFibGUpCi17Ci0JaW50IHJldCA9IDA7
Ci0KLQlpZiAoIXNtdS0+bWV0cmljc190aW1lIHx8IHRpbWVfYWZ0ZXIoamlmZmllcywgc211LT5t
ZXRyaWNzX3RpbWUgKyBIWiAvIDEwMDApKSB7Ci0JCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211
LCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsCi0JCQkJKHZvaWQgKiltZXRyaWNzX3RhYmxlLCBmYWxz
ZSk7Ci0JCWlmIChyZXQpIHsKLQkJCXByX2luZm8oIkZhaWxlZCB0byBleHBvcnQgU01VIG1ldHJp
Y3MgdGFibGUhXG4iKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KLQkJbWVtY3B5KHNtdS0+bWV0cmlj
c190YWJsZSwgbWV0cmljc190YWJsZSwgc2l6ZW9mKFNtdU1ldHJpY3NfdCkpOwotCQlzbXUtPm1l
dHJpY3NfdGltZSA9IGppZmZpZXM7Ci0JfSBlbHNlCi0JCW1lbWNweShtZXRyaWNzX3RhYmxlLCBz
bXUtPm1ldHJpY3NfdGFibGUsIHNpemVvZihTbXVNZXRyaWNzX3QpKTsKLQotCXJldHVybiByZXQ7
Ci19Ci0KIHN0YXRpYyBpbnQgc211X3YxMV8wX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCQkJCQkgICAgIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29y
LAogCQkJCQkgICAgIHVpbnQzMl90ICp2YWx1ZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYwppbmRleCA4MWZiNWI1ZDc2YmUuLmRkMzU0YTk5M2JmMSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwpAQCAtMjk0LDggKzI5NCwx
MCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfd29ya2xvYWRfdHlwZShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgZW51bSBQUF9TTUNfUE9XRVJfUAogCXJldHVybiB2YWw7CiB9CiAKLXN0YXRpYyB2
b2lkIHZlZ2EyMF90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNt
dV90YWJsZSAqdGFibGVzKQorc3RhdGljIGludCB2ZWdhMjBfdGFibGVzX2luaXQoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcykKIHsKKwlzdHJ1Y3Qgc211
X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKKwogCVNNVV9UQUJM
RV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1BQVEFCTEUsIHNpemVvZihQUFRhYmxlX3QpLAogCQkg
ICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKIAlTTVVfVEFCTEVfSU5J
VCh0YWJsZXMsIFNNVV9UQUJMRV9XQVRFUk1BUktTLCBzaXplb2YoV2F0ZXJtYXJrc190KSwKQEAg
LTMwOSw2ICszMTEsMTMgQEAgc3RhdGljIHZvaWQgdmVnYTIwX3RhYmxlc19pbml0KHN0cnVjdCBz
bXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3RhYmxlICp0YWJsZXMKIAlTTVVfVEFCTEVfSU5J
VCh0YWJsZXMsIFNNVV9UQUJMRV9BQ1RJVklUWV9NT05JVE9SX0NPRUZGLAogCQkgICAgICAgc2l6
ZW9mKERwbUFjdGl2aXR5TW9uaXRvckNvZWZmSW50X3QpLCBQQUdFX1NJWkUsCiAJICAgICAgICAg
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7CisKKwlzbXVfdGFibGUtPm1ldHJpY3NfdGFi
bGUgPSBremFsbG9jKHNpemVvZihTbXVNZXRyaWNzX3QpLCBHRlBfS0VSTkVMKTsKKwlpZiAoc211
X3RhYmxlLT5tZXRyaWNzX3RhYmxlKQorCQlyZXR1cm4gLUVOT01FTTsKKwlzbXVfdGFibGUtPm1l
dHJpY3NfdGltZSA9IDA7CisKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCB2ZWdhMjBfYWxs
b2NhdGVfZHBtX2NvbnRleHQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCkBAIC0xNjU0LDYgKzE2
NjMsMjYgQEAgc3RhdGljIGludCB2ZWdhMjBfc2V0X2RlZmF1bHRfb2Q4X3NldHR0aW5ncyhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB2ZWdhMjBf
Z2V0X21ldHJpY3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJICAgIFNtdU1l
dHJpY3NfdCAqbWV0cmljc190YWJsZSkKK3sKKwlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNt
dV90YWJsZT0gJnNtdS0+c211X3RhYmxlOworCWludCByZXQgPSAwOworCisJaWYgKCFzbXVfdGFi
bGUtPm1ldHJpY3NfdGltZSB8fCB0aW1lX2FmdGVyKGppZmZpZXMsIHNtdV90YWJsZS0+bWV0cmlj
c190aW1lICsgSFogLyAxMDAwKSkgeworCQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01V
X1RBQkxFX1NNVV9NRVRSSUNTLAorCQkJCSh2b2lkICopc211X3RhYmxlLT5tZXRyaWNzX3RhYmxl
LCBmYWxzZSk7CisJCWlmIChyZXQpIHsKKwkJCXByX2luZm8oIkZhaWxlZCB0byBleHBvcnQgU01V
IG1ldHJpY3MgdGFibGUhXG4iKTsKKwkJCXJldHVybiByZXQ7CisJCX0KKwkJc211X3RhYmxlLT5t
ZXRyaWNzX3RpbWUgPSBqaWZmaWVzOworCX0KKworCW1lbWNweShtZXRyaWNzX3RhYmxlLCBzbXVf
dGFibGUtPm1ldHJpY3NfdGFibGUsIHNpemVvZihTbXVNZXRyaWNzX3QpKTsKKworCXJldHVybiBy
ZXQ7Cit9CiBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfb2RfcGVyY2VudGFnZShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKIAkJCQkgICAgZW51bSBwcF9jbG9ja190eXBlIHR5cGUpCiB7CkBAIC0yOTMz
LDggKzI5NjIsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCiAJaWYgKCF2YWx1ZSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKLQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRS
SUNTLCAodm9pZCAqKSZtZXRyaWNzLAotCQkJICAgICAgIGZhbHNlKTsKKwlyZXQgPSB2ZWdhMjBf
Z2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJl
dDsKIApAQCAtMjk1Myw4ICsyOTgxLDcgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2N1cnJlbnRf
YWN0aXZpdHlfcGVyY2VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlpZiAoIXZhbHVlKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAotCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFC
TEVfU01VX01FVFJJQ1MsCi0JCQkgICAgICAgKHZvaWQgKikmbWV0cmljcywgZmFsc2UpOworCXJl
dCA9IHZlZ2EyMF9nZXRfbWV0cmljc190YWJsZShzbXUsICZtZXRyaWNzKTsKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
