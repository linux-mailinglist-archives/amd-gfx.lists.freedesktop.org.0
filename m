Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85146838F5
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 20:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559C89B0B;
	Tue,  6 Aug 2019 18:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAAE899FF
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 18:49:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p74so79205565wme.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 11:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1HOT3LfTX2Ks93POc9OmUAv0KLm+2VWMydZDhLHg6s=;
 b=DXKEZQkIuU6VpUinWxNZT3ZQ8c59G+LDOVjLPcsnXzxaIQts68OFRM6KEoXNXNhhu3
 9m8a2mhNQnVpn46HerjaYFF4sEDQ9NKe/C3Ns+6kBQfXEnTF7qDI18St99diAIXXZumo
 iFylJzpFZcYjFwvlgJNkLcbIZnO6H3iYlucafdppBhAG9CsuTThzdu3zdszikYni3KXH
 PZk61gS/zXlAtclGNbemh+wisXAcZk2HBaKrvYZSfjpH3FHT3A7cS1QOULIDYDcwccct
 h/xLlypDykQRbh8gLpIQB09ZNX8Gv1JbId4j+ruh/ZI31fcTqB9KTYGXsCc+FXykS9DF
 86IA==
X-Gm-Message-State: APjAAAV5cbgoe9aC0QImxvld+Iyl1uAH329sNJrX6VgEvIXfnatT+P+4
 1HaSU5FaX04GpVicCaTsnHv/GeJ4/R4oNLvma+M=
X-Google-Smtp-Source: APXvYqwXkKAQsLO/SQZJoUFpr4kAkhLx9Iegowv3BPLtQmyaJqbNoMGTuvL7w2LSpVe1+tMqzb6KF7FHboXgcFcdyUA=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr6283471wmk.127.1565117364232; 
 Tue, 06 Aug 2019 11:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190806181951.17091-1-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20190806181951.17091-1-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 14:49:13 -0400
Message-ID: <CADnq5_N6V4=JfFVY2d7GVhS5JQH4cp9guN+983NVkX8+5qMPsw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix gfx9 soft recovery
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P1HOT3LfTX2Ks93POc9OmUAv0KLm+2VWMydZDhLHg6s=;
 b=iAFkrfLgZVyxjPlYjnJ79r7EUIz7umzSINsekqFNAcrYnrEl5iY4Umkwfja0/Y+Uq+
 ZtaDckA8i8XbDgvxZj43h6dokXKoZBI1JQxjQYK0ajwP+1s8prHtntL5Xv2fWUoHWHX5
 bn4jsOLbzpvGmNR/ufBh+V/UYR1gMM2o3T5ZUROGhOqEu7LMtdz6/Uo+44/KCzKxvDJb
 xbFjY00t1zXpJAwBa1z0ny9xI+r+sUI49m61R3hR/sKU8kJPm1RWWtEFSyNCYI6w2GzX
 DmL9yhDZiCK1bf0tpM65O0pctNhr4WdEukVqqvFzeOf2PmpLmO0R4ksTh4I2AsCgKAME
 hevQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAyOjE5IFBNIFBlbGxvdXgtcHJheWVyLCBQaWVycmUtZXJp
Ywo8UGllcnJlLWVyaWMuUGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU09D
MTVfUkVHX09GRlNFVCgpIG1hY3JvIHdhc24ndCB1c2VkLCBtYWtpbmcgdGhlIHNvZnQgcmVjb3Zl
cnkgZmFpbC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIDxw
aWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYwo+IGluZGV4IGJjZDAzMDFlZWUxZS4uZmY4N2Y2ZWE1Y2Q2IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gQEAgLTUzNzUsNyArNTM3NSw3IEBAIHN0YXRpYyB2
b2lkIGdmeF92OV8wX3Jpbmdfc29mdF9yZWNvdmVyeShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcs
IHVuc2lnbmVkIHZtaWQpCj4gICAgICAgICB2YWx1ZSA9IFJFR19TRVRfRklFTEQodmFsdWUsIFNR
X0NNRCwgTU9ERSwgMHgwMSk7Cj4gICAgICAgICB2YWx1ZSA9IFJFR19TRVRfRklFTEQodmFsdWUs
IFNRX0NNRCwgQ0hFQ0tfVk1JRCwgMSk7Cj4gICAgICAgICB2YWx1ZSA9IFJFR19TRVRfRklFTEQo
dmFsdWUsIFNRX0NNRCwgVk1fSUQsIHZtaWQpOwo+IC0gICAgICAgV1JFRzMyKG1tU1FfQ01ELCB2
YWx1ZSk7Cj4gKyAgICAgICBXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1TUV9DTUQp
LCB2YWx1ZSk7CgpQbGVhc2UgdXNlIFdSRUczMl9TT0MxNSgpLiAgV2l0aCB0aGF0IGZpeGVkOgpS
ZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAg
fQo+Cj4gIHN0YXRpYyB2b2lkIGdmeF92OV8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAtLQo+IDIuMjMuMC5yYzEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
