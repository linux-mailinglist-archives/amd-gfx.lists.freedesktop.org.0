Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB548F57
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2DE89C1C;
	Mon, 17 Jun 2019 19:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B28E89C13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:44 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so6935202qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SeCUQ6T6ZtDRXKjijk9MMYoqy/d1i/HmHesKGu1JgGA=;
 b=dmc/8vUny/tUQ9RXL8NCQnsBy/4qYjp6McH9j0smCxA9sv2NpZbiYTVTvt/6AnPbok
 PotmXF/I0OqPmk4PDKjv8DkxELTRMW1y0Gv2hzsfnM/6xpBS332Iq0HsDs1/WMQ2Ph1K
 BYM7JUIg36sItcsCJ48Ja2fOFvxwyTrE3pnPLB0wiTBB+H5UsB6A8edshaGdx8b+ii/g
 Oi5+9a86vaK6a7KfWI5MGeotjd4wOCo29Dc3dD/NAeDnuakxTkvSHGfA/nqhMfGWPS2w
 FQ8Dj7j16t3NFfxN29UMzJBuQDDsZ8bKQI9e7xP23hXJE7cQQN/CJwUUniEdLBRh9Vxr
 gFsg==
X-Gm-Message-State: APjAAAVBffBoA06cv7HHQdX3fK6Y0HBgstnuziT2PNBRj9g858jkjcYW
 n+0trCqRXtA7YwnmZ4zUWEYbbF7oFVk=
X-Google-Smtp-Source: APXvYqxCHFCcEKgTwV3KeVCf3saKw7Nw44HpcT3O2cBvc4zn02ygyfVmmBR2Ob0lju1fUH5aV0tpzQ==
X-Received: by 2002:a37:4243:: with SMTP id p64mr8148836qka.9.1560799902643;
 Mon, 17 Jun 2019 12:31:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 233/459] drm/amd/powerplay: add function force_clk_levels for
 navi10
