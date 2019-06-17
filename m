Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F2449087
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A466E08A;
	Mon, 17 Jun 2019 19:51:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FFE89FC8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12302004qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UjJP/R/DDoL3SUR2+TlXj9G1MlsO9qEd2Pnl4IwVX60=;
 b=VUIeDhLNlIM9QVkrTdBE1xujNZ+jtF9W2xgEjrNC5pVcQEuO9eOPdnbMbnFuf20501
 vIXA40kMOdL7vLkUWdGziyXrlSdGVsJTkyoIaUtut5LW0v4Eomn1CEybHYbwqQgxEsQi
 IaFYHoL/5ogzQX/N5Q/NHUh3j8K5/As1JmX7km3fnkBD8JokSPYFltyw8Nl+vQ5oDY2b
 G8J1YMGmg2IDXtbdE+ritZSYWu2LZDDq+HITMlfkQVnDkOcC9H/Sw10qQBmdPRNozTpR
 cU55XeJ7AzefjMPxPmIK/GUpkb2m+ckEjIvQSYC30xMXUWJe8o0AJbMx9JT47oNuOdNQ
 i6IA==
X-Gm-Message-State: APjAAAW5oMfRFj3tv7qKhrwh6dMNBYUUhMWbrQllPq/b8Kzze6daICkw
 dTJn1D+5QMhVzqItKaD6SYderUICV4ZavQ==
X-Google-Smtp-Source: APXvYqxEieRjKnNENmcr4YwudDc5JpwERQI/dsD1pvme7135FRI1aGnrD61N2ZDBIe/KtYqbh+nDiQ==
X-Received: by 2002:ac8:3971:: with SMTP id t46mr76932974qtb.164.1560801052788; 
 Mon, 17 Jun 2019 12:50:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 456/459] drm/amd/display: add missing mod_vmid destructor
Date: Mon, 17 Jun 2019 14:49:45 -0500
Message-Id: <20190617194948.18667-57-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UjJP/R/DDoL3SUR2+TlXj9G1MlsO9qEd2Pnl4IwVX60=;
 b=l93MvTtfMVZN3nj/+tT25FHAT0Zx1O0FsAFak6d0MLHusTLc1Md9Oqkg2Z/8dPEwdi
 s4UK8oJwt3FXeWvxO/Ey3ttmWoeR+Ji1drPK3g8irQkQlgDRYD6Fyk/cdnmh0cv5Y/Wi
 cpuf9yX5knO4fRXjpykmu6wZdd1AFz5iuKrvk+fRUQCnZdx4SNW5mgbx5mssGtteXfmQ
 B/kSZm0gg9Grwy6xH8+Wvw2MnIIUpjt3mdEJ+sSKQtA+ayr2HdPfegI//N8X5G7bh1cg
 xRvDfvyOWHDaVnDWHBsGng7oyldw9yIGhkkw4jm17RmIiHXxSRrRIxCZjkGHU8ZMreH4
 Ch+A==
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
 Charlene Liu <Charlene.Liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCm1v
ZF92bWlkIGlzIG1pc3NpbmcgYSBkZXN0cnVjdG9yLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExh
a3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJs
ZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2luYy9tb2Rfdm1pZC5oIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvdm1pZC92bWlkLmMgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaW5jL21vZF92bWlkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9pbmMvbW9kX3ZtaWQuaAppbmRleCBjNzY3MmYzYjgzN2YuLmEzNzg3ZmRmMGMw
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21v
ZF92bWlkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21v
ZF92bWlkLmgKQEAgLTQxLDQgKzQxLDYgQEAgc3RydWN0IG1vZF92bWlkICptb2Rfdm1pZF9jcmVh
dGUoCiAJCXVuc2lnbmVkIGludCBudW1fdm1pZCwKIAkJc3RydWN0IGRjX3ZpcnR1YWxfYWRkcl9z
cGFjZV9jb25maWcgKnZhX2NvbmZpZyk7CiAKK3ZvaWQgbW9kX3ZtaWRfZGVzdHJveShzdHJ1Y3Qg
bW9kX3ZtaWQgKm1vZF92bWlkKTsKKwogI2VuZGlmIC8qIE1PRF9WTUlEX0hfICovCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy92bWlkL3ZtaWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL3ZtaWQvdm1pZC5jCmluZGV4IDQzMTA1
MjYyNmQ5My4uZjBhMTUzNzA0ZjZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvbW9kdWxlcy92bWlkL3ZtaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy92bWlkL3ZtaWQuYwpAQCAtMTU2LDMgKzE1NiwxMiBAQCBzdHJ1Y3QgbW9kX3Zt
aWQgKm1vZF92bWlkX2NyZWF0ZSgKIGZhaWxfZGNfbnVsbDoKIAlyZXR1cm4gTlVMTDsKIH0KKwor
dm9pZCBtb2Rfdm1pZF9kZXN0cm95KHN0cnVjdCBtb2Rfdm1pZCAqbW9kX3ZtaWQpCit7CisJaWYg
KG1vZF92bWlkICE9IE5VTEwpIHsKKwkJc3RydWN0IGNvcmVfdm1pZCAqY29yZV92bWlkID0gTU9E
X1ZNSURfVE9fQ09SRShtb2Rfdm1pZCk7CisKKwkJa2ZyZWUoY29yZV92bWlkKTsKKwl9Cit9Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
