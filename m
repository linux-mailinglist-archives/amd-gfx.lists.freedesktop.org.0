Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948225D75C
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4F6E04E;
	Tue,  2 Jul 2019 20:29:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8D56E04B
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:07 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so20143136qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApXxYrxPm/+kEldPUZfWCOpyJdcq83JHdccyCHdpNgk=;
 b=CGpFU8tzjgGd6wsUb0x+prEI+SG4pIUzxkKKYbcOkVHUB9enr/bsfQg18c71lw5Tb1
 da+1Lr1sH1QjtpwzaRWRDLnVjQ4QI9na2gW6v6N71U7ceCL0tOg3g7DKJ9GoVAdTzY/J
 dVR9+abl+VTBuFKjhZrh45hBMK4psA8nRwRKJxJSuMJT0bRJ5gFDiohKJ4n6FjtTx16y
 NXmfR1nFtUafWMtDfefqwAJALd7qasWHKpCrWMjEM2wOGGytbeSkCFJ211miJ4uFtGFz
 5dFELNcFWG9y9HYK/hT7xT/9rBjUHE1qLd0uRJEEkUOCPc6PbXNdHDC3Jv2Pp8F16pbw
 cq2g==
X-Gm-Message-State: APjAAAUiAvB+ts+d4Arom9n+6n8vMh2TtmBchwXhDIsGmQn46a32Raj2
 yYUxoAhmBIsl6a01TXm+iyDdkXj9hYE=
X-Google-Smtp-Source: APXvYqxYc3dz1h7B6USFgL7EFohknVSXb/H2XXAu1P4Gtmh1aQzkJKs/wQ7L+jZ//3r2k2ogp25eTQ==
X-Received: by 2002:ac8:253d:: with SMTP id 58mr27579471qtm.40.1562099346182; 
 Tue, 02 Jul 2019 13:29:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/53] drm/amdgpu/sdma5: update sdma5 golden settings for
 navi14
Date: Tue,  2 Jul 2019 15:28:03 -0500
Message-Id: <20190702202844.17001-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ApXxYrxPm/+kEldPUZfWCOpyJdcq83JHdccyCHdpNgk=;
 b=oGEVshRXtU+bPITwCMIAA/Wr4PDMn/C6qJMnluq7ytyjbfs9hoIKtaLXyOhig5Ha+Z
 yS0qMTn67tk1U+H8HwILdiMBiVICwMJenjJK19krdoY2fweAZuhWo+1tdxqcDZ2FyCgi
 whb0Bt/frv25Sq5iL2EmaBUMxanpRLNOkQyMlCrY0eo6gLBXO+U1yU0Fw+LUm2AhFXQc
 8Gy0ujj6UUjFkImQ47Pudx3r7ofIw6iBiH8pcdoATiGtg87x/lFqInvFgbNhnDTTQAMw
 8vuQaBn6ciYylRU9v0bjNo6G35tikcI8el23NxQwRgLm7x9RO1+igf47OjCJds6h2Jwp
 jPdw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, tiancyin <tianci.yin@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCmFkZCBuZXcgcmVnaXN0ZXJzOgoJ
bW1TRE1BMF9STEMzX1JCX1dQVFJfUE9MTF9DTlRMLAoJbW1TRE1BMV9STEMzX1JCX1dQVFJfUE9M
TF9DTlRMCgpSZXZpZXdlZC1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKaW5kZXgg
OWVmMzZlYjNlY2ZkLi5kYmZiMTg0NTI5N2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjVfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jCkBAIC02Miw2ICs2Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVn
X2dvbGRlbiBnb2xkZW5fc2V0dGluZ3Nfc2RtYV81W10gPSB7CiAJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShHQywgMCwgbW1TRE1BMF9STEMwX1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAw
eDAwNDAzMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JMQzFf
UkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTBfUkxDMl9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZm
ZmZmNywgMHgwMDQwMzAwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1B
MF9STEMzX1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIAlTT0Mx
NV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JMQzRfUkJfV1BUUl9QT0xMX0NOVEws
IDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAs
IG1tU0RNQTBfUkxDNV9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAwMCks
CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMF9STEM2X1JCX1dQVFJfUE9M
TF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKQEAgLTczLDYgKzc0LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hXzVbXSA9
IHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUExX1JMQzBfUkJfV1BUUl9Q
T0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFM
VUUoR0MsIDAsIG1tU0RNQTFfUkxDMV9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgw
MDQwMzAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMV9STEMyX1JC
X1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKKwlTT0MxNV9SRUdfR09M
REVOX1ZBTFVFKEdDLCAwLCBtbVNETUExX1JMQzNfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZm
ZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTFf
UkxDNF9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAwMCksCiAJU09DMTVf
UkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMV9STEM1X1JCX1dQVFJfUE9MTF9DTlRMLCAw
eGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBt
bVNETUExX1JMQzZfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
