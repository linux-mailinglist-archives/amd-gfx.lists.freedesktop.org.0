Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4222DCDB
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 14:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476E76E2ED;
	Wed, 29 May 2019 12:27:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970CD6E0FF;
 Wed, 29 May 2019 12:27:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so1473123wma.4;
 Wed, 29 May 2019 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a277SVWWmftsG1Y6vS/K7HsL+3FKEvVDv6yPrnJsiNQ=;
 b=iIUyDW4ahxMMiCl8BsEV+YE1ImJcP2O4HQz0oUGp/7AFYdcSKbO9WcYRL6qkqp2RJU
 KAqNsXsdV9nmh9ygqRLF2rqgqPgrH1IZKlvaaU1pyD6cM/0KoL2ryX0/VyEh5fkNg5JE
 v8GJLW8haBJPLy2u3wTiLTbrNYV6JdFWrA49to3wkbyyfNo8Jovab9ycp/8sflnKYQPs
 JpGMENQsNFjcJopxhFkHi1auOlvlKa8PXA2MMONcPG3v1GWl330YuHls9svIRwdnYEh3
 yqVZZBOngQz++9XbrtXmjeDEkUHjgBmFVOsIonPkaRNQsAx/fScEc1JJupDBcha4XH4u
 +WfA==
X-Gm-Message-State: APjAAAUeLMqdx7dGc4xA+v9GZ6NnYuQgQWUHiu1DaFnWgJai7eHqIVD4
 j/Rf9th0nLjrQxN/zi6g4AzjcegM
X-Google-Smtp-Source: APXvYqxaq0lfFiV4q+PosK5lw2PynnPm0gC3PbyNWyIxelUIXxCTpmkafdge74PlykVrKYNLmITvdA==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr5755756wmi.140.1559132827041; 
 Wed, 29 May 2019 05:27:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/10] drm/ttm: immediately move BOs to the new LRU v3
Date: Wed, 29 May 2019 14:26:57 +0200
Message-Id: <20190529122702.13035-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a277SVWWmftsG1Y6vS/K7HsL+3FKEvVDv6yPrnJsiNQ=;
 b=oi5rWH6CKl9jlnpB25NysKgCo0CCu+awBGYle80O3SzaewWmtQF+/dzOA4tsziogG/
 fImyByNjzkIdUeTckG0FFXgtqM3sqvYzeYlHDY3EtOSH2YcSGRE6VNRhZG+aNCjOzEvj
 vuWMKHgWLqtP46qQfEZAAATwNaJbOAFk+Kzzls97u+o0zMuaNAqJy+q4lYgb/eLXhdiN
 coc13lFWrUscouWhfqOPHtduPM2q3fyF9UxV12TNPi0B5n8+y/60097jsNWOwlY7MJvc
 6PqLfSWUAdJFYy8QJ0uLuQV4ijLXGBhG2ZCayxSwECFaTdYCplPTE4/0DzLppcSzSkSK
 pKEQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSBCT3Mgd2hpY2ggYXJlIGN1cnJlbnRseSBpbiBhIGxvd2VyIGRvbWFpbiB0byB0aGUgbmV3
