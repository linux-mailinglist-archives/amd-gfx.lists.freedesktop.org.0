Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CC48F83
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7230F89CD7;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373189CB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:26 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id p15so12258373qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15uAE5X/bAb18UNLP11fE+GzoqVg5g7UxfagGAWNe74=;
 b=Knhw7lFfCHCfS0X4RYsD7eMte4A7t+W3/h1nsfsBcDEc3qGeoTPujwIsX8Typ9+Rxg
 kF0HFswgzxVlaYsFi6C7txPsfTAkz8o52Titht87CSILAq9POXeAYg+iF1tMA9ybYCj0
 GxTi+vfMNgYJ6QguK55wj6iYxavuw+JV5PchWZgj0YEiJLbJCKNmUJrfaWqsPTgXBPk8
 iu+nLhE3elO9l5nmBJJ1ulOazyW8QH4JPhNMzqg1H+KCmeU/EjhA/devzMah8j/3SSBp
 /4W/517BCTEWsT1mTTT2BT7mINT8Ic72BVc9V7yIzuS8fRMPJ/WIml2DQxfYi/sFF5Q0
 Cu6Q==
X-Gm-Message-State: APjAAAVthEMG9h+oR5UFzbY/nOIB3ZsiQUd3oaUQHU6a/OcFHX+PNUix
 UjpgOsr2c96rFE43tVG8mzcsHdi/h2w=
X-Google-Smtp-Source: APXvYqxErkZOn6FZZIIf9czFE949ZD6o9QE4s2N8yUdDKOwBTVF+gsdeerVHqLF9lrQkw/XY8cG4Fg==
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr82185255qta.169.1560799945242; 
 Mon, 17 Jun 2019 12:32:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 279/459] drm/amd/powerplay: add interface to get uclk dpm table
