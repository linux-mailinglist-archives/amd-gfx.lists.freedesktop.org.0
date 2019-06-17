Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4A48F20
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096FE897CD;
	Mon, 17 Jun 2019 19:30:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F61897CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:50 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so12262033qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsPd5MnUfXe2LAfVqZeJXZbrnk76blAs2ay+bycqpRA=;
 b=mvfMq5z3fFtzqFwL+7fwOlzAWjE5xJ1zzIFknuz0bqMnsvTzuEzyw6pMisxW9jUJV4
 AVKZ/3rihaNNhOfShl9TVRhxYPn+2j1AhTmJbo5I0ZaEcVVN1iV10zqT3tsFwo6cIqx1
 NzSukmm6AE8UWXcUBvt7FDGouJkSBfUfi0xvwV4T1Ekiq3nKhu/np1CNqcHAKROcX01s
 4dL4kefiGafoHEWh8la6uigmprKfF2dFnGK6efirRlh/ogXTEApbCVGgsr5HiA5pBjxR
 zhHGUir/xa4Qih+MGyWAJox4cOgNhl97TBVOxUtScFWIuM8VLk4nlgVOdGKU1ujFcuo3
 LYFw==
X-Gm-Message-State: APjAAAXIyqc2ZTU2oZlUZMPkaW7S1WFLkswQH/6sjhv/okKcHccyA3bV
 m8CMpbkXL6e5dDHP+w9TBZUfZBJHqHk=
X-Google-Smtp-Source: APXvYqyZPvM+99jP+r2ThkFck0XO2BulRa378qjrXch3GBd8J0Ye7c8c8Q1NT2keKGjJ7nCxvskLzw==
X-Received: by 2002:ac8:26d9:: with SMTP id 25mr58903573qtp.377.1560799849687; 
 Mon, 17 Jun 2019 12:30:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 193/459] drm/amd/powerplay: set dpm_enabled flag but don't
 enable vcn dpm
Date: Mon, 17 Jun 2019 14:30:36 -0500
Message-Id: <20190617193042.18183-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsPd5MnUfXe2LAfVqZeJXZbrnk76blAs2ay+bycqpRA=;
 b=tbzNTzVLwDKvYYLWX33lAGSniFW4PTJDk6wKoLQnxJXnjiQWsUyWWl4LlIVSE0AqgL
 Fu3VwaH0Czxzvxd1JvJeTgM6D59Si7uHWVSzhUdd1Fxhrav5XocARI4owYK47E0CnSfU
 470A8m6TQi7WYk5bZsdQAhubSLYA6iAdBSyxn0LNh/Mr4/LwabbAgOwbV7Uo6QJ1j9Qj
 p1BCkf4wUHxhVCBxE53fzFDjURbCPHdYl8DmHDgCGV9VgPSyVelOyfMZ9+qg6V8x2zJa
 damQeiNj1LANxPJHn5V6JCEGFvV9Tpuo99i8m5pBbwqdRsHEggL+ZAyPopaicpNqxAGg
 JCag==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggc2V0cyBkcG1f
ZW5hYmxlZCBmbGFnIGJ1dCBkb24ndCBlbmFibGUgdmNuIGRwbSwgYmVjYXVzZSB2Y24gZHBtCmRv
ZXNuJ3Qgd29yayBzbyBmYXIgYW5kIHdlIG5lZWRzIHRvIGVuYWJsZSB0aGUgc3lzZnMgaW50ZXJm
YWNlcy4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkFja2Vk
LWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDUgKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y24uYwppbmRleCA2YTc0ZjU0OTllZjcuLjc2NTAxODMyMmFiZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwpAQCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV92Y25faWRsZV93b3JrX2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQogCiAJaWYgKGZlbmNlcyA9PSAwKSB7CiAJCWFtZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwg
dHJ1ZSk7Ci0JCWlmIChhZGV2LT5wbS5kcG1fZW5hYmxlZCkKKwkJaWYgKGFkZXYtPmFzaWNfdHlw
ZSAhPSBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdwdV9kcG1f
ZW5hYmxlX3V2ZChhZGV2LCBmYWxzZSk7CiAJCWVsc2UKIAkJCWFtZGdwdV9kZXZpY2VfaXBfc2V0
X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsIEFNRF9JUF9CTE9DS19UWVBFX1ZDTiwKQEAgLTI2Niw3
ICsyNjYsNyBAQCB2b2lkIGFtZGdwdV92Y25fcmluZ19iZWdpbl91c2Uoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKQogCiAJaWYgKHNldF9jbG9ja3MpIHsKIAkJYW1kZ3B1X2dmeF9vZmZfY3RybChh
ZGV2LCBmYWxzZSk7Ci0JCWlmIChhZGV2LT5wbS5kcG1fZW5hYmxlZCkKKwkJaWYgKGFkZXYtPmFz
aWNfdHlwZSAhPSBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdw
dV9kcG1fZW5hYmxlX3V2ZChhZGV2LCB0cnVlKTsKIAkJZWxzZQogCQkJYW1kZ3B1X2RldmljZV9p
cF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUoYWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfVkNOLApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDA2ZjVlNWNlOWRi
MS4uNjUyOTYzZTUyYTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCkBAIC04NjUsMTAgKzg2NSw3IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAq
aGFuZGxlKQogCWlmICghc211LT5wbV9lbmFibGVkKQogCQlhZGV2LT5wbS5kcG1fZW5hYmxlZCA9
IGZhbHNlOwogCWVsc2UKLQkJYWRldi0+cG0uZHBtX2VuYWJsZWQgPSB0cnVlOwotCS8qIFRPRE86
IHdpbGwgc2V0IGRwbV9lbmFibGVkIGZsYWcgd2hpbGUgVkNOIGFuZCBEQUwgRFBNIGlzIHdvcmth
YmxlICovCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkKLQkJYWRldi0+cG0u
ZHBtX2VuYWJsZWQgPSB0cnVlOworCQlhZGV2LT5wbS5kcG1fZW5hYmxlZCA9IHRydWU7CS8qIFRP
RE86IHdpbGwgc2V0IGRwbV9lbmFibGVkIGZsYWcgd2hpbGUgVkNOIGFuZCBEQUwgRFBNIGlzIHdv
cmthYmxlICovCiAKIAlwcl9pbmZvKCJTTVUgaXMgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5IVxu
Iik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
