Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092B5D773
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FFC6E06D;
	Tue,  2 Jul 2019 20:29:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2C06E06D
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:28 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id a15so427qtn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vZbRRrbZNMz4OsBdlOnQDbOygHLE1Frh/YOeKRszWFk=;
 b=sK+dVUjBVSMFKPvsrP8psl32LGhaNWGyCcbKc0jUNBMGKRFdTHf3wbjpt7EF8GRYc2
 amhZxy4c7Z/r2akHzqtT89j2cd9KUDxSZqnuFj4ZMefoLwdY/JvpbEVpPlQooL/WXD9t
 2SaWTqdWcGOTX6YDwIx62SL3LxIuyTIOw13fpBmO0rbH+0uOBZ7hxleCD2S/0YYWgrTu
 TIjglecfPFzDAe4N4joT8Y09+WeS1RGPKrt9DgXeASPCmSVa1lzyvsM8pxzU/HHos9dX
 WDlawLj5XrGXUUbg+cvcMXgsRTwrmasiaZb2HOfUemb+S0xpta4sfD0ICkxWkQS7IWbI
 W+3A==
X-Gm-Message-State: APjAAAUyfkzG579yUIh8sROkUEK4jX1soEThWtukLfgdQZZk0TO2OnWd
 wKGv7hO/Mb+QUG2WHh0lpf1qKg6xjUs=
X-Google-Smtp-Source: APXvYqzSAz43Df04ywTyg2jBXQYnG0Yuq/rqtyKP2SdesnzpF3fuKtH6iwnifA0S3uxH6RFIjZ8lfw==
X-Received: by 2002:ac8:2f43:: with SMTP id k3mr27585379qta.179.1562099367531; 
 Tue, 02 Jul 2019 13:29:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 36/53] drm/amd/display: add NAVI14 in resource construct
Date: Tue,  2 Jul 2019 15:28:27 -0500
Message-Id: <20190702202844.17001-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vZbRRrbZNMz4OsBdlOnQDbOygHLE1Frh/YOeKRszWFk=;
 b=taR2OTM79rUYzyUeYpJ/KYcA48sllw5DCJqdkwfsa6MBPGnFgSPehdtGuxOw9gG6sN
 26mX46NpwmGVmsNdlJT9lrbW69CRiBK/a5kJq9GEjx/B/gs8nodbA3Hj5SLo8eJX81QP
 JbDO9eRQwAM+Cbj5QRRYYiYn3bHV7RlMobx6EFhg/MnDJkgcqZ+HbApOOc8Mo4Uwp80X
 h6IlBF+J4CfjrORXnkEO5prxAEcob8TVvkOkA0/uOFvcXz9Cv8Y9kjl/dtLMfLumu6wO
 +HFZKFRD6JCq/lTp5psug6+wTeOmnH7NgcfQoy8VGVj8WM+8bD3bj7o75BEDFbyLYvNM
 3pWw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpDaGFu
Z2UgdGhlIHBpcGVzIHRvIDUgaWYgdGhlIGFzaWMgaXMgbnYxNAoKVGhpcyBpcyBhIHRlbXAgcGF0
Y2gsIHRoZXJlIHdhcyBzb21lIHJlZmFjdG9yIGluIHRoZSBkbWwgcGFydCBvZiB0aGUgY29kZS4K
d2hpY2ggaXMgbm90IGluIHRoaXMgYnJhbmNoLiBmb3Igbm93IHRoaXMgaXMgZ29vZCwgd2UgY2Fu
IGltcGxlbWVudCB0aGlzCnByb3Blcmx5IG9uY2Ugd2UgaGF2ZSBhbiB1cGRhdGVkIGJyYW5jaC4K
ClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMjMg
KysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBmYTRmMzc4ZWZlNWIuLmMzOTExNTAxYTJjMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMKQEAgLTY5Myw2ICs2OTMsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY19w
bGFuZV9jYXAgcGxhbmVfY2FwID0gewogCQkJLmZwMTYgPSAxCiAJfQogfTsKK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVzb3VyY2VfY2FwcyByZXNfY2FwX252MTQgPSB7CisJCS5udW1fdGltaW5nX2dl
bmVyYXRvciA9IDUsCisJCS5udW1fb3BwID0gNSwKKwkJLm51bV92aWRlb19wbGFuZSA9IDUsCisJ
CS5udW1fYXVkaW8gPSA2LAorCQkubnVtX3N0cmVhbV9lbmNvZGVyID0gNSwKKwkJLm51bV9wbGwg
PSA1LAorCQkubnVtX2R3YiA9IDEsCisJCS5udW1fZGRjID0gNSwKK307CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZGNfZGVidWdfb3B0aW9ucyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7CiAJCS5kaXNh
YmxlX2RtY3UgPSB0cnVlLApAQCAtMjg2NiwxNyArMjg3NiwyMiBAQCBzdGF0aWMgYm9vbCBjb25z
dHJ1Y3QoCiAJc3RydWN0IGlycV9zZXJ2aWNlX2luaXRfZGF0YSBpbml0X2RhdGE7CiAKIAljdHgt
PmRjX2Jpb3MtPnJlZ3MgPSAmYmlvc19yZWdzOwotCi0JcG9vbC0+YmFzZS5yZXNfY2FwID0gJnJl
c19jYXBfbnYxMDsKIAlwb29sLT5iYXNlLmZ1bmNzID0gJmRjbjIwX3Jlc19wb29sX2Z1bmNzOwog
CisJaWYgKEFTSUNSRVZfSVNfTkFWSTE0X00oY3R4LT5hc2ljX2lkLmh3X2ludGVybmFsX3Jldikp
IHsKKwkJcG9vbC0+YmFzZS5yZXNfY2FwID0gJnJlc19jYXBfbnYxNDsKKwkJcG9vbC0+YmFzZS5w
aXBlX2NvdW50ID0gNTsKKwkJcG9vbC0+YmFzZS5tcGNjX2NvdW50ID0gNTsKKwl9IGVsc2Ugewor
CQlwb29sLT5iYXNlLnJlc19jYXAgPSAmcmVzX2NhcF9udjEwOworCQlwb29sLT5iYXNlLnBpcGVf
Y291bnQgPSA2OworCQlwb29sLT5iYXNlLm1wY2NfY291bnQgPSA2OworCX0KIAkvKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgogCSAqICBSZXNvdXJjZSAr
IGFzaWMgY2FwIGhhcmNvZGluZyAgICAgICAgICAgICAgICAqCiAJICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCiAJcG9vbC0+YmFzZS51bmRlcmxheV9w
aXBlX2luZGV4ID0gTk9fVU5ERVJMQVlfUElQRTsKIAotCXBvb2wtPmJhc2UucGlwZV9jb3VudCA9
IDY7Ci0JcG9vbC0+YmFzZS5tcGNjX2NvdW50ID0gNjsKIAlkYy0+Y2Fwcy5tYXhfZG93bnNjYWxl
X3JhdGlvID0gMjAwOwogCWRjLT5jYXBzLmkyY19zcGVlZF9pbl9raHogPSAxMDA7CiAJZGMtPmNh
cHMubWF4X2N1cnNvcl9zaXplID0gMjU2OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
