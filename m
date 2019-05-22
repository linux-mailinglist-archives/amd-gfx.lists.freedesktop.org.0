Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D526427
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 15:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20C899F0;
	Wed, 22 May 2019 12:59:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F05C89904;
 Wed, 22 May 2019 12:59:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y3so2153803wmm.2;
 Wed, 22 May 2019 05:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8uUTt1OX2Qrv47hnO8mGryyV+u/cOfMNHP6d215LAXM=;
 b=P9iKNAW6gGz5/+4LYxVDZNT/QTF5FUPMRa2DTaPLIZ5228LwONr5n15oo95G/UNYio
 /s1sMDUUoDKm52IdCBKhpTT1bbtae3vYZOdcOkNshdxlK+UGK6yeT5Amxho0sdUVW5Kq
 AhoyIk2oWZGaOjNu0v45IJAXK2yeVRS3542qQC3LY7/9pMmB/73Hwqnz1Dp4VmPgIbac
 lotPVLHt+vMO26y96Zdq0WO2TidF6f6VUk9hdaPhG6HfEla+zKgp6TXC6lg+ufhUJBKm
 LyiFZ6U/LTBir3O7HLNc5DUqzbblK0NbqaFD27zkhfViZm7rLHY+1w4ho6YasSDxjQyB
 fEEg==
X-Gm-Message-State: APjAAAX8DPZ2PwwRxT+SXg1cN930otTgKq6muLx2bVSFoHhxCG2kkHLM
 8zPLIbPm2LF/vTSoQ1B5ROqSlROV
X-Google-Smtp-Source: APXvYqzBV9bcCDZEnBz6S36alP/MnHdYEli458ecjwmZVmX1QJtBhliuVwjILNe+nAjWRSP7yYk11Q==
X-Received: by 2002:a1c:a615:: with SMTP id p21mr7231597wme.40.1558529992921; 
 Wed, 22 May 2019 05:59:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/10] drm/ttm: immediately move BOs to the new LRU v2