CkxSVSBiZWZvcmUgYWxsb2NhdGluZyBiYWNraW5nIHNwYWNlIHdoaWxlIHZhbGlkYXRpbmcuCgpU
aGlzIG1ha2VzIHN1cmUgdGhhdCB3ZSBhbHdheXMgaGF2ZSBlbm91Z2ggZW50cmllcyBvbiB0aGUK
TFJVIHRvIGFsbG93IGZvciBvdGhlciBwcm9jZXNzZXMgdG8gd2FpdCBmb3IgYW4gb3BlcmF0aW9u
CnRvIGNvbXBsZXRlLgoKdjI6IGdlbmVyYWxpemUgdGhlIHRlc3QKdjM6IGZpeCByZWJhc2UgZXJy
b3IKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNDIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggMGRiYjIzYjBkZWRkLi44
YTg4NTljZjYwZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTY2LDcgKzE2Niw4IEBAIHN0YXRp
YyB2b2lkIHR0bV9ib19yZWxlYXNlX2xpc3Qoc3RydWN0IGtyZWYgKmxpc3Rfa3JlZikKIAl0dG1f
bWVtX2dsb2JhbF9mcmVlKGJkZXYtPmdsb2ItPm1lbV9nbG9iLCBhY2Nfc2l6ZSk7CiB9CiAKLXZv
aWQgdHRtX2JvX2FkZF90b19scnUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKK3N0YXRp
YyB2b2lkIHR0bV9ib19hZGRfbWVtX3RvX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAorCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCiB7CiAJc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYgPSBiby0+YmRldjsKIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbjsK
QEAgLTE3NiwxMCArMTc3LDEwIEBAIHZvaWQgdHRtX2JvX2FkZF90b19scnUoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibykKIAlpZiAoIWxpc3RfZW1wdHkoJmJvLT5scnUpKQogCQlyZXR1cm47
CiAKLQlpZiAoYm8tPm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkKKwlpZiAo
bWVtLT5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkKIAkJcmV0dXJuOwogCi0JbWFu
ID0gJmJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXTsKKwltYW4gPSAmYmRldi0+bWFuW21lbS0+
bWVtX3R5cGVdOwogCWxpc3RfYWRkX3RhaWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+cHJpb3Jp
dHldKTsKIAlrcmVmX2dldCgmYm8tPmxpc3Rfa3JlZik7CiAKQEAgLTE4OSw2ICsxOTAsMTEgQEAg
dm9pZCB0dG1fYm9fYWRkX3RvX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCQlr
cmVmX2dldCgmYm8tPmxpc3Rfa3JlZik7CiAJfQogfQorCit2b2lkIHR0bV9ib19hZGRfdG9fbHJ1
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCit7CisJdHRtX2JvX2FkZF9tZW1fdG9fbHJ1
KGJvLCAmYm8tPm1lbSk7Cit9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19hZGRfdG9fbHJ1KTsKIAog
c3RhdGljIHZvaWQgdHRtX2JvX3JlZl9idWcoc3RydWN0IGtyZWYgKmxpc3Rfa3JlZikKQEAgLTEw
MDEsNiArMTAwNywxNCBAQCBzdGF0aWMgaW50IHR0bV9ib19tZW1fcGxhY2VtZW50KHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAltZW0tPm1lbV90eXBlID0gbWVtX3R5cGU7CiAJbWVt
LT5wbGFjZW1lbnQgPSBjdXJfZmxhZ3M7CisKKwlpZiAoYm8tPm1lbS5tZW1fdHlwZSA8IG1lbV90
eXBlICYmICFsaXN0X2VtcHR5KCZiby0+bHJ1KSkgeworCQlzcGluX2xvY2soJmJvLT5iZGV2LT5n
bG9iLT5scnVfbG9jayk7CisJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOworCQl0dG1fYm9fYWRk
X21lbV90b19scnUoYm8sIG1lbSk7CisJCXNwaW5fdW5sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1
X2xvY2spOworCX0KKwogCXJldHVybiAwOwogfQogCkBAIC0xMDM0LDcgKzEwNDgsNyBAQCBpbnQg
dHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAocmV0
ID09IC1FQlVTWSkKIAkJCWNvbnRpbnVlOwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKKwkJ
CWdvdG8gZXJyb3I7CiAKIAkJdHlwZV9mb3VuZCA9IHRydWU7CiAJCW1lbS0+bW1fbm9kZSA9IE5V
TEw7CkBAIC0xMDQ0LDEzICsxMDU4LDEzIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCW1hbiA9ICZiZGV2LT5tYW5bbWVtLT5tZW1fdHlwZV07
CiAJCXJldCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1lbSk7CiAJ
CWlmICh1bmxpa2VseShyZXQpKQotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZXJyb3I7CiAKIAkJ
aWYgKG1lbS0+bW1fbm9kZSkgewogCQkJcmV0ID0gdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKGJvLCBt
YW4sIG1lbSk7CiAJCQlpZiAodW5saWtlbHkocmV0KSkgewogCQkJCSgqbWFuLT5mdW5jLT5wdXRf
bm9kZSkobWFuLCBtZW0pOwotCQkJCXJldHVybiByZXQ7CisJCQkJZ290byBlcnJvcjsKIAkJCX0K
IAkJCXJldHVybiAwOwogCQl9CkBAIC0xMDYzLDcgKzEwNzcsNyBAQCBpbnQgdHRtX2JvX21lbV9z
cGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAocmV0ID09IC1FQlVTWSkK
IAkJCWNvbnRpbnVlOwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZXJyb3I7
CiAKIAkJdHlwZV9mb3VuZCA9IHRydWU7CiAJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CkBAIC0xMDc1
LDE1ICsxMDg5LDIzIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCiAJCQlyZXR1cm4gMDsKIAogCQlpZiAocmV0ICYmIHJldCAhPSAtRUJVU1kpCi0J
CQlyZXR1cm4gcmV0OworCQkJZ290byBlcnJvcjsKIAl9CiAKKwlyZXQgPSAtRU5PTUVNOwogCWlm
ICghdHlwZV9mb3VuZCkgewogCQlwcl9lcnIoVFRNX1BGWCAiTm8gY29tcGF0aWJsZSBtZW1vcnkg
dHlwZSBmb3VuZFxuIik7Ci0JCXJldHVybiAtRUlOVkFMOworCQlyZXQgPSAtRUlOVkFMOwogCX0K
IAotCXJldHVybiAtRU5PTUVNOworZXJyb3I6CisJaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRN
X1BMX1NZU1RFTSAmJiAhbGlzdF9lbXB0eSgmYm8tPmxydSkpIHsKKwkJc3Bpbl9sb2NrKCZiby0+
YmRldi0+Z2xvYi0+bHJ1X2xvY2spOworCQl0dG1fYm9fbW92ZV90b19scnVfdGFpbChibywgTlVM
TCk7CisJCXNwaW5fdW5sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOworCX0KKworCXJl
dHVybiByZXQ7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19tZW1fc3BhY2UpOwogCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