Date: Mon, 17 Jun 2019 14:30:46 -0500
Message-Id: <20190617193106.18231-80-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15uAE5X/bAb18UNLP11fE+GzoqVg5g7UxfagGAWNe74=;
 b=iQsCFj94MGDOFLyDqw6tgNhrYqn5oeEmCFgnjljNgnhC91VlPd/5FjBvACbtpd24W6
 CJ2Qzo99UBvFP28Km93uxA4IAbJjWgRjKGbwK0I3OAnKU8ERCrUTgwy/M9f2TtCNbmeC
 rhFklki0PhzKfXU+IaC++58XOch24lSlcABSEltltTgS6riBRta4YEXrcnF1OB5DfAKK
 xEw1ALk5f2PPT27m4vPiXWx2eRAnPgFiS+s4WRvnKamWb/prRrO5DR9fnWav1KTHHcgH
 yGhfkAmmNgwu95icHNPPHaK7wIdIb6nw/R+pn2qPUVwJyjNWKJ5oORCzLHHQmxn7hLqu
 37mQ==
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
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKZGMgbmVlZHMgZ2V0IHVjbGsg
ZHBtIHRhYmxlIGZvciBiYW5kd2lkdGggY2FsY3VsYXRpb24KClNpZ25lZC1vZmYtYnk6IGhlcnNl
biB3dSA8aGVyc2VueHMud3VAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAg
fCAgMyArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgIHwg
MzAgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5k
ZXggOGFjYzE3OTczNTc3Li5jY2I0MWZjNGY3NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtNjExLDYgKzYxMSw3IEBAIHN0cnVjdCBw
cHRhYmxlX2Z1bmNzIHsKIAkJCQkJICAgICBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKIAkJ
CQkJICAgICB1aW50MzJfdCAqdmFsdWUpOwogCWludCAoKmdldF90aGVybWFsX3RlbXBlcmF0dXJl
X3JhbmdlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNtdV90ZW1wZXJhdHVyZV9y
YW5nZSAqcmFuZ2UpOworCWludCAoKmdldF91Y2xrX2RwbV9zdGF0ZXMpKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCB1aW50MzJfdCAqY2xvY2tzX2luX2toeiwgdWludDMyX3QgKm51bV9zdGF0ZXMp
OwogfTsKIAogc3RydWN0IHNtdV9mdW5jcwpAQCAtODk3LDYgKzg5OCw4IEBAIHN0cnVjdCBzbXVf
ZnVuY3MKIAkoKHNtdSktPmZ1bmNzLT5yZWdpc3Rlcl9pcnFfaGFuZGxlciA/IChzbXUpLT5mdW5j
cy0+cmVnaXN0ZXJfaXJxX2hhbmRsZXIoc211KSA6IDApCiAjZGVmaW5lIHNtdV9zZXRfYXphbGlh
X2QzX3BtZShzbXUpIFwKIAkoKHNtdSktPmZ1bmNzLT5zZXRfYXphbGlhX2QzX3BtZSA/IChzbXUp
LT5mdW5jcy0+c2V0X2F6YWxpYV9kM19wbWUoKHNtdSkpIDogMCkKKyNkZWZpbmUgc211X2dldF91
Y2xrX2RwbV9zdGF0ZXMoc211LCBjbG9ja3NfaW5fa2h6LCBudW1fc3RhdGVzKSBcCisJKChzbXUp
LT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRf
dWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xvY2tzX2luX2toeiksIChudW1fc3RhdGVzKSkgOiAw
KQogCiBleHRlcm4gaW50IHNtdV9nZXRfYXRvbV9kYXRhX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MzJfdCB0YWJsZSwKIAkJCQkgICB1aW50MTZfdCAqc2l6ZSwgdWludDhfdCAq
ZnJldiwgdWludDhfdCAqY3JldiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwppbmRleCAxNTQxM2Y2NDZlNWEuLjRkYjVlY2QzODVhNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMTI0OCw2ICsxMjQ4LDM1IEBAIHN0
YXRpYyBpbnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXJl
dHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX2dldF91Y2xrX2RwbV9zdGF0ZXMoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpjbG9ja3NfaW5fa2h6LCB1aW50MzJfdCAq
bnVtX3N0YXRlcykKK3sKKwl1aW50MzJfdCBudW1fZGlzY3JldGVfbGV2ZWxzID0gMDsKKwl1aW50
MTZfdCAqZHBtX2xldmVscyA9IE5VTEw7CisJdWludDE2X3QgaSA9IDA7CisJc3RydWN0IHNtdV90
YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+c211X3RhYmxlOworCVBQVGFibGVf
dCAqZHJpdmVyX3BwdCA9IE5VTEw7CisKKwlpZiAoIWNsb2Nrc19pbl9raHogfHwgISBudW1fc3Rh
dGVzIHx8ICF0YWJsZV9jb250ZXh0LT5kcml2ZXJfcHB0YWJsZSkKKwkJcmV0dXJuIC1FSU5WQUw7
CisKKwlkcml2ZXJfcHB0ID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGU7CisJbnVtX2Rp
c2NyZXRlX2xldmVscyA9IGRyaXZlcl9wcHQtPkRwbURlc2NyaXB0b3JbUFBDTEtfVUNMS10uTnVt
RGlzY3JldGVMZXZlbHM7CisJZHBtX2xldmVscyA9IGRyaXZlcl9wcHQtPkZyZXFUYWJsZVVjbGs7
CisKKwlpZiAobnVtX2Rpc2NyZXRlX2xldmVscyA9PSAwIHx8IGRwbV9sZXZlbHMgPT0gTlVMTCkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwkqbnVtX3N0YXRlcyA9IG51bV9kaXNjcmV0ZV9sZXZlbHM7
CisJZm9yIChpID0gMDsgaSA8IG51bV9kaXNjcmV0ZV9sZXZlbHM7IGkrKykgeworCQkvKiBjb252
ZXJ0IHRvIGtoeiAqLworCQkqY2xvY2tzX2luX2toeiA9ICgqZHBtX2xldmVscykgKiAxMDAwOwor
CQljbG9ja3NfaW5fa2h6Kys7CisJCWRwbV9sZXZlbHMrKzsKKwl9CisKKwlyZXR1cm4gMDsKK30K
Kwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7
CiAJLnRhYmxlc19pbml0ID0gbmF2aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4
dCA9IG5hdmkxMF9hbGxvY2F0ZV9kcG1fY29udGV4dCwKQEAgLTEyODEsNiArMTMxMCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5n
ZXRfcHJvZmlsaW5nX2Nsa19tYXNrID0gbmF2aTEwX2dldF9wcm9maWxpbmdfY2xrX21hc2ssCiAJ
LnNldF93YXRlcm1hcmtzX3RhYmxlID0gbmF2aTEwX3NldF93YXRlcm1hcmtzX3RhYmxlLAogCS5y
ZWFkX3NlbnNvciA9IG5hdmkxMF9yZWFkX3NlbnNvciwKKwkuZ2V0X3VjbGtfZHBtX3N0YXRlcyA9
IG5hdmkxMF9nZXRfdWNsa19kcG1fc3RhdGVzLAogfTsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9m
dW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
