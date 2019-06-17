Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58E48F6B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D58989C6B;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3B89C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:09 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so12259697qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdDC67hqR/Sc3ydjXstcZOZQ+pdtDQZmAN8/abHdIUw=;
 b=tITzGANFvvXR0qhIJaeiudR3ixjVOZ+K/rcy+7b2jIa41osw5shcesu8z7OosA67An
 jkueKKAy/h7AbscpjPbKvN7e/cqRYMTFvCOSoGfxHzZcuMLksz4toujdVVH4V7rtX/S6
 YUu7FHx6M3xYXoP571bM+A3Y0CFdLc63EQwHbNHwXCY5an3gl0Ilp4UUgDyP1ndxlp9n
 yJeQRTscBYel+k5g5H/qbd9o33hMLCTIcG67FRDkSeJoL+8V8v1HGy1YG6MKajJ2o81A
 eAqth4+ZRz/AznJZGqbYtez88V42oTtnJhwVC24IS+jY+4inUiyPvBNkDXfn/AjCb3IX
 GlRA==
X-Gm-Message-State: APjAAAUDfqjGBFMUkjTEvTqHSXTPtbOah7IyqUpVelx9okICAKRhxtC/
 +jrAqCtwSDsvJw3bA0BYS4Itmv2KsXo=
X-Google-Smtp-Source: APXvYqwL1feftUUdfQobdQnl+Tl3CtDR5F+rt7g+neDkl4mmg2Ppw9w+bQYHds0AmFAnzGj3oVzreQ==
X-Received: by 2002:aed:2fa7:: with SMTP id m36mr69739125qtd.344.1560799928832; 
 Mon, 17 Jun 2019 12:32:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 261/459] drm/amd/powerplay/smu11: disable some pp features on
 navi10 A0 secure board
Date: Mon, 17 Jun 2019 14:30:28 -0500
Message-Id: <20190617193106.18231-62-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdDC67hqR/Sc3ydjXstcZOZQ+pdtDQZmAN8/abHdIUw=;
 b=A2EUVBmqP3WZUpK+hZyy8cHbwlT/2efyIPJIW8iAzBLXTVIVKm4fBbNtQHA1gmE5Ek
 K4XzQgW2GTlSLXNEKw8cc2jpXBMkMeAzMpaOdk0E3ouEgbukWdaKkNs40/xeYwfEHiOH
 v0RjGQZFLr7jVuHdB4F14b4qvY0REL0YSCG5IShu9YFYIvcuLGWVD/obdxo4y9rMXRaH
 QPbJ4TRHT7jDYUpn/m8ZyCJ/9WSgEywcAdsZYgEff0fD/FLx1P6PQFeUECIMeWeZPxS6
 8pyZS+NzQc0oYeEJBY5ZewcUmZMZLKgfNRYk4z6azvQdDY8pFXDss+RxRXZPn5IIxKxR
 Ng2Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKZGlzYWJsZSBEUE0gVUNMSyBhbmQg
U09DIERTIG9uIEEwIHNlY3VyZSBib2FyZAoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56
aG91MUBhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDEyICsrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMjUzODMwZjNjMzA3Li40ZjNkODYwNDU0
MGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTM0
MCw2ICszNDAsMTggQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKIAlpZiAoc211LT5hZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JU
X1ZDTikKIAkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVS
RV9WQ05fUEdfQklUKTsKIAorCS8qIGRpc2FibGUgRFBNIFVDTEsgYW5kIERTIFNPQ0NMSyBvbiBu
YXZpMTAgQTAgc2VjdXJlIGJvYXJkICovCisJaWYgKGlzX2FzaWNfc2VjdXJlKHNtdSkpIHsKKwkJ
Lyogb25seSBmb3IgbmF2aTEwIEEwICovCisJCWlmICgoYWRldi0+YXNpY190eXBlID09IENISVBf
TkFWSTEwKSAmJgorCQkJKGFkZXYtPnJldl9pZCA9PSAwKSkgeworCQkJKih1aW50NjRfdCAqKWZl
YXR1cmVfbWFzayAmPQorCQkJCQl+RkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKTsK
KwkJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgJj0KKwkJCQkJfkZFQVRVUkVfTUFTSyhGRUFU
VVJFX0RTX1NPQ0NMS19CSVQpOworCQl9CisJfQorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
