Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFD4C451
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 02:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71FB6E491;
	Thu, 20 Jun 2019 00:02:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77DC6E491
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 00:02:25 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r185so78704iod.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 17:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YofLK+7xfSNq0eMwwZvMnV8wjP4o8BQPTLFfZKe+8o=;
 b=UOk4BVao6K1sAVzPDOGObIsZAljKbDu7+uC1/jso8RxRWS0pGN7/B8g91mMhUcu/RI
 jAKSdervh2vaeNRf16b94KytntPb5zflbqYpZvasKWbsrJS08MV0Ef4Ne1ZG4LE8qlIj
 bt9m7YNKM4WITgrUG/NH24ALLgp1YT3B2ccY6NRSA1O7N49SzHs+CjpnU4PGDD5cunNM
 MJ9tYKb31aSbG2Vvllxez2M2ax3dkMl/v2rB0tTYgOEAh9dHeoOB+WNQgKZF28STwLys
 zizhNHs9Q78H/BVZidsgZPJt/JtvRED+OFxl1V1dQscBNUq3sj0GHl2HZN3fXLrvXiRb
 oSgg==
X-Gm-Message-State: APjAAAXan8gKQEZV0GbElT5mccC4KjCpQeNRGZdafrtH7HhGzdiqH3M8
 4qW4o8EWt5ZyGzd9NAM0OVtpMOHL
X-Google-Smtp-Source: APXvYqxKiVHRkeXZn59zI9lIZ3fJTT8vsKHRafIHT4A/l92aBZd3vj8A08BgAgHDoqIoaoZTPlxPAg==
X-Received: by 2002:a6b:5b01:: with SMTP id v1mr33790568ioh.120.1560988944856; 
 Wed, 19 Jun 2019 17:02:24 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id s6sm14047489ioo.31.2019.06.19.17.02.23
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 17:02:23 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: handle AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID
 on gfx10
Date: Wed, 19 Jun 2019 20:02:16 -0400
Message-Id: <20190620000216.14272-2-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620000216.14272-1-maraeo@gmail.com>
References: <20190620000216.14272-1-maraeo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8YofLK+7xfSNq0eMwwZvMnV8wjP4o8BQPTLFfZKe+8o=;
 b=SyBVlKr3lSCtnRUolYzJMdiERy1R50a7ds3brkZs1bE9L80U+y1knAa8Q8VoeztrL1
 6Up3FeHT5Dy6l5MW/YpUS42zG1KhpqiGeRbJCz/RjmfjAUCerE9WqTbkqRu4QoCyVWWp
 Rfdj6gWTSp1j8tislQGbASn7D9aTKLzC/dZyIpaX6sWI+eGSnWCO4PXhxGOFGqjmPmoz
 6UHfm/nffEQ5fZE/51r+vgrheODNdaEV5aajU2JNzhwGuzyBzkGy6t91efXmw6n8NpoF
 R75AuWIuTw6MQO3W5sODx6MLcPKCvDfRGrUz6IuIBavlvF4CWOH3L4Pfrs5p517PJbfr
 rcEg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jCmluZGV4IDc1YTM0Nzc5YTU3Yy4uNzc1MDdiMmE0NjUyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtNDI1OSwyMCArNDI1OSwzNiBAQCBzdGF0aWMgdm9pZCBn
