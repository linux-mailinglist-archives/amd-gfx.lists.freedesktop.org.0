Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDD69E33
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364A89F82;
	Mon, 15 Jul 2019 21:25:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FD689F6E
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:43 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r4so12814708qkm.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VksKy5fSCD2aCf2djvRNb8U6ZFNnL78AmM+dGZzrXXA=;
 b=WaLSV7lXAS/gU5lJ4tdf/VSGyJnEdXftnu9/JJqlogfCuwX7/CQVvIoBRTyUlkLoFc
 TDjAUvmWoJa5OoY3qv0ohAegGDgG7KAd2w5FDw8NzPpy6upVgF+jnZzOMRUBkVR6uYXI
 CAAIdDmk5Lb5uxY08U7IM4bf48I0lVyuv+b5hkd28C+uUi6CxA8P1spZxbLkNBjGrEgg
 8ECibpOjftZfsWYabeb392MQDFAo4nwLvU11nPyIbpJpvUmxVl/xHo1s/0XqN3B1U+x5
 H3Zd6B9jPhcETgLA+G/Iar1kHVjtq8PYfn4YqW67Yu31/xZNI/EoWKRZjY3XxmjY/9kl
 r/6g==
X-Gm-Message-State: APjAAAVtkKVFpjk6fjqSWcdc1Fh1M39oEkYTwwXc9xF1ONmTXYiUAg/0
 yZU0vqWH+0pb9jhTGT6QeR21k4kw
X-Google-Smtp-Source: APXvYqwpqwa0goYdllxIbAh1/F6ERC7M3BXB+s5BP9MR7BQydZT4X8nDBay4z/QX2ShvZaFqn8fYmw==
X-Received: by 2002:a37:a388:: with SMTP id
 m130mr19389008qke.250.1563225942849; 
 Mon, 15 Jul 2019 14:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 065/102] drm/amdgpu: enable VCN2.5 on Arcturus
Date: Mon, 15 Jul 2019 16:24:00 -0500
Message-Id: <20190715212437.31793-63-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VksKy5fSCD2aCf2djvRNb8U6ZFNnL78AmM+dGZzrXXA=;
 b=gwNbgqEJdwED5LIqQXHGKH1DiksFsQwIB665f861JOMEQkdoTqxvZYegZgYi6a3Fan
 0biuWo7Pm/F4QCgBESkbP9NntRa04CImEs81sSdU5Rsn5qGnL+DOauSgBbYYapPkSMbD
 N8oQ9MokTAbYIlev6+DBG96RrisPSoeBvLsvU32SYDZJYjSyQIp5SeIxjcbGrq9GWFOW
 Bdrmz/dMwwJSZ93lM2zzoGsRYFdmv9AOZfPLApwyILzB09W8FqlL3IQcS2SDCfNMnQEB
 nsU4/9EK31zby6CbJSDuDSQrWzDJKvpFfKdw6OnUfHn0BZ8DYSoWLxoRovV/eqQfHv+x
 m2Ww==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVkNOIGlzIHRoZSB2aWRlbyBkZWNvZGUg
YW5kIGVuY29kZSBlbmdpbmUgb24gQXJjdHVydXMKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxl
by5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgfCAg
MiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuaCB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuaAoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGZiNGM3YWFjOGQ5ZS4uMjE3YWZlMjNh
MmY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTYyLDYgKzYyLDcgQEAKICNp
bmNsdWRlICJ1dmRfdjdfMC5oIgogI2luY2x1ZGUgInZjZV92NF8wLmgiCiAjaW5jbHVkZSAidmNu
X3YxXzAuaCIKKyNpbmNsdWRlICJ2Y25fdjJfNS5oIgogI2luY2x1ZGUgImRjZV92aXJ0dWFsLmgi
CiAjaW5jbHVkZSAibXhncHVfYWkuaCIKICNpbmNsdWRlICJhbWRncHVfc211LmgiCkBAIC02ODMs
NiArNjg0LDcgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3ZpcnR1YWxf
aXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3Y5XzBf
aXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NF8w
X2lwX2Jsb2NrKTsKKwkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZjbl92Ml81
X2lwX2Jsb2NrKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjhkOWMwODAwYjhlMAotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmgKQEAgLTAsMCArMSwyOSBAQAorLyoKKyAqIENvcHly
aWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KKyAqCisgKiBQZXJtaXNzaW9u
IGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5p
bmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRp
b24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdp
dGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24KKyAqIHRoZSBy
aWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBz
dWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRv
IHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCisgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8g
ZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorICoKKyAqIFRoZSBh
Ym92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJl
IGluY2x1ZGVkIGluCisgKiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRo
ZSBTb2Z0d2FyZS4KKyAqCisgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVE
SU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFks
CisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5U
LiAgSU4gTk8gRVZFTlQgU0hBTEwKKyAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhP
UihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUgorICogT1RIRVIgTElBQklM
SVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0Us
CisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IKKyAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAq
CisgKi8KKworI2lmbmRlZiBfX1ZDTl9WMl81X0hfXworI2RlZmluZSBfX1ZDTl9WMl81X0hfXwor
CitleHRlcm4gY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIHZjbl92Ml81X2lw
X2Jsb2NrOworCisjZW5kaWYgLyogX19WQ05fVjJfNV9IX18gKi8KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
