Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23FD4975
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 22:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A466EC93;
	Fri, 11 Oct 2019 20:51:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE7D6EC93
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 20:51:17 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id h126so10126526qke.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AExgvc5EFgZ94w4zOkH/bzJvEADGkaZa5W1AwY2Sau0=;
 b=kXysr4bTsj4m2KTXN3tkHwoeCl+MKkTiIX902wTW71MY5WXTh2FpO6hhjoMBOe1ec6
 ce88IHIH6om53dgN/f6c59bCmUHXhW131JsWEcGedVQLQh4zRP99sdnh2B0/ByUBEzVP
 UPKK1E0uwcD0CzG6DyWmO9Lb5VHwJcs9GPXGDlZFu17dZvRr+etSJuz0Min+52ew4jhF
 /j15HiMMFNO1h0T89fynKCR0sUPCJ/Nb+y2h/S5KGuByZyfRF5s4u0zWifo0YNXqxvTM
 odDZFee00cvX1B1rgGvl59ZYeY/g1fOGJ70z/jjlb+Qf4vMKCuKynNc0V+dW0Rzf0xpR
 HWOA==
X-Gm-Message-State: APjAAAXunh159FqiF3+FipTSCizYB0eIbagJkZF5qDlPJQx9S0R6m7wR
 RjBiXb/7qu0c8Dii1iVb2G1VCMkw
X-Google-Smtp-Source: APXvYqwxfI5VfTA4E1MmmyFzvYl7K6aC4JnjRi/ZvkIB7rlJK6mKxajWgztT/S9w3LoZAgTP2jGdyw==
X-Received: by 2002:a37:93c4:: with SMTP id
 v187mr18154975qkd.490.1570827076061; 
 Fri, 11 Oct 2019 13:51:16 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id n21sm4841513qka.83.2019.10.11.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 13:51:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
Date: Fri, 11 Oct 2019 15:50:49 -0500
Message-Id: <20191011205050.21021-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AExgvc5EFgZ94w4zOkH/bzJvEADGkaZa5W1AwY2Sau0=;
 b=YI8uTK9MpQOiA7S/xOY/Rwnfsa8LOMw/rTOxkxuQa8joxHnCWRGShuDEFbBnyj/wd9
 KDXxjOhqIr5klGNHRmkwNQfkawCuhHkWVuagL8Xk+tuMcu2IYrg7wK528KoUdIpd6ulD
 lzEu+7EaeJbBLj3RSiLp/hXTiUYSJ32Ew/mWGySFZst+4e8Kac+jcdMsEDQAA96v2q2G
 DzIKyLZD+LSOhqMkQwY89DKaOMtubS7Zr7wN/pGdQqJ/UhmCl+gicp94/iX19IbjwR23
 U6pzxqqKfbcFKhx01Jd3XcG0YsXtz49Y8YNxZXGt0URcLiiuYDdSlBpAgXsSA20MGYEA
 07Tg==
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

V2UgbmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQpzZXNzaW9u
IGluZm8sIG90aGVyd2lzZSB0aGUgSUIgdGVzdCBjYW4gb3ZlcndyaXRlCm90aGVyIG1lbW9yeS4K
CkJ1ZzogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCmluZGV4IDY3MDc4NGE3ODUxMi4uOTA5YmMyY2U3OTFm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKQEAgLTIxNSwxMiArMjE1LDEy
IEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlCiAJdWludDY0X3QgZHVtbXk7CiAJaW50IGksIHI7
CiAKLQlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcg
KiA0LCAmam9iKTsKKwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIChp
Yl9zaXplX2R3ICogNCkgKyAxMDI0LCAmam9iKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKIAlp
YiA9ICZqb2ItPmlic1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVtbXkg
PSBpYi0+Z3B1X2FkZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOwogCiAJaWItPmxlbmd0aF9kdyA9IDA7
CiAJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKQEAgLTI3NywxMiArMjc3
LDEyIEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsCiAJdWludDY0X3QgZHVtbXk7CiAJaW50IGksIHI7CiAKLQlyID0gYW1k
Z3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcgKiA0LCAmam9iKTsK
KwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIChpYl9zaXplX2R3ICog
NCkgKyAxMDI0LCAmam9iKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKIAlpYiA9ICZqb2ItPmli
c1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVtbXkgPSBpYi0+Z3B1X2Fk
ZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOwogCiAJaWItPmxlbmd0aF9kdyA9IDA7CiAJaWItPnB0cltp
Yi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
