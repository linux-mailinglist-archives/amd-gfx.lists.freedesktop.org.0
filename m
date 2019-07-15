Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB669E02
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8141D89DF9;
	Mon, 15 Jul 2019 21:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740F89DEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:00 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id y26so17272475qto.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orxhgRIKDjNIbm2x3tQSNiz6I0n/qb65pDN1s44y14U=;
 b=D/mlgBmUEGCzMXqV6FT3X6PCqBnbWZJE7rBMyh1rIUT21loioiLei0OwBdvTyOWxN3
 tFJf2g4SKv/vGDUZdBgFYxsgk48dG4YdGA5LmCBe2/fWzjt4mFC4TI5B7NZK4jXKgZ/1
 BqjsHHyMbd6DgMRl6G+21XHRDYri8Nwy7caA/uL09FZbs0ktFb5yrO3VUvrgUhTrYYsL
 BFi7F3xel7PlBBVWVeAV/g/V6UEEsR/dTaRI9ToBJANKmKyjYwD7qfz4mFgaQF2pCLbt
 +19Dz06pDVgrkcfv+sQvsjY6nZoWkdsAWJU/LvbCMb4yXdXAyOPKML/tA8ArZLVifKlK
 ypNA==
X-Gm-Message-State: APjAAAV4z0pwZuTey4K2q31hPExgE4EkDsjy29zDbUPwAehskNpHzT4L
 9fCo4YS9TcYwd90N/nh2YFtSeyIx
X-Google-Smtp-Source: APXvYqxi15d4nA1pjQpTm8N5OOFJcuR5XN5xTwkXFtDIslYZUraeDvny6IwUUuXnri9hWPdirvCFKQ==
X-Received: by 2002:a0c:8dc7:: with SMTP id u7mr20711445qvb.41.1563225899375; 
 Mon, 15 Jul 2019 14:24:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 016/102] drm/amdgpu: add VMC1 interrupt client id for Arcturus
Date: Mon, 15 Jul 2019 16:23:11 -0500
Message-Id: <20190715212437.31793-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orxhgRIKDjNIbm2x3tQSNiz6I0n/qb65pDN1s44y14U=;
 b=pzH9sqTITq8jIOwnAQ9woRBBVOdynQc7zDTtte5Xjhlyc6jITujId9OH55saGn4tsX
 Q4b49n8ai4c8rZYhVMlf0nCVBycx36UA/S/AUomkMd2mUskk8hV0GLwKmYiDE+PGarVY
 B629Sman1TcY7Ks/t2OBwDAFFTwDuWfltZjyu36cm3Yb6hsMJ1nCehU6uTurtkrN/iNm
 22yL2BhOtCP4Zht6XyKpSqnNYpNURvrggPU0Zm3fNoKZdiwFYc5Pr5PijFmVrVNCekM3
 zOet9Li+XqVHPBHEayNBDvs85d6sUybojgb3Jmx8IeEaqhvt8sTg1zCsLCMesUzPMdD8
 lZfQ==
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

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IFNub3cgWmhhbmcgPCBTbm93LlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgICAgICAgICB8IDcgKysrKysr
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3NvYzE1X2loX2NsaWVudGlkLmggfCAxICsK
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMKaW5kZXggYTBmZGZjYjVkMzM0Li42OTczMTliNzdkNzQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtMTAyOCw2ICsxMDI4LDEzIEBAIHN0YXRpYyBp
bnQgZ21jX3Y5XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYgKHIpCiAJCXJldHVybiByOwog
CisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKSB7CisJCXIgPSBhbWRncHVf
aXJxX2FkZF9pZChhZGV2LCBTT0MxNV9JSF9DTElFTlRJRF9WTUMxLCBWTUNfMV8wX19TUkNJRF9f
Vk1fRkFVTFQsCisJCQkJCSZhZGV2LT5nbWMudm1fZmF1bHQpOworCQlpZiAocikKKwkJCXJldHVy
biByOworCX0KKwogCXIgPSBhbWRncHVfaXJxX2FkZF9pZChhZGV2LCBTT0MxNV9JSF9DTElFTlRJ
RF9VVENMMiwgVVRDTDJfMV8wX19TUkNJRF9fRkFVTFQsCiAJCQkJJmFkZXYtPmdtYy52bV9mYXVs
dCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9zb2MxNV9paF9j
bGllbnRpZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3NvYzE1X2loX2NsaWVudGlk
LmgKaW5kZXggNWI0MGI5ZDFiNzg4Li4wZjM4NmIyZTFmNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9zb2MxNV9paF9jbGllbnRpZC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9zb2MxNV9paF9jbGllbnRpZC5oCkBAIC03MCw2ICs3MCw3IEBAIGVu
dW0gc29jMTVfaWhfY2xpZW50aWQgewogCVNPQzE1X0lIX0NMSUVOVElEX1NETUE1CQk9IFNPQzE1
X0lIX0NMSUVOVElEX1ZDRTAsCiAJU09DMTVfSUhfQ0xJRU5USURfU0RNQTYJCT0gU09DMTVfSUhf
Q0xJRU5USURfWERNQSwKIAlTT0MxNV9JSF9DTElFTlRJRF9TRE1BNwkJPSBTT0MxNV9JSF9DTElF
TlRJRF9WQ0UxLAorCVNPQzE1X0lIX0NMSUVOVElEX1ZNQzEJCT0gU09DMTVfSUhfQ0xJRU5USURf
UENJRTAsCiB9OwogCiAjZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
