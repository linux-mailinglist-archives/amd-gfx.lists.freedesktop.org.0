Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D87999F
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424F6E2A6;
	Mon, 29 Jul 2019 20:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00186E297
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:48 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id y16so41833367vsc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TjwgTFf9kPw+wpHvJMDsbYPI17VNJ1xn4kzY0lnVjq0=;
 b=oSWyJkjJQpPaqxgyVFQwcjEnar7HqVAEJNguJkRz+a3PTvZOV739MDdXmetJ+esN7P
 1TRRLynMFxwSfdsLAOUYeLpr3Lrd7Ru6rk/SLMey5rwENdAB94ERykh9RDqEWYKmBJh1
 Byys9LBAJ3dHchnQyveG52wUvfVYXM64szS3cvOPfXDi3imRroQxun44+PKYVuaMSzij
 neuLfentt2eLyQ5F9iuY+rOsSKFGe98uiLH3f+LK0uEd0QALHxQsBJNXsMHsXfZhPI6u
 EerL9hSUKmoAgmvg1BoIxSoK6pga9w+8oYnPlXJLe15jH95VyDxUJZoncp03YVKUPgmw
 JbZA==
X-Gm-Message-State: APjAAAV5g11H4AeqHRHQbnt5y9Qv7nB+0ZEcaz5s3aYz72kxnMINZfuV
 HI48KHOC1BAfOA1SbwhmZZLMw96J
X-Google-Smtp-Source: APXvYqzyejPEpcyOavnbYIV8m/+L6G1EaVzLUXR5Q+fKg5EPR+X6IQGO1T2gqEzvHosiv6S9PUGXLg==
X-Received: by 2002:a67:ff0b:: with SMTP id v11mr35782053vsp.14.1564431347746; 
 Mon, 29 Jul 2019 13:15:47 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 30/30] drm/amd/powerplay: determine the features to enable by
 pptable only
Date: Mon, 29 Jul 2019 15:15:08 -0500
Message-Id: <20190729201508.16136-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjwgTFf9kPw+wpHvJMDsbYPI17VNJ1xn4kzY0lnVjq0=;
 b=ktGA4r0fCvm8MWR0zFpYH+zLdHuO5zhoK7sbjrLB7S7/F2LWaILs+nvwX0a90I0FTO
 dlZDFXAtXjsYmyL/xGTgCSm8lTP/GJn5qtxRuEvNAEUwlsReWEHA6aweT8NyduJrEZOl
 Fr+0uZWV5DKbx4BEfGvJ9LvU2yhrTooevN3aAyTTi7vB89oAmOPmfpX0vc82zSPl20r4
 U+6i3z3unktdfix3HbShmYDbc7fMSYRUU03nU8nCtdnJoR8ln5Zzzo1VviU+CVAT+f/M
 YQlNBV5gyusYcSCxswL68DrjT8wvsPk+g5UQguvACs3H59AbUgq1QEHNx6qxUBjj6eZ8
 x/Ew==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClBlciBjdXJyZW50IGxvZ2ljcywg
dGhlIGZlYXR1cmVzIHRvIGVuYWJsZSBhcmUgZGV0ZXJtaW5lZCB0b2dldGhlcgpieSBkcml2ZXIg
YW5kIHBwdGFibGUuIFRoaXMgaXMgbm90IGVmZmljaWVudCBpbiBjby1kZWJ1ZyB3aXRoCmZpcm13
YXJlIHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpS
ZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgNiArKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCA5MzYwZjVhMjViNjkuLjIx
NWY3MTczZmNhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJj
dHVydXNfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNf
cHB0LmMKQEAgLTMyNyw3ICszMjcsNiBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX2FsbG9jYXRlX2Rw
bV9jb250ZXh0KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiAwOwogfQogCi0jZGVm
aW5lIEZFQVRVUkVfTUFTSyhmZWF0dXJlKSAoMVVMTCA8PCBmZWF0dXJlKQogc3RhdGljIGludAog
YXJjdHVydXNfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LAogCQkJCSAgdWludDMyX3QgKmZlYXR1cmVfbWFzaywgdWludDMyX3QgbnVtKQpAQCAtMzM1LDkg
KzMzNCw4IEBAIGFyY3R1cnVzX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKIAlpZiAobnVtID4gMikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQltZW1zZXQo
ZmVhdHVyZV9tYXNrLCAwLCBzaXplb2YodWludDMyX3QpICogbnVtKTsKLQotCSoodWludDY0X3Qg
KilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklU
KTsKKwkvKiBwcHRhYmxlIHdpbGwgaGFuZGxlIHRoZSBmZWF0dXJlcyB0byBlbmFibGUgKi8KKwlt
ZW1zZXQoZmVhdHVyZV9tYXNrLCAweEZGLCBzaXplb2YodWludDMyX3QpICogbnVtKTsKIAogCXJl
dHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
