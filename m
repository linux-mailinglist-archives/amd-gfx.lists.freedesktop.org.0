Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4969E0A
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE989E15;
	Mon, 15 Jul 2019 21:25:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB1A89E15
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w190so12866522qkc.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5MWfUbdjEZ/W1hBEToa30IH9tbpLG0rd+mYknZ/8So=;
 b=aIuqak8yBZZN7w0oWjHpARKFvl6P0Hn0y2J3KPydIDNFuYvhCkZ+N+SEUNoKmnNHvj
 5X3h/Xv/MFYHODEOVVwC1NVJmhjIhi6MsR/IIWYOqAK7Tbudt6vhRqmx3CVHwcuyLMQu
 uK2FRtv16gDLCPW6jaXxy59aUaVLg/8/ZtB72V4CN4RHIAMrWDvOXrqWgsjSiH/6UZmT
 5uL2BXhjvXnvwNh0C/a2DWvmOOFVWETvDIom49RvrwdxAPSd4jIvL8c9kPm1AveI/1gC
 1T7QqYNZ8AUFV9CHBDjQYFvUmvz/mQ6lDorksZP7sef0Kg7IQ9OqgjE75k4TM2R7GlG4
 gdpQ==
X-Gm-Message-State: APjAAAVJVezKpcdzZAhHrjmTajnnAFeQmDHyMnOM1IrfGxfQgxi/s9wd
 5+X0N3TO5hAiyZ47j5o1MddES5ic
X-Google-Smtp-Source: APXvYqzFNQLXyfk7faWEMZ69YZrSjMM6OftzSVRPZf0JyITc8TCoCSs01Pc3iopORlMKjtJeWOsnig==
X-Received: by 2002:ae9:eb87:: with SMTP id
 b129mr17763590qkg.453.1563225906789; 
 Mon, 15 Jul 2019 14:25:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 025/102] drm/amdgpu: add support for Arcturus firmware
Date: Mon, 15 Jul 2019 16:23:20 -0500
Message-Id: <20190715212437.31793-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5MWfUbdjEZ/W1hBEToa30IH9tbpLG0rd+mYknZ/8So=;
 b=Jw1CYffu4lICL4g5eSnGCRLwBGmKtLF/PeGs/J0W20iIXMPZiCjQFJGc3tHk9s/sYm
 DKtETbdGIGyKnmMTuVZ2khHd5rTSPhwA+InQg1mBQFKXEoKnKdh8EHPBFO0BsA5RfegO
 1p5Uvll7phLA1SAb0klcirJVmV3qbYYMf+fm5pqwmfHv6GP6HpKm1HllOuyK2AF1VBIZ
 V01x+HnTqO1jlVM9KeM/zmKHY1iPku1Wsk1YIeJy2ZIAeJ3HKhYH0mV3G8HMDXur292/
 gkQlkBfxsU0fTzeIrwaBI0gvKawWvxrgczdOxc0sZYpiiO2Bjd8WDUFO0IU12vndfuUe
 1TRA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxMCArKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGM2N2JiN2ZjNTFjMC4uNjI2MDcwZTBkMWUyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTEwMCw2ICsxMDAsMTMgQEAgTU9E
VUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX21lYzIuYmluIik7CiBNT0RVTEVfRklSTVdBUkUo
ImFtZGdwdS9yYXZlbjJfcmxjLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5f
a2lja2VyX3JsYy5iaW4iKTsKIAorTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfY2Uu
YmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19wZnAuYmluIik7CitNT0RV
TEVfRklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19tZS5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgi
YW1kZ3B1L2FyY3R1cnVzX21lYy5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1
cnVzX21lYzIuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19ybGMuYmlu
Iik7CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGlu
Z3NfZ2NfOV8wW10gPQogewogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREVC
VUcyLCAweGYwMGZmZmZmLCAweDAwMDAwNDAwKSwKQEAgLTY0MSw2ICs2NDgsOSBAQCBzdGF0aWMg
aW50IGdmeF92OV8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQllbHNlCiAJCQljaGlwX25hbWUgPSAicmF2ZW4iOwogCQlicmVhazsKKwljYXNlIENISVBfQVJD
VFVSVVM6CisJCWNoaXBfbmFtZSA9ICJhcmN0dXJ1cyI7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJ
CUJVRygpOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