Date: Wed, 22 May 2019 14:59:42 +0200
Message-Id: <20190522125947.4592-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8uUTt1OX2Qrv47hnO8mGryyV+u/cOfMNHP6d215LAXM=;
 b=Ex7Zx8+Ve7u9X1GJ7761ansGBevjU85rulwSTUkDj9vNZEbO0HayD32ThKeAYpetck
 RaKd7f8U+6teFRDTE/X9G82jSgPDygzgLncZBKT2PfqApLuG7XDnyhGRKLxzN/yYK58p
 kbP46Br15FIMitCKBiuHnTqShoXmHpCIlytea4XRagjNCVSHSNXh/CV3dtQJ0aKNzqEJ
 dCWZi03FTqjSoCubw3qIZ5Y3iyUJfpEZS6J3rhyrhnatE5SMkE0ELOmfwGM6paTayHVD
 hd5oOUif6WF3gF6rJNDhGO715xof3JxdnqR/gPoZkAlGsnY4seuid1VnDvyM0umu8CH4
 HBaw==
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
CnRvIGNvbXBsZXRlLgoKdjI6IGdlbmVyYWxpemUgdGhlIHRlc3QKClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKaW5kZXggZmQ2ZGJlYmVhNDMwLi40YzYzODlkODQ5ZWQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwpAQCAtMTY2LDE3ICsxNjYsMTcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVh
c2VfbGlzdChzdHJ1Y3Qga3JlZiAqbGlzdF9rcmVmKQogCXR0bV9tZW1fZ2xvYmFsX2ZyZWUoYmRl
di0+Z2xvYi0+bWVtX2dsb2IsIGFjY19zaXplKTsKIH0KIAotdm9pZCB0dG1fYm9fYWRkX3RvX2xy
dShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQorc3RhdGljIHZvaWQgdHRtX2JvX2FkZF9t
ZW1fdG9fbHJ1KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCisJCQkJICBzdHJ1Y3QgdHRt
X21lbV9yZWcgKm1lbSkKIHsKIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2
OwogCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwogCiAJcmVzZXJ2YXRpb25fb2Jq
ZWN0X2Fzc2VydF9oZWxkKGJvLT5yZXN2KTsKKwlCVUdfT04oIWxpc3RfZW1wdHkoJmJvLT5scnUp
KTsKIAotCWlmICghKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpKSB7
Ci0JCUJVR19PTighbGlzdF9lbXB0eSgmYm8tPmxydSkpOwotCi0JCW1hbiA9ICZiZGV2LT5tYW5b
Ym8tPm1lbS5tZW1fdHlwZV07CisJaWYgKCEobWVtLT5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19O
T19FVklDVCkpIHsKKwkJbWFuID0gJmJkZXYtPm1hblttZW0tPm1lbV90eXBlXTsKIAkJbGlzdF9h
ZGRfdGFpbCgmYm8tPmxydSwgJm1hbi0+bHJ1W2JvLT5wcmlvcml0eV0pOwogCQlrcmVmX2dldCgm
Ym8tPmxpc3Rfa3JlZik7CiAKQEAgLTE4OCw2ICsxODgsMTEgQEAgdm9pZCB0dG1fYm9fYWRkX3Rv
X2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCQl9CiAJfQogfQorCit2b2lkIHR0
bV9ib19hZGRfdG9fbHJ1KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCit7CisJdHRtX2Jv
X2FkZF9tZW1fdG9fbHJ1KGJvLCAmYm8tPm1lbSk7Cit9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19h
ZGRfdG9fbHJ1KTsKIAogc3RhdGljIHZvaWQgdHRtX2JvX3JlZl9idWcoc3RydWN0IGtyZWYgKmxp
c3Rfa3JlZikKQEAgLTEwMDAsNiArMTAwNSwxNCBAQCBzdGF0aWMgaW50IHR0bV9ib19tZW1fcGxh
Y2VtZW50KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAltZW0tPm1lbV90eXBlID0g
bWVtX3R5cGU7CiAJbWVtLT5wbGFjZW1lbnQgPSBjdXJfZmxhZ3M7CisKKwlpZiAoYm8tPm1lbS5t
ZW1fdHlwZSA8IG1lbV90eXBlICYmICFsaXN0X2VtcHR5KCZiby0+bHJ1KSkgeworCQlzcGluX2xv
Y2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7CisJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8p
OworCQl0dG1fYm9fYWRkX21lbV90b19scnUoYm8sIG1lbSk7CisJCXNwaW5fdW5sb2NrKCZiby0+
YmRldi0+Z2xvYi0+bHJ1X2xvY2spOworCX0KKwogCXJldHVybiAwOwogfQogCkBAIC0xMDMzLDcg
KzEwNDYsNyBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAogCQlpZiAocmV0ID09IC1FQlVTWSkKIAkJCWNvbnRpbnVlOwogCQlpZiAocmV0KQotCQkJ
cmV0dXJuIHJldDsKKwkJCWdvdG8gZXJyb3I7CiAKIAkJdHlwZV9mb3VuZCA9IHRydWU7CiAJCW1l
bS0+bW1fbm9kZSA9IE5VTEw7CkBAIC0xMDQzLDEzICsxMDU2LDEzIEBAIGludCB0dG1fYm9fbWVt
X3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCW1hbiA9ICZiZGV2LT5tYW5b
bWVtLT5tZW1fdHlwZV07CiAJCXJldCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywg
cGxhY2UsIG1lbSk7CiAJCWlmICh1bmxpa2VseShyZXQpKQotCQkJcmV0dXJuIHJldDsKKwkJCWdv
dG8gZXJyb3I7CiAKIAkJaWYgKG1lbS0+bW1fbm9kZSkgewogCQkJcmV0ID0gdHRtX2JvX2FkZF9t
b3ZlX2ZlbmNlKGJvLCBtYW4sIG1lbSk7CiAJCQlpZiAodW5saWtlbHkocmV0KSkgewogCQkJCSgq
bWFuLT5mdW5jLT5wdXRfbm9kZSkobWFuLCBtZW0pOwotCQkJCXJldHVybiByZXQ7CisJCQkJZ290
byBlcnJvcjsKIAkJCX0KIAkJCXJldHVybiAwOwogCQl9CkBAIC0xMDYyLDcgKzEwNzUsNyBAQCBp
bnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAo
cmV0ID09IC1FQlVTWSkKIAkJCWNvbnRpbnVlOwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsK
KwkJCWdvdG8gZXJyb3I7CiAKIAkJdHlwZV9mb3VuZCA9IHRydWU7CiAJCW1lbS0+bW1fbm9kZSA9
IE5VTEw7CkBAIC0xMDc0LDE1ICsxMDg3LDIzIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQlyZXR1cm4gMDsKIAogCQlpZiAocmV0ICYmIHJl
dCAhPSAtRUJVU1kpCi0JCQlyZXR1cm4gcmV0OworCQkJZ290byBlcnJvcjsKIAl9CiAKKwlyZXQg
PSAtRU5PTUVNOwogCWlmICghdHlwZV9mb3VuZCkgewogCQlwcl9lcnIoVFRNX1BGWCAiTm8gY29t
cGF0aWJsZSBtZW1vcnkgdHlwZSBmb3VuZFxuIik7Ci0JCXJldHVybiAtRUlOVkFMOworCQlyZXQg
PSAtRUlOVkFMOwogCX0KIAotCXJldHVybiAtRU5PTUVNOworZXJyb3I6CisJaWYgKGJvLT5tZW0u
bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJiAhbGlzdF9lbXB0eSgmYm8tPmxydSkpIHsKKwkJ
c3Bpbl9sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOworCQl0dG1fYm9fbW92ZV90b19s
cnVfdGFpbChibywgTlVMTCk7CisJCXNwaW5fdW5sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xv
Y2spOworCX0KKworCXJldHVybiByZXQ7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19tZW1fc3Bh
Y2UpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