Date: Mon, 17 Jun 2019 14:30:00 -0500
Message-Id: <20190617193106.18231-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeCUQ6T6ZtDRXKjijk9MMYoqy/d1i/HmHesKGu1JgGA=;
 b=enWeB91PGNwq3g8h9AYen+tBEfqvJ0JfexXS0LEAeMGIVRjcuyznsDMMtE7apm49o2
 06I5l7hK0LkHZCHx0hvF875q1VYwoXODKXVW9niMzip4FEdGETVZ2ljD7eEVGF5tGwDr
 Nzp4li7mWKXN2iO5ySD28OPXFK8em+KCLtq1Sqr/QzrxtDV9LukGYDKsbruqyUf7lPAU
 8mzSEOdKpWDvEkMxvl8F0objlteLJlzuYDjDmKRNdtLKXvAhWxuGla0ZPX/3AnK8RB+I
 WgMmAYa1OugGDzQL+P1romxna6wcaEJXS36LGQiQaRm42pMcAIbOUIwNui8uTQIflf62
 dd8g==
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
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBzeXNmcyBpbnRlcmZh
Y2Ugb2YgZm9yY2VfY2xrX2xldmVscyBzeXNmcyBmb3IgbmF2aTEwLgoKU2lnbmVkLW9mZi1ieTog
S2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cG0uYyAgICAgICAgfCAxNiArKysrLS0tLQogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oICAgIHwgIDYgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgICAgfCAzNyArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAgfCAxNiArKysrLS0tLQogNCBmaWxlcyBjaGFu
Z2VkLCA1NiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbS5jCmluZGV4IDUyYjM5ODkxODcxNC4uOGMyOGY4MTZiNTBmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAtOTAxLDcgKzkwMSw3IEBAIHN0
YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfcHBfZHBtX3NjbGsoc3RydWN0IGRldmljZSAqZGV2LAog
CQlyZXR1cm4gcmV0OwogCiAJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQotCQlyZXQgPSBz
bXVfZm9yY2VfY2xrX2xldmVscygmYWRldi0+c211LCBQUF9TQ0xLLCBtYXNrKTsKKwkJcmV0ID0g
c211X2ZvcmNlX2Nsa19sZXZlbHMoJmFkZXYtPnNtdSwgU01VX1NDTEssIG1hc2spOwogCWVsc2Ug
aWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+Zm9yY2VfY2xvY2tfbGV2ZWwpCiAJCXJldCA9
IGFtZGdwdV9kcG1fZm9yY2VfY2xvY2tfbGV2ZWwoYWRldiwgUFBfU0NMSywgbWFzayk7CiAKQEAg
LTk0OCw3ICs5NDgsNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX2RwbV9tY2xrKHN0
cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0dXJuIHJldDsKIAogCWlmIChpc19zdXBwb3J0X3N3X3Nt
dShhZGV2KSkKLQkJcmV0ID0gc211X2ZvcmNlX2Nsa19sZXZlbHMoJmFkZXYtPnNtdSwgUFBfTUNM
SywgbWFzayk7CisJCXJldCA9IHNtdV9mb3JjZV9jbGtfbGV2ZWxzKCZhZGV2LT5zbXUsIFNNVV9N
Q0xLLCBtYXNrKTsKIAllbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmZvcmNlX2Ns
b2NrX2xldmVsKQogCQlyZXQgPSBhbWRncHVfZHBtX2ZvcmNlX2Nsb2NrX2xldmVsKGFkZXYsIFBQ
X01DTEssIG1hc2spOwogCkBAIC05ODgsNyArOTg4LDcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1
X3NldF9wcF9kcG1fc29jY2xrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0dXJuIHJldDsKIAog
CWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKLQkJcmV0ID0gc211X2ZvcmNlX2Nsa19sZXZl
bHMoJmFkZXYtPnNtdSwgUFBfU09DQ0xLLCBtYXNrKTsKKwkJcmV0ID0gc211X2ZvcmNlX2Nsa19s
ZXZlbHMoJmFkZXYtPnNtdSwgU01VX1NPQ0NMSywgbWFzayk7CiAJZWxzZSBpZiAoYWRldi0+cG93
ZXJwbGF5LnBwX2Z1bmNzLT5mb3JjZV9jbG9ja19sZXZlbCkKIAkJcmV0ID0gYW1kZ3B1X2RwbV9m
b3JjZV9jbG9ja19sZXZlbChhZGV2LCBQUF9TT0NDTEssIG1hc2spOwogCkBAIC0xMDI4LDcgKzEw
MjgsNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX2RwbV9mY2xrKHN0cnVjdCBkZXZp
Y2UgKmRldiwKIAkJcmV0dXJuIHJldDsKIAogCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkK
LQkJcmV0ID0gc211X2ZvcmNlX2Nsa19sZXZlbHMoJmFkZXYtPnNtdSwgUFBfRkNMSywgbWFzayk7
CisJCXJldCA9IHNtdV9mb3JjZV9jbGtfbGV2ZWxzKCZhZGV2LT5zbXUsIFNNVV9GQ0xLLCBtYXNr
KTsKIAllbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmZvcmNlX2Nsb2NrX2xldmVs
KQogCQlyZXQgPSBhbWRncHVfZHBtX2ZvcmNlX2Nsb2NrX2xldmVsKGFkZXYsIFBQX0ZDTEssIG1h
c2spOwogCkBAIC0xMDY4LDcgKzEwNjgsNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3Bw
X2RwbV9kY2VmY2xrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0dXJuIHJldDsKIAogCWlmIChp
c19zdXBwb3J0X3N3X3NtdShhZGV2KSkKLQkJcmV0ID0gc211X2ZvcmNlX2Nsa19sZXZlbHMoJmFk
ZXYtPnNtdSwgUFBfRENFRkNMSywgbWFzayk7CisJCXJldCA9IHNtdV9mb3JjZV9jbGtfbGV2ZWxz
KCZhZGV2LT5zbXUsIFNNVV9EQ0VGQ0xLLCBtYXNrKTsKIAllbHNlIGlmIChhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3MtPmZvcmNlX2Nsb2NrX2xldmVsKQogCQlyZXQgPSBhbWRncHVfZHBtX2ZvcmNl
X2Nsb2NrX2xldmVsKGFkZXYsIFBQX0RDRUZDTEssIG1hc2spOwogCkBAIC0xMTA4LDcgKzExMDgs
NyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX2RwbV9wY2llKHN0cnVjdCBkZXZpY2Ug
KmRldiwKIAkJcmV0dXJuIHJldDsKIAogCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKLQkJ
cmV0ID0gc211X2ZvcmNlX2Nsa19sZXZlbHMoJmFkZXYtPnNtdSwgUFBfUENJRSwgbWFzayk7CisJ
CXJldCA9IHNtdV9mb3JjZV9jbGtfbGV2ZWxzKCZhZGV2LT5zbXUsIFNNVV9QQ0lFLCBtYXNrKTsK
IAllbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmZvcmNlX2Nsb2NrX2xldmVsKQog
CQlyZXQgPSBhbWRncHVfZHBtX2ZvcmNlX2Nsb2NrX2xldmVsKGFkZXYsIFBQX1BDSUUsIG1hc2sp
OwogCkBAIC0xMTUyLDcgKzExNTIsNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX3Nj
bGtfb2Qoc3RydWN0IGRldmljZSAqZGV2LAogCX0KIAogCWlmIChpc19zdXBwb3J0X3N3X3NtdShh
ZGV2KSkgewotCQl2YWx1ZSA9IHNtdV9zZXRfb2RfcGVyY2VudGFnZSgmKGFkZXYtPnNtdSksIE9E
X1NDTEssICh1aW50MzJfdCl2YWx1ZSk7CisJCXZhbHVlID0gc211X3NldF9vZF9wZXJjZW50YWdl
KCYoYWRldi0+c211KSwgU01VX09EX1NDTEssICh1aW50MzJfdCl2YWx1ZSk7CiAJfSBlbHNlIHsK
IAkJaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3NjbGtfb2QpCiAJCQlhbWRncHVf
ZHBtX3NldF9zY2xrX29kKGFkZXYsICh1aW50MzJfdCl2YWx1ZSk7CkBAIC0xMjAzLDcgKzEyMDMs
NyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX21jbGtfb2Qoc3RydWN0IGRldmljZSAq
ZGV2LAogCX0KIAogCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewotCQl2YWx1ZSA9IHNt
dV9zZXRfb2RfcGVyY2VudGFnZSgmKGFkZXYtPnNtdSksIE9EX01DTEssICh1aW50MzJfdCl2YWx1
ZSk7CisJCXZhbHVlID0gc211X3NldF9vZF9wZXJjZW50YWdlKCYoYWRldi0+c211KSwgU01VX09E
X01DTEssICh1aW50MzJfdCl2YWx1ZSk7CiAJfSBlbHNlIHsKIAkJaWYgKGFkZXYtPnBvd2VycGxh
eS5wcF9mdW5jcy0+c2V0X21jbGtfb2QpCiAJCQlhbWRncHVfZHBtX3NldF9tY2xrX29kKGFkZXYs
ICh1aW50MzJfdCl2YWx1ZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaAppbmRleCA1Mjg5NDUzZjk0MjIuLjhhNDYxODA4NDM1OCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC01MzksNyAr
NTM5LDcgQEAgc3RydWN0IHBwdGFibGVfZnVuY3MgewogCWludCAoKnNldF9wb3dlcl9zdGF0ZSko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKnBvcHVsYXRlX3VtZF9zdGF0ZV9jbGsp
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAlpbnQgKCpwcmludF9jbGtfbGV2ZWxzKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsIGNoYXIgKmJ1
Zik7Ci0JaW50ICgqZm9yY2VfY2xrX2xldmVscykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gcHBfY2xvY2tfdHlwZSB0eXBlLCB1aW50MzJfdCBtYXNrKTsKKwlpbnQgKCpmb3JjZV9jbGtf
bGV2ZWxzKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5
cGUsIHVpbnQzMl90IG1hc2spOwogCWludCAoKnNldF9kZWZhdWx0X29kOF9zZXR0aW5ncykoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKnVwZGF0ZV9zcGVjaWZpZWRfb2Q4X3ZhbHVl
KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkJICB1aW50MzJfdCBpbmRleCwKQEAgLTc3
Niw4ICs3NzYsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJl
bnRfY2xrX2ZyZXE/IChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoKHNtdSksIChj
bGtfaWQpLCAodmFsdWUpKSA6IDApCiAjZGVmaW5lIHNtdV9wcmludF9jbGtfbGV2ZWxzKHNtdSwg
Y2xrX3R5cGUsIGJ1ZikgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5wcmludF9jbGtfbGV2ZWxzID8g
KHNtdSktPnBwdF9mdW5jcy0+cHJpbnRfY2xrX2xldmVscygoc211KSwgKGNsa190eXBlKSwgKGJ1
ZikpIDogMCkKLSNkZWZpbmUgc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCB0eXBlLCBsZXZlbCkg
XAotCSgoc211KS0+cHB0X2Z1bmNzLT5mb3JjZV9jbGtfbGV2ZWxzID8gKHNtdSktPnBwdF9mdW5j
cy0+Zm9yY2VfY2xrX2xldmVscygoc211KSwgKHR5cGUpLCAobGV2ZWwpKSA6IDApCisjZGVmaW5l
IHNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgY2xrX3R5cGUsIGxldmVsKSBcCisJKChzbXUpLT5w
cHRfZnVuY3MtPmZvcmNlX2Nsa19sZXZlbHMgPyAoc211KS0+cHB0X2Z1bmNzLT5mb3JjZV9jbGtf
bGV2ZWxzKChzbXUpLCAoY2xrX3R5cGUpLCAobGV2ZWwpKSA6IDApCiAjZGVmaW5lIHNtdV9nZXRf
b2RfcGVyY2VudGFnZShzbXUsIHR5cGUpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+Z2V0X29kX3Bl
cmNlbnRhZ2UgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfb2RfcGVyY2VudGFnZSgoc211KSwgKHR5
cGUpKSA6IDApCiAjZGVmaW5lIHNtdV9zZXRfb2RfcGVyY2VudGFnZShzbXUsIHR5cGUsIHZhbHVl
KSBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNTg2
M2ZhNjkxYTkxLi4zMTFhODU2MTMwMDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKQEAgLTU2Niw2ICs1NjYsNDIgQEAgc3RhdGljIGludCBuYXZpMTBfcHJp
bnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlyZXR1cm4gc2l6ZTsKIH0K
IAorc3RhdGljIGludCBuYXZpMTBfZm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwKKwkJCQkgICBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwgdWludDMyX3QgbWFzaykK
K3sKKworCWludCByZXQgPSAwLCBzaXplID0gMDsKKwl1aW50MzJfdCBzb2Z0X21pbl9sZXZlbCA9
IDAsIHNvZnRfbWF4X2xldmVsID0gMCwgbWluX2ZyZXEgPSAwLCBtYXhfZnJlcSA9IDA7CisKKwlz
b2Z0X21pbl9sZXZlbCA9IG1hc2sgPyAoZmZzKG1hc2spIC0gMSkgOiAwOworCXNvZnRfbWF4X2xl
dmVsID0gbWFzayA/IChmbHMobWFzaykgLSAxKSA6IDA7CisKKwlzd2l0Y2ggKGNsa190eXBlKSB7
CisJY2FzZSBTTVVfR0ZYQ0xLOgorCWNhc2UgU01VX1NPQ0NMSzoKKwljYXNlIFNNVV9NQ0xLOgor
CWNhc2UgU01VX1VDTEs6CisJY2FzZSBTTVVfRENFRkNMSzoKKwljYXNlIFNNVV9GQ0xLOgorCQly
ZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5cGUsIHNvZnRfbWluX2xl
dmVsLCAmbWluX2ZyZXEpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHNpemU7CisKKwkJcmV0ID0g
c211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBlLCBzb2Z0X21heF9sZXZlbCwg
Jm1heF9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiBzaXplOworCisJCXJldCA9IHNtdV9z
ZXRfc29mdF9mcmVxX3JhbmdlKHNtdSwgY2xrX3R5cGUsIG1pbl9mcmVxLCBtYXhfZnJlcSk7CisJ
CWlmIChyZXQpCisJCQlyZXR1cm4gc2l6ZTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJYnJlYWs7
CisJfQorCisJcmV0dXJuIHNpemU7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9m
dW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS50YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNf
aW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRleHQgPSBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQs
CkBAIC01ODIsNiArNjE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5h
dmkxMF9wcHRfZnVuY3MgPSB7CiAJLmRwbV9zZXRfdXZkX2VuYWJsZSA9IG5hdmkxMF9kcG1fc2V0
X3V2ZF9lbmFibGUsCiAJLmdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlID0gbmF2aTEwX2dl
dF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlLAogCS5wcmludF9jbGtfbGV2ZWxzID0gbmF2aTEw
X3ByaW50X2Nsa19sZXZlbHMsCisJLmZvcmNlX2Nsa19sZXZlbHMgPSBuYXZpMTBfZm9yY2VfY2xr
X2xldmVscywKIH07CiAKIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5k
ZXggYTY4ODAxZDA1Y2MxLi43ZWQ4YzdjMzYwMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTEyMjMsNyArMTIyMyw3IEBAIHN0YXRpYyBpbnQgdmVn
YTIwX3VwbG9hZF9kcG1fbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgbWF4LAog
fQogCiBzdGF0aWMgaW50IHZlZ2EyMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAotCQkJZW51bSBwcF9jbG9ja190eXBlIHR5cGUsIHVpbnQzMl90IG1hc2spCisJCQll
bnVtICBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsIHVpbnQzMl90IG1hc2spCiB7CiAJc3RydWN0IHZl
Z2EyMF9kcG1fdGFibGUgKmRwbV90YWJsZTsKIAlzdHJ1Y3QgdmVnYTIwX3NpbmdsZV9kcG1fdGFi
bGUgKnNpbmdsZV9kcG1fdGFibGU7CkBAIC0xMjQzLDggKzEyNDMsOCBAQCBzdGF0aWMgaW50IHZl
Z2EyMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCiAJZHBtX3Rh
YmxlID0gc211LT5zbXVfZHBtLmRwbV9jb250ZXh0OwogCi0Jc3dpdGNoICh0eXBlKSB7Ci0JY2Fz
ZSBQUF9TQ0xLOgorCXN3aXRjaCAoY2xrX3R5cGUpIHsKKwljYXNlIFNNVV9TQ0xLOgogCQlzaW5n
bGVfZHBtX3RhYmxlID0gJihkcG1fdGFibGUtPmdmeF90YWJsZSk7CiAKIAkJaWYgKHNvZnRfbWF4
X2xldmVsID49IHNpbmdsZV9kcG1fdGFibGUtPmNvdW50KSB7CkBAIC0xMjcxLDcgKzEyNzEsNyBA
QCBzdGF0aWMgaW50IHZlZ2EyMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LAogCiAJCWJyZWFrOwogCi0JY2FzZSBQUF9NQ0xLOgorCWNhc2UgU01VX01DTEs6CiAJCXNp
bmdsZV9kcG1fdGFibGUgPSAmKGRwbV90YWJsZS0+bWVtX3RhYmxlKTsKIAogCQlpZiAoc29mdF9t
YXhfbGV2ZWwgPj0gc2luZ2xlX2RwbV90YWJsZS0+Y291bnQpIHsKQEAgLTEyOTgsNyArMTI5OCw3
IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiAKIAkJYnJlYWs7CiAKLQljYXNlIFBQX1NPQ0NMSzoKKwljYXNlIFNNVV9TT0NDTEs6
CiAJCXNpbmdsZV9kcG1fdGFibGUgPSAmKGRwbV90YWJsZS0+c29jX3RhYmxlKTsKIAogCQlpZiAo
c29mdF9tYXhfbGV2ZWwgPj0gc2luZ2xlX2RwbV90YWJsZS0+Y291bnQpIHsKQEAgLTEzMjUsNyAr
MTMyNSw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCiAKIAkJYnJlYWs7CiAKLQljYXNlIFBQX0ZDTEs6CisJY2FzZSBTTVVfRkNM
SzoKIAkJc2luZ2xlX2RwbV90YWJsZSA9ICYoZHBtX3RhYmxlLT5mY2xrX3RhYmxlKTsKIAogCQlp
ZiAoc29mdF9tYXhfbGV2ZWwgPj0gc2luZ2xlX2RwbV90YWJsZS0+Y291bnQpIHsKQEAgLTEzNTIs
NyArMTM1Miw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsCiAKIAkJYnJlYWs7CiAKLQljYXNlIFBQX0RDRUZDTEs6CisJY2FzZSBT
TVVfRENFRkNMSzoKIAkJaGFyZF9taW5fbGV2ZWwgPSBzb2Z0X21pbl9sZXZlbDsKIAkJc2luZ2xl
X2RwbV90YWJsZSA9ICYoZHBtX3RhYmxlLT5kY2VmX3RhYmxlKTsKIApAQCAtMTM3Miw3ICsxMzcy
LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfZm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAogCQlicmVhazsKIAotCWNhc2UgUFBfUENJRToKKwljYXNlIFNNVV9QQ0lFOgog
CQlpZiAoc29mdF9taW5fbGV2ZWwgPj0gTlVNX0xJTktfTEVWRUxTIHx8CiAJCSAgICBzb2Z0X21h
eF9sZXZlbCA+PSBOVU1fTElOS19MRVZFTFMpIHsKIAkJCXJldCA9IC1FSU5WQUw7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
