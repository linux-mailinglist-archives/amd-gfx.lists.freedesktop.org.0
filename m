Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3B49A4C
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE8A89EA6;
	Tue, 18 Jun 2019 07:19:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A5789319
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 21:46:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w9so873930wmd.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 14:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgUVVWOfe3VT6CVALeru6938GrNGUKE7L4oFo7SfTBE=;
 b=bGz9Dm4oyJYTMe+TNs1ZDVLT2/eM8++kMTlZyUaBPtvpSYJ6RTPDblaybi2lVG/MmA
 MobSoVUHvbCUhXk5e5MjSOou8h5S4yJDf8pXm7V4PFmNyuaSS8/bXO+zTwCfte4fW10q
 PJRJW3OevrPFs+iAZWdLjm5ctWjPPi/IQimXR7EoFI6q3A620jROLWyWOUNHP4T3XvWV
 CoTbknsnVhBBaDNpoaVvHusMiX9i7m9D8sspF2r7UmL+oY6RAyPl1rpAWcLf+qhO/RyG
 X5RUCI77L9bqBnJ5A52EGMiPWHt9bxSxJ7k/g433Jo5xHyv6nvou+kL8SxhmVD0AT3b+
 bUjg==
X-Gm-Message-State: APjAAAVmQnptxKQleSTna3FLf2/gr10xyrmraau4w/Vjbd8BrcdM5ePo
 8aOUkxQ+b3itDENIRS33yQGgds8W
X-Google-Smtp-Source: APXvYqwkmvcXieb6VP1km2EjWzzruCoR0vTZN36HZXhy90VIoJjapC7JvRsngyesDrnJ6h9Z1RyEwg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr467294wmc.77.1560807994791;
 Mon, 17 Jun 2019 14:46:34 -0700 (PDT)
Received: from prenex-laptop.localdomain ([79.121.87.45])
 by smtp.gmail.com with ESMTPSA id d4sm4833308wra.38.2019.06.17.14.46.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 14:46:34 -0700 (PDT)
From: Richard Thier <u9vata@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress
 200M