ZnhfdjEwXzBfcmluZ19lbWl0X2liX2dmeChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiB9CiAK
IHN0YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfaWJfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsCiAJCQkJCSAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IsCiAJCQkJCSAgIHN0
cnVjdCBhbWRncHVfaWIgKmliLAogCQkJCQkgICB1aW50MzJfdCBmbGFncykKIHsKIAl1bnNpZ25l
ZCB2bWlkID0gQU1ER1BVX0pPQl9HRVRfVk1JRChqb2IpOwogCXUzMiBjb250cm9sID0gSU5ESVJF
Q1RfQlVGRkVSX1ZBTElEIHwgaWItPmxlbmd0aF9kdyB8ICh2bWlkIDw8IDI0KTsKIAorCS8qIEN1
cnJlbnRseSwgdGhlcmUgaXMgYSBoaWdoIHBvc3NpYmlsaXR5IHRvIGdldCB3YXZlIElEIG1pc21h
dGNoCisJICogYmV0d2VlbiBNRSBhbmQgR0RTLCBsZWFkaW5nIHRvIGEgaHcgZGVhZGxvY2ssIGJl
Y2F1c2UgTUUgZ2VuZXJhdGVzCisJICogZGlmZmVyZW50IHdhdmUgSURzIHRoYW4gdGhlIEdEUyBl
eHBlY3RzLiBUaGlzIHNpdHVhdGlvbiBoYXBwZW5zCisJICogcmFuZG9tbHkgd2hlbiBhdCBsZWFz
dCA1IGNvbXB1dGUgcGlwZXMgdXNlIEdEUyBvcmRlcmVkIGFwcGVuZC4KKwkgKiBUaGUgd2F2ZSBJ
RHMgZ2VuZXJhdGVkIGJ5IE1FIGFyZSBhbHNvIHdyb25nIGFmdGVyIHN1c3BlbmQvcmVzdW1lLgor
CSAqIFRob3NlIGFyZSBwcm9iYWJseSBidWdzIHNvbWV3aGVyZSBlbHNlIGluIHRoZSBrZXJuZWwg
ZHJpdmVyLgorCSAqCisJICogV3JpdGluZyBHRFNfQ09NUFVURV9NQVhfV0FWRV9JRCByZXNldHMg
d2F2ZSBJRCBjb3VudGVycyBpbiBNRSBhbmQKKwkgKiBHRFMgdG8gMCBmb3IgdGhpcyByaW5nICht
ZS9waXBlKS4KKwkgKi8KKwlpZiAoaWItPmZsYWdzICYgQU1ER1BVX0lCX0ZMQUdfUkVTRVRfR0RT
X01BWF9XQVZFX0lEKSB7CisJCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VU
M19TRVRfQ09ORklHX1JFRywgMSkpOworCQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBtbUdEU19D
T01QVVRFX01BWF9XQVZFX0lEKTsKKwkJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgcmluZy0+YWRl
di0+Z2RzLmdkc19jb21wdXRlX21heF93YXZlX2lkKTsKKwl9CisKIAlhbWRncHVfcmluZ193cml0
ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfSU5ESVJFQ1RfQlVGRkVSLCAyKSk7CiAJQlVHX09OKGli
LT5ncHVfYWRkciAmIDB4Myk7IC8qIER3b3JkIGFsaWduICovCiAJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywKICNpZmRlZiBfX0JJR19FTkRJQU4KIAkJCQkoMiA8PCAwKSB8CiAjZW5kaWYKIAkJCQls
b3dlcl8zMl9iaXRzKGliLT5ncHVfYWRkcikpOwogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIHVw
cGVyXzMyX2JpdHMoaWItPmdwdV9hZGRyKSk7CiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgY29u
dHJvbCk7CiB9CkBAIC01MTA1LDIwICs1MTIxLDIxIEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9z
ZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCX0KIH0KIAogc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX3NldF9nZHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IHsKIAkvKiBpbml0IGFzaWMgZ2RzIGluZm8gKi8KIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkg
ewogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJZGVmYXVsdDoKIAkJYWRldi0+Z2RzLmdkc19zaXplID0g
MHgxMDAwMDsKKwkJYWRldi0+Z2RzLmdkc19jb21wdXRlX21heF93YXZlX2lkID0gMHg0ZmY7CiAJ
CWFkZXYtPmdkcy52Z3RfZ3NfbWF4X3dhdmVfaWQgPSAweDNmZjsKIAkJYnJlYWs7CiAJfQogCiAJ
YWRldi0+Z2RzLmd3c19zaXplID0gNjQ7CiAJYWRldi0+Z2RzLm9hX3NpemUgPSAxNjsKIH0KIAog
c3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF91c2VyX3dncF9pbmFjdGl2ZV9iaXRtYXBfcGVyX3No
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkJCSAgdTMyIGJpdG1hcCkKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
