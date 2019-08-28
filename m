Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E4A0AD2
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FCA89E8C;
	Wed, 28 Aug 2019 19:56:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAAA89E5F
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id q64so981647qtd.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdR3/jXkbw1QqBxgGw/IFqva7hxFFOJdi+dx23ha9Dg=;
 b=ZrsfA6k0Inq3dYvINZGsTjVzqafZumbgsyYylf5gux0baH4oyHi4MqkdzCFsTAqmCI
 Tl5k/hmSe3gLV0SOFmABxHw88+ee02erRu4vhR3H7OG1ddX8QrlN8faC9Ez+AvsPcsvE
 veS5edTA+pn4qU2QBge2oUofk3XYoytaJmO5VQrTlFvcCtS9/pkpW90HO0T5fDzmJc2E
 Nb8V8wmfOyc2V1xMN+ZbenOO+8jY3vMwmMGIVweFlQk7S92FsFbQvj34S5f/4ccKe9da
 081kJtTXApMjiZr1WlAh+muDw+Gz3DXvKMopUl8/mymsaxtHAQwMYkUv04cVoqcLmD7T
 TR5Q==
X-Gm-Message-State: APjAAAVO0sx0Qh1H2wiYZ8ewhJMqV60nSOvcvTXzhjY0QMOxdZqQfWeE
 /kpOb0pPnQa9bdyOIA6lPgST91Vd
X-Google-Smtp-Source: APXvYqx0Yw6wguivZeGVomaJbgbP7x4S7CKcbMv/o/KdfVMXU3M01TxumOz+HoUcClg6m4fc7uqxCg==
X-Received: by 2002:a0c:9782:: with SMTP id l2mr4227865qvd.72.1567022194379;
 Wed, 28 Aug 2019 12:56:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/23] drm/amd/display: Add pp_smu functions for Renoir
Date: Wed, 28 Aug 2019 14:56:03 -0500
Message-Id: <20190828195622.28941-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdR3/jXkbw1QqBxgGw/IFqva7hxFFOJdi+dx23ha9Dg=;
 b=rKSLjKKoqvkWBTH8UA6FWdHb+/spCz2iSn69HKs5VngiCwPx3GDCi6TStWRBlv7vA5
 aiWDLL95J4HwiEMeEuhuwaIMimROAOi82J02vw2RJ2085G9bjeDNVNEdSR4+DEVBcTyW
 Wjn0RGmKlyIYaszufFWmAeZvNJdXXNJUg0Le89tmlDiv/NVkh34ySfjpTFn2shYgHQUT
 bYiD36b2Fd7vjBExcY8oPwFA+vHOiFhs1YTcJWesp7wcHm96MK3wUTiDGP20MSkNoBrg
 8COBB7oQCuboKEtGGPHFHx83a0vhONFlWKqV2nkiYoEujP9QYYhv13vO4qTwYWouCS30
 IAew==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpUaGlz
IGRlZmluZXMgdGhlIGludGVyZmFjZSBmb3IgY29tbXVuaWNhdGluZyByZXF1aXJlbWVudHMKYmV0
d2VlbiBEQyBhbmQgcG93ZXJwbGF5LgoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZG1fcHBfc211LmggfCA0NyArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kbV9wcF9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bV9wcF9zbXUuaAppbmRleCA2ODA2ODljYWI1ZGQuLmMwM2E0NDFlZTYzOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaApAQCAtNDQsNiArNDQsOSBAQCBlbnVt
IHBwX3NtdV92ZXIgewogI2lmbmRlZiBDT05GSUdfVFJJTV9EUk1fQU1EX0RDX0RDTjJfMAogCVBQ
X1NNVV9WRVJfTlYsCiAjZW5kaWYKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJf
MSkKKwlQUF9TTVVfVkVSX1JOLAorI2VuZGlmCiAKIAlQUF9TTVVfVkVSX01BWAogfTsKQEAgLTI0
Niw2ICsyNDksNDcgQEAgc3RydWN0IHBwX3NtdV9mdW5jc19udiB7CiB9OwogI2VuZGlmCiAKKyNp
ZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMSkKKworI2RlZmluZSBQUF9TTVVfTlVN
X1NPQ0NMS19EUE1fTEVWRUxTICA4CisjZGVmaW5lIFBQX1NNVV9OVU1fRENGQ0xLX0RQTV9MRVZF
TFMgIDQKKyNkZWZpbmUgUFBfU01VX05VTV9GQ0xLX0RQTV9MRVZFTFMgICAgNAorI2RlZmluZSBQ
UF9TTVVfTlVNX01FTUNMS19EUE1fTEVWRUxTICA0CisKK3N0cnVjdCBkcG1fY2xvY2sgeworICB1
aW50MzJfdCAgRnJlcTsgICAgLy8gSW4gTUh6CisgIHVpbnQzMl90ICBWb2w7ICAgICAvLyBNaWxs
aXZvbHRzIHdpdGggMiBmcmFjdGlvbmFsIGJpdHMKK307CisKKworLyogdGhpcyBpcyBhIGNvcHkg
b2YgdGhlIHN0cnVjdHVyZSBkZWZpbmVkIGluIHNtdXh4X2RyaXZlcl9pZi5oKi8KK3N0cnVjdCBk
cG1fY2xvY2tzIHsKKwlzdHJ1Y3QgZHBtX2Nsb2NrIERjZkNsb2Nrc1tQUF9TTVVfTlVNX0RDRkNM
S19EUE1fTEVWRUxTXTsKKwlzdHJ1Y3QgZHBtX2Nsb2NrIFNvY0Nsb2Nrc1tQUF9TTVVfTlVNX1NP
Q0NMS19EUE1fTEVWRUxTXTsKKwlzdHJ1Y3QgZHBtX2Nsb2NrIEZDbG9ja3NbUFBfU01VX05VTV9G
Q0xLX0RQTV9MRVZFTFNdOworCXN0cnVjdCBkcG1fY2xvY2sgTWVtQ2xvY2tzW1BQX1NNVV9OVU1f
TUVNQ0xLX0RQTV9MRVZFTFNdOworfTsKKworCitzdHJ1Y3QgcHBfc211X2Z1bmNzX3JuIHsKKwlz
dHJ1Y3QgcHBfc211IHBwX3NtdTsKKworCS8qCisJICogcmVhZGVyIGFuZCB3cml0ZXIgV00ncyBh
cmUgc2VudCB0b2dldGhlciBhcyBwYXJ0IG9mIG9uZSB0YWJsZQorCSAqCisJICogUFBTTUNfTVNH
X1NldERyaXZlckRyYW1BZGRySGlnaAorCSAqIFBQU01DX01TR19TZXREcml2ZXJEcmFtQWRkckxv
dworCSAqIFBQU01DX01TR19UcmFuc2ZlclRhYmxlRHJhbTJTbXUKKwkgKgorCSAqLworCWVudW0g
cHBfc211X3N0YXR1cyAoKnNldF93bV9yYW5nZXMpKHN0cnVjdCBwcF9zbXUgKnBwLAorCQkJc3Ry
dWN0IHBwX3NtdV93bV9yYW5nZV9zZXRzICpyYW5nZXMpOworCisJZW51bSBwcF9zbXVfc3RhdHVz
ICgqZ2V0X2RwbV9jbG9ja190YWJsZSkgKHN0cnVjdCBwcF9zbXUgKnBwLAorCQkJc3RydWN0IGRw
bV9jbG9ja3MgKmNsb2NrX3RhYmxlKTsKK307CisjZW5kaWYKKwogc3RydWN0IHBwX3NtdV9mdW5j
cyB7CiAJc3RydWN0IHBwX3NtdSBjdHg7CiAJdW5pb24gewpAQCAtMjUzLDYgKzI5Nyw5IEBAIHN0
cnVjdCBwcF9zbXVfZnVuY3MgewogI2lmbmRlZiBDT05GSUdfVFJJTV9EUk1fQU1EX0RDX0RDTjJf
MAogCQlzdHJ1Y3QgcHBfc211X2Z1bmNzX252IG52X2Z1bmNzOwogI2VuZGlmCisjaWYgZGVmaW5l
ZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisJCXN0cnVjdCBwcF9zbXVfZnVuY3Nfcm4gcm5f
ZnVuY3M7CisjZW5kaWYKIAogCX07CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