Date: Mon, 17 Jun 2019 23:46:27 +0200
Message-Id: <20190617214627.2768-1-u9vata@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgUVVWOfe3VT6CVALeru6938GrNGUKE7L4oFo7SfTBE=;
 b=hkzwE+/Oc2S7qR9IZnBcasPFEAbk/uvqbsa7N4+qeA7umogNinFDqC4KzMKSEnt3rN
 oONGymW+jurZwmDR7goEyIKHGVY7jvdF71MLQ6E1Rt+1uB7is1lOEuP55d4rdskQRNxr
 Ml6+iBPXbiHWxuZ9xLqNP/YuqogFMM8GbsxYvjk/Jw+QF47qIwr/wSVOP9vHyNJCKZAq
 MNyEIg9zfMfgFHq4nkKgSjAo1c4j97WzR6xkmZBRBmtv3tBqwh37We+ZrnVsCzUPkrSX
 o4pYvOyCDEtJ6HGhjke+3vZ9ZjGyzTCfCS9rTFD6QJa4ox+5wzyRoFfqUTk1dKzia98W
 ZZsQ==
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
Cc: Richard Thier <u9vata@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bnVtX2diX3BpcGVzIHdhcyBzZXQgdG8gYSB3cm9uZyB2YWx1ZSB1c2luZyByNDIwX3BpcGVfY29u
ZmlnCgpUaGlzIGhhdmUgbGVhZCB0byBIeXBlclogZ2xpdGNoZXMgb24gZmFzdCBaIGNsZWFyaW5n
LgoKU2VlOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTA4
OTcKClNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgVGhpZXIgPHU5dmF0YUBnbWFpbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMzAwLmMgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JzNDAwLmMgfCAyMSArKysrKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3IzMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjMwMC5jCmlu
ZGV4IDY1MjEyNmYuLjY3MjRjMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cjMwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjMwMC5jCkBAIC0zNTUsNyArMzU1
LDggQEAgaW50IHIzMDBfbWNfd2FpdF9mb3JfaWRsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIAlyZXR1cm4gLTE7CiB9CiAKLXN0YXRpYyB2b2lkIHIzMDBfZ3B1X2luaXQoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCisvKiByczQwMF9ncHVfaW5pdCBhbHNvIGNhbGxzIHRoaXMhICov
Cit2b2lkIHIzMDBfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB7CiAJdWlu
dDMyX3QgZ2JfdGlsZV9jb25maWcsIHRtcDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yczQwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yczQwMC5jCmluZGV4IDQx
MjEyMDkuLjQxMTc1NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcnM0MDAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JzNDAwLmMKQEAgLTMyLDYgKzMyLDkgQEAK
ICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgogI2luY2x1ZGUgInJzNDAwZC5oIgogCisvKiBOZWVk
ZWQgZm9yIHJzNDAwX2dwdV9pbml0IHRoYXQgZm9yd2FyZHMgdG8gdGhlIHIzMDAgb25lICovCit2
b2lkIHIzMDBfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOworCiAvKiBUaGlz
IGZpbGVzIGdhdGhlciBmdW5jdGlvbnMgc3BlY2lmaWNzIHRvIDogcnM0MDAscnM0ODAgKi8KIHN0
YXRpYyBpbnQgcnM0MDBfZGVidWdmc19wY2llX2dhcnRfaW5mb19pbml0KHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKIApAQCAtMjUyLDggKzI1NSwyMiBAQCBpbnQgcnM0MDBfbWNfd2FpdF9m
b3JfaWRsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAogc3RhdGljIHZvaWQgcnM0MDBf
Z3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB7Ci0JLyogRklYTUU6IGlzIHRo
aXMgY29ycmVjdCA/ICovCi0JcjQyMF9waXBlc19pbml0KHJkZXYpOworCS8qIEVhcmxpZXIgY29k
ZSB3YXMgY2FsbGluZyByNDIwX3BpcGVzX2luaXQgYW5kIHRoZW4KKwkgKiByczQwMF9tY193YWl0
X2Zvcl9pZGxlKHJkZXYpLiBUaGUgcHJvYmxlbSBpcyB0aGF0IAorCSAqIGF0IGxlYXN0IG9uIG15
IE1vYmlsaXR5IFJhZGVvbiBYcHJlc3MgMjAwTSBSQzQxMCBjYXJkCisJICogdGhhdCBlbmRzIHVw
IGluIHRoaXMgY29kZSBwYXRoIGVuZHMgdXAgbnVtX2diX3BpcGVzID09IDMKKwkgKiB3aGlsZSB0
aGUgY2FyZCBzZWVtcyB0byBoYXZlIG9ubHkgb25lIHBpcGUuIFdpdGggdGhlCisJICogcjQyMCBw
aXBlIGluaXRpYWxpemF0aW9uIG1ldGhvZC4KKwkgKgorCSAqIFByb2JsZW1zIHNob3duIHVwIGFz
IEh5cGVyWiBnbGl0Y2hlcywgc2VlOgorCSAqIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcv
c2hvd19idWcuY2dpP2lkPTExMDg5NworCSAqCisJICogRGVsZWdhdGluZyBpbml0aWFsaXphdGlv
biB0byByMzAwIGNvZGUgc2VlbXMgdG8gd29yaworCSAqIGFuZCByZXN1bHRzIGluIHByb3BlciBw
aXBlIG51bWJlcnMuIFRoZSByczQwMCBjYXJkcyAKKwkgKiBhcmUgc2FpZCB0byBiZSBub3QgcjQw
MCwgYnV0IHIzMDAga2luZCBvZiBjYXJkcy4KKwkgKi8KKwlyMzAwX2dwdV9pbml0KHJkZXYpOwor
CiAJaWYgKHJzNDAwX21jX3dhaXRfZm9yX2lkbGUocmRldikpIHsKIAkJcHJfd2FybigicnM0MDA6
IEZhaWxlZCB0byB3YWl0IE1DIGlkbGUgd2hpbGUgcHJvZ3JhbW1pbmcgcGlwZXMuIEJhZCB0aGlu
Z3MgbWlnaHQgaGFwcGVuLiAlMDh4XG4iLAogCQkJUlJFRzMyKFJBREVPTl9NQ19TVEFUVVMpKTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
