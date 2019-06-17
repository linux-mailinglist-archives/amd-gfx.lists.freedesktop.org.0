Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033B448DE2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3389362;
	Mon, 17 Jun 2019 19:17:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23A0892EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:40 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so7217763qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5L2knot9TYovvCKN6Vd1x1bhgB5dMaUzI2toUR/OACA=;
 b=G91zGMwMTmilKEHGOuNuv15iEHOSOuAutEWVUQuLKtbDzkbp5BqRkMy5zUIXi12EEt
 23/pQaaCHU3aQB04lx1Sqg7UTCd1rQeZdT61VFfxGK6l7lT7U/71v79m95+2aavXZfvS
 Q45HktXssyH3YnIJnZed3d1iRp6L86819DzbfYOqFG29xOYO4ylIb9NCDAP6JQ+feObR
 B3e+JhvpGBizfomJYvkGS1dAI5VPNytP/Qfr5FNTy9PWBj6AwabviVpMXJpm/YYu2IZD
 d2RpL6M0O91kW9cTwSgdyuZUCGySAXVYcol4IAoJQwtPcVVAmoDbgwVW4RDWgFq822uy
 hx2Q==
X-Gm-Message-State: APjAAAW986prlWH0X0gJT1bsYljNeLpEa/+CUSTcogElbRlAobkPsICm
 kAeWJHzTt98JdxXHhczmCU3fM0k1FK4=
X-Google-Smtp-Source: APXvYqx0HAGIqUA+ibZXCmO0DsYvFP4Bfonua/TmzBoiTtDsukEHB6jUL/mkPsZZ+OLlzP6i4HJ1ng==
X-Received: by 2002:a0c:b659:: with SMTP id q25mr22293130qvf.29.1560799059582; 
 Mon, 17 Jun 2019 12:17:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 036/459] drm/amdgpu: add members in amdgpu_me for gfx queue
Date: Mon, 17 Jun 2019 14:09:57 -0500
Message-Id: <20190617191700.17899-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5L2knot9TYovvCKN6Vd1x1bhgB5dMaUzI2toUR/OACA=;
 b=k0Wuo+E4eU8yUxYaCsdOaE/D1siYJFPpp/O1mnS2FDxQ0wIU+P+P72BkwMyFsmY5vA
 4oWS3e9uHieMTATIUbx1NXnbMnjnoqiFtcVxurNueXBJgcR8tHQb7I2Y8Prui8ReNzJp
 BaV6z8VNXl2HrfiQaws52oVZA5sQYcAvYmFIRx1naYcvpIAaZbXiFq+7jE0an/nKA1KZ
 SyPNUKg0lqmubdPLgY/WJWeIsDGL+bLAAMturtqBwtmq5TU59HgxWvuyP64neiWcJMm5
 hTbnOnE3EHHFnSFqrYC1MKZ4xmx0+WGK4fMni83wElGWcRVEvbZIUv48vPlGlCmal6Ou
 1ZJQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <jack.xiao@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFj
ayBYaWFvIDxqYWNrLnhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAppbmRleCA5ZDBlZjZhNmFhYjYuLjY4Zjdk
M2NmNGZhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaApAQCAtMzgs
NiArMzgsNyBAQAogI2RlZmluZSBBTURHUFVfR0ZYX0NHX0RJU0FCTEVEX01PREUJCTB4MDAwMDAw
MDRMCiAjZGVmaW5lIEFNREdQVV9HRlhfTEJQV19ESVNBQkxFRF9NT0RFCQkweDAwMDAwMDA4TAog
CisjZGVmaW5lIEFNREdQVV9NQVhfR0ZYX1FVRVVFUyBLR0RfTUFYX1FVRVVFUwogI2RlZmluZSBB
TURHUFVfTUFYX0NPTVBVVEVfUVVFVUVTIEtHRF9NQVhfUVVFVUVTCiAKIHN0cnVjdCBhbWRncHVf
bWVjIHsKQEAgLTIxMSw2ICsyMTIsMTMgQEAgc3RydWN0IGFtZGdwdV9tZSB7CiAJc3RydWN0IGFt
ZGdwdV9ibwkJKm1lX2Z3X29iajsKIAl1aW50NjRfdAkJCW1lX2Z3X2dwdV9hZGRyOwogCXVpbnQz
Ml90CQkJKm1lX2Z3X3B0cjsKKwl1aW50MzJfdAkJCW51bV9tZTsKKwl1aW50MzJfdAkJCW51bV9w
aXBlX3Blcl9tZTsKKwl1aW50MzJfdAkJCW51bV9xdWV1ZV9wZXJfcGlwZTsKKwl2b2lkCQkJCSpt
cWRfYmFja3VwW0FNREdQVV9NQVhfR0ZYX1JJTkdTICsgMV07CisKKwkvKiBUaGVzZSBhcmUgdGhl
IHJlc291cmNlcyBmb3Igd2hpY2ggYW1kZ3B1IHRha2VzIG93bmVyc2hpcCAqLworCURFQ0xBUkVf
QklUTUFQKHF1ZXVlX2JpdG1hcCwgQU1ER1BVX01BWF9HRlhfUVVFVUVTKTsKIH07CiAKIHN0cnVj
dCBhbWRncHVfZ2Z4IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
