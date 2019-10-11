Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D7D374E
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B3B6EBA1;
	Fri, 11 Oct 2019 01:46:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B426EB9C
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:00 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j31so11652297qta.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pD84jKhAfP6Ef0YrnkNzO7r4e69AwJt8BtmUZTvwqHE=;
 b=oZS27DjUamEoCKAcPa/Rc7ikILwsG+qFfIJF+XJK2M9Oqx4uNqZTEf5Tf5PyYw8oaf
 e2SK1Sbpg3LOtGw0R2NaYWRT8qXVpVTgHWJ+KRvwkI6ECmyg9KIKATg/QkbBP7I++Mrh
 pk1JKgw/iNuBp4y2FANxDzSgrAVrVc+lmt/q8LSidPChUrgIfmJLad7Aqhl9qTP7rrcK
 xVQ4kfJbksQ0hXATFZDY4sc/5h200oXEHZI98ooBveSUupWTZLD1BETXPSdhZCXusHtL
 dT2mLBzRsOvxrtrUbpstHZaK/O6ItbFXEV5VwEPAkizNIPBNVmh7dSZvRJ6C6TOYkpWo
 XBkA==
X-Gm-Message-State: APjAAAXGaGDx6cz8cfcr3K2wOUDA+kMYXX+Za6TtWai1UOvxWwDG8Sxy
 cV7svDFHH4DyHo27uMJuK0y1FeJE
X-Google-Smtp-Source: APXvYqyOWCenIV2MPQOPGZitelnc90+LnK2mpWpuW7MAm+WFyYLdUmRX6dxDg5gKOOQdOSEy3H6/vQ==
X-Received: by 2002:ac8:534a:: with SMTP id d10mr14446700qto.349.1570758359839; 
 Thu, 10 Oct 2019 18:45:59 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 15/19] drm/amdgpu: enable runtime pm on BACO capable boards if
 runpm=1
Date: Thu, 10 Oct 2019 20:45:32 -0500
Message-Id: <20191011014536.10869-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pD84jKhAfP6Ef0YrnkNzO7r4e69AwJt8BtmUZTvwqHE=;
 b=gbhVogtm/avhp1i+igJe4xPbSjMsNBu/L9ZTgXe2cR5assXt7LMLcYqusmxcirKmYU
 2mG0tMfUIyIADLOZtQ6Wy3HQRkZpDrFhZqXzHgiQ3EHD7RGJyqPJ1BY2Vwuibgq8jFPA
 SqjAEeem6TNw7z6M0J3TqYy1NC/vW09HkB89J0Z31OWcs3bxatiDNKYIR94PoLpIcIe/
 gU0zaBWy9qdoVLUahBaCtLRUBIYfX1xPQX2Wz453p2iu1/g1kaA9LYNDmBn6xbq+flCx
 G411lSVV3uJE+/EXjehcSsfQjqfPfz5M0MuR0jVsS/8tPsScb4nz35AlAEIHNHQXgJbe
 6hCA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RXZlcnl0aGluZyBpcyBpbiBwbGFjZSBub3cuICBOb3QgZW5hYmxlZCBieSBkZWZhdWx0IHlldC4g
IFlvdQpzdGlsbCBoYXZlIHRvIHNwZWNpZnkgcnVucG09MS4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKaW5kZXggZjliMWViZTg3NWZlLi42M2FlOGZkNzZlNTMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKQEAgLTE5MiwxMCArMTkyLDYgQEAgaW50
IGFtZGdwdV9kcml2ZXJfbG9hZF9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQg
bG9uZyBmbGFncykKIAkgICAgIXBjaV9pc190aHVuZGVyYm9sdF9hdHRhY2hlZChkZXYtPnBkZXYp
KQogCQlmbGFncyB8PSBBTURfSVNfUFg7CiAKLQlpZiAoKGFtZGdwdV9ydW50aW1lX3BtICE9IDAp
ICYmCi0JICAgIChmbGFncyAmIEFNRF9JU19QWCkpCi0JCWFkZXYtPnJ1bnBtID0gdHJ1ZTsKLQog
CS8qIGFtZGdwdV9kZXZpY2VfaW5pdCBzaG91bGQgcmVwb3J0IG9ubHkgZmF0YWwgZXJyb3IKIAkg
KiBsaWtlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgb3IgaW9tYXBwaW5nIGZhaWx1cmUsCiAJ
ICogb3IgbWVtb3J5IG1hbmFnZXIgaW5pdGlhbGl6YXRpb24gZmFpbHVyZSwgaXQgbXVzdApAQCAt
MjA4LDYgKzIwNCwxMyBAQCBpbnQgYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcyhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCQlnb3RvIG91dDsKIAl9CiAKKwlpZiAo
YW1kZ3B1X2RldmljZV9zdXBwb3J0c19ib2NvKGRldikgJiYKKwkgICAgKGFtZGdwdV9ydW50aW1l
X3BtICE9IDApKSAvKiBlbmFibGUgcnVucG0gYnkgZGVmYXVsdCAqLworCQlhZGV2LT5ydW5wbSA9
IHRydWU7CisJZWxzZSBpZiAoYW1kZ3B1X2RldmljZV9zdXBwb3J0c19iYWNvKGRldikgJiYKKwkJ
IChhbWRncHVfcnVudGltZV9wbSA+IDApKSAvKiBlbmFibGUgcnVucG0gaWYgcnVucG09MSAqLwor
CQlhZGV2LT5ydW5wbSA9IHRydWU7CisKIAkvKiBDYWxsIEFDUEkgbWV0aG9kczogcmVxdWlyZSBt
b2Rlc2V0IGluaXQKIAkgKiBidXQgZmFpbHVyZSBpcyBub3QgZmF0YWwKIAkgKi8KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
