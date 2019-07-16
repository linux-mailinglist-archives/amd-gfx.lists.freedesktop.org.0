Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F966A03D
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D4C6E049;
	Tue, 16 Jul 2019 01:27:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4F89F2A
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:55 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x22so12867322qtp.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVJdr8+S145DGoTqmS/xLBiHtAamZnD90/sQN2o4vYA=;
 b=nEwKHL2Ro4pCtrGPz1G+xk4FZUKXIRGxmEIxoM1fJvYQVMJjEoiZNEbhCF+nzBvLCH
 Tl0BPg4UsC1sAxBd+j7QU16rPOuxY3qGgyPWAajIaWTDuM2H8rd6Cka+acMzU7zYK3VI
 2fwihXVNKPC6dMuUgLOZb3Uqz26N0dkyu4pPTXsiuCnHobtlXco2C0nC8UQmuCpndOlT
 ItRDqKb+QaT23zaG/9prrr+i6fnL3cppR7HA0y/MBgB1fV24lzFKRCMRKpW4RGPt1Hqz
 eg70rqG9oDPcen7HmmZW4EXxvB44WXYkPR/3EVtuLGtc9qhdzFqFeKVEoT0ngAfu/I1C
 RMqQ==
X-Gm-Message-State: APjAAAXhSmKn7vB+j2tY8oQ6lX5lILdUe+KzpcdoGS9nC5B2M2jE46s8
 Z9Q+y9U0P/TTG11wrq7BOh0Uc3VH
X-Google-Smtp-Source: APXvYqxGfqQ5S9p0dekcRZhNmblPlPAw3+BXMTwPdSOoODltyDRR0a5TLB5ih+pwHSK7r1pUbvqg9A==
X-Received: by 2002:ac8:5547:: with SMTP id o7mr20826470qtr.297.1563240474229; 
 Mon, 15 Jul 2019 18:27:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 096/102] drm/amdgpu: Add more detail to the VM fault printing
Date: Mon, 15 Jul 2019 20:27:35 -0500
Message-Id: <20190716012741.32036-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVJdr8+S145DGoTqmS/xLBiHtAamZnD90/sQN2o4vYA=;
 b=cMfadbc57d/necejPKtp5/u3CsmqRZYVg5W66Cmsr9YnxRcVR5w/HRu8IJb5Nc9isR
 GbhCes0HoSAd5SCoieQOmvvCcI3eVQowRtI2YYCXSnycBsyyg4HMgJZWwf5e5/HY6i0j
 a/KjKdO46GDdNj8AaS+a6dw7oPz2A9V8d87VZSC7LpTyRThqbkfRBetpB7SlAlmr/m1k
 SgENJme/gOvDRATr4ozNGPfkgXzPDXGtzMqQqahfkESgNEfVbBB5glnBXcT2w4whDFk2
 wgM/76J7kziphtX/4l1xelnoQOl0izKkRrKldJExQku7urh/Ty42rABnwD+wZSYPhZFF
 TUCQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KCldpdGggdGhlIHByaW50aW5nLCB3
ZSBkb24ndCBuZWVkIHRvIHBhcnNlIHRoZSB2YWx1ZSBvbiBvdXIgb3duIGFueSBtb3JlLgoKU2ln
bmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAxOCArKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDgyMGNjNmUwYjUxZS4uNWJkOTM3ZmZjM2FkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTM1NSwxMiArMzU1LDI2IEBA
IHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJCQllbnRyeS0+c3JjX2lkLCBlbnRyeS0+cmluZ19pZCwgZW50cnktPnZtaWQs
CiAJCQllbnRyeS0+cGFzaWQsIHRhc2tfaW5mby5wcm9jZXNzX25hbWUsIHRhc2tfaW5mby50Z2lk
LAogCQkJdGFza19pbmZvLnRhc2tfbmFtZSwgdGFza19pbmZvLnBpZCk7Ci0JCWRldl9lcnIoYWRl
di0+ZGV2LCAiICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MgMHglMDE2bGx4IGZyb20gJWRc
biIsCisJCWRldl9lcnIoYWRldi0+ZGV2LCAiICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3Mg
MHglMDE2bGx4IGZyb20gY2xpZW50ICVkXG4iLAogCQkJYWRkciwgZW50cnktPmNsaWVudF9pZCk7
Ci0JCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQorCQlpZiAoIWFtZGdwdV9zcmlvdl92Zihh
ZGV2KSkgewogCQkJZGV2X2VycihhZGV2LT5kZXYsCiAJCQkJIlZNX0wyX1BST1RFQ1RJT05fRkFV
TFRfU1RBVFVTOjB4JTA4WFxuIiwKIAkJCQlzdGF0dXMpOworCQkJZGV2X2VycihhZGV2LT5kZXYs
ICJcdCBNT1JFX0ZBVUxUUzogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCisJ
CQkJVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIE1PUkVfRkFVTFRTKSk7CisJCQlkZXZf
ZXJyKGFkZXYtPmRldiwgIlx0IFdBTEtFUl9FUlJPUjogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9G
SUVMRChzdGF0dXMsCisJCQkJVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIFdBTEtFUl9F
UlJPUikpOworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBQRVJNSVNTSU9OX0ZBVUxUUzogMHgl
bHhcbiIsCisJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCisJCQkJVk1fTDJfUFJPVEVDVElPTl9G
QVVMVF9TVEFUVVMsIFBFUk1JU1NJT05fRkFVTFRTKSk7CisJCQlkZXZfZXJyKGFkZXYtPmRldiwg
Ilx0IE1BUFBJTkdfRVJST1I6IDB4JWx4XG4iLAorCQkJCVJFR19HRVRfRklFTEQoc3RhdHVzLAor
CQkJCVZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNQVBQSU5HX0VSUk9SKSk7CisKKwkJ
fQogCX0KIAogCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
