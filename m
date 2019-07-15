Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2869E18
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6155989E69;
	Mon, 15 Jul 2019 21:25:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1689E5A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:17 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w190so12866828qkc.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cBhWF596YQ80Eda9A4qp7oOdeuqMUD2HdUYpXuELzY=;
 b=GmZlDUthu8EmqxkLKCReVBebN+Jihu78S6iYtPWwIxTTcWLCH0oxOe4e9eaSMkhzAB
 SVPw7iSfHGKV9c1e3Udjcwmlzzz7PU2CQNtUc3n5GObrDQsewRM9HRJgkJcGzUBYlpig
 hFFKs2RcjI/R9RR9YarV/3hVlBJAmAygkFideljDxdJyrDHbrQnc/htQW3cFxGrUWsDh
 3y/Q18WfXkUvNz6EzcjwGmLTA9KZfxSprs4/5iCp0T9sd2sbhGjMnLUXky8gbppBQrHx
 LChDYOSEwuvy7r9zsg2Ch9jK+K7VZjQtZGsDo7stsRM/0b/2mDcyowzX2mXLbO4Uq19w
 SJAQ==
X-Gm-Message-State: APjAAAVHC/qPFeZaTX4gmUEq2zoxgJyqqY8EbtFqSM5tPFXkYuOpPoB5
 PUnoaixG+y9UX/yLGREVuwF6uyE1
X-Google-Smtp-Source: APXvYqy5Kd9oYUI+r1wrEZ7SuTvO7VIMoNWnRYqw5DbScWNeJ9DztsiX4rOcfylnJM7VXJF+LTpv4w==
X-Received: by 2002:a37:a94c:: with SMTP id s73mr17231307qke.425.1563225916717; 
 Mon, 15 Jul 2019 14:25:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 036/102] drm/amdgpu: correct Arcturus SDMA address space base
 index
Date: Mon, 15 Jul 2019 16:23:31 -0500
Message-Id: <20190715212437.31793-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cBhWF596YQ80Eda9A4qp7oOdeuqMUD2HdUYpXuELzY=;
 b=A0jA1YHZCGt2Gz966YiaibMWRxdX+E4rhfrhA41NdT11wojHfiEURlA84DK2WDnBQX
 zHsM40xljv7CWDh0rmbxMU8OAwkT4Pgy8mAXNFMA0qyZVOQxo+5iPI6c+yefdUVGpM9s
 KZLloh8rUcYrKGDSDTCTUze2bxOGTwgXZ5fjzrvuCHGMxoLXS5parha159wQC9P6LbH4
 SzlvlEmJML5D9OBupoKfCYP3/yYSLR8D/f344fQj9x7Fahdvyt5eAoWCwN/32EvSJfu2
 IdBQwQznSKK3QK5bxDhrl2Dp72MFyoYMp+a15xDX9j2+pLI2PFpPsidF0OSC6jty0cua
 WuWA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMTIgKysrKysr
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggZmMwMTUwMmJhZjAwLi45
NzQyMjhiOTE4ZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0y
MDgsMTcgKzIwOCwxNyBAQCBzdGF0aWMgdTMyIHNkbWFfdjRfMF9nZXRfcmVnX29mZnNldChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAljYXNlIDE6CiAJCXJldHVybiAoYWRldi0+cmVnX29m
ZnNldFtTRE1BMV9IV0lQXVswXVswXSArIG9mZnNldCk7CiAJY2FzZSAyOgotCQlyZXR1cm4gKGFk
ZXYtPnJlZ19vZmZzZXRbU0RNQTJfSFdJUF1bMF1bMF0gKyBvZmZzZXQpOworCQlyZXR1cm4gKGFk
ZXYtPnJlZ19vZmZzZXRbU0RNQTJfSFdJUF1bMF1bMV0gKyBvZmZzZXQpOwogCWNhc2UgMzoKLQkJ
cmV0dXJuIChhZGV2LT5yZWdfb2Zmc2V0W1NETUEzX0hXSVBdWzBdWzBdICsgb2Zmc2V0KTsKKwkJ
cmV0dXJuIChhZGV2LT5yZWdfb2Zmc2V0W1NETUEzX0hXSVBdWzBdWzFdICsgb2Zmc2V0KTsKIAlj
YXNlIDQ6Ci0JCXJldHVybiAoYWRldi0+cmVnX29mZnNldFtTRE1BNF9IV0lQXVswXVswXSArIG9m
ZnNldCk7CisJCXJldHVybiAoYWRldi0+cmVnX29mZnNldFtTRE1BNF9IV0lQXVswXVsxXSArIG9m
ZnNldCk7CiAJY2FzZSA1OgotCQlyZXR1cm4gKGFkZXYtPnJlZ19vZmZzZXRbU0RNQTVfSFdJUF1b
MF1bMF0gKyBvZmZzZXQpOworCQlyZXR1cm4gKGFkZXYtPnJlZ19vZmZzZXRbU0RNQTVfSFdJUF1b
MF1bMV0gKyBvZmZzZXQpOwogCWNhc2UgNjoKLQkJcmV0dXJuIChhZGV2LT5yZWdfb2Zmc2V0W1NE
TUE2X0hXSVBdWzBdWzBdICsgb2Zmc2V0KTsKKwkJcmV0dXJuIChhZGV2LT5yZWdfb2Zmc2V0W1NE
TUE2X0hXSVBdWzBdWzFdICsgb2Zmc2V0KTsKIAljYXNlIDc6Ci0JCXJldHVybiAoYWRldi0+cmVn
X29mZnNldFtTRE1BN19IV0lQXVswXVswXSArIG9mZnNldCk7CisJCXJldHVybiAoYWRldi0+cmVn
X29mZnNldFtTRE1BN19IV0lQXVswXVsxXSArIG9mZnNldCk7CiAJZGVmYXVsdDoKIAkJYnJlYWs7
CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
