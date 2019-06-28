Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82459A6C
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 14:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AE36E90C;
	Fri, 28 Jun 2019 12:18:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028F86E90C
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 12:18:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c6so8801255wml.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 05:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0jI7zxm1oOHhu9/SNEgQnFsXgRYae37FrP4GLaEn7c=;
 b=klshU95/VQeOPgz5yj2b3vQLv+ys3qtji1fUcpqJSrocbajkb9Au7diJSmTvOYjBCE
 AP8lQOAoLSi//CA0ATwGE51zqzBKkqunywVKuPzKcZKZFP4oGICh/I4db9NUeewgyAEc
 yhzKDwgAk81of8Szxj43njQ8rw4FOfo2YjWYg0j7jj3TcgKkrut2p0sUnRu4a1qu1rd6
 4Zh8kh61ZnshLeuIlplgHZhV5iWn8iuAcniUrveEZApNpW3opslEB8ERWhWj5e/0t9Io
 FRKOFG6fQZabMHRIvrzKroWKO3OwwE1fZsAyUkYokR6s1DJgZYly4nlxEXp3FGPH//kX
 N7cw==
X-Gm-Message-State: APjAAAVWgg82ko7iFLNRvsnceoZziG0/IiDB89cViVA92qmwV8aZJ6rG
 hZAu3sPJzzl+ICfz3G4B69IR9Va+
X-Google-Smtp-Source: APXvYqy5bBiFpQWjcwaqeHyr/gy3HDSrastMaPl/EtdXqonWhVzzvFgIYx+R39NA8fdy9Fqa++5OQQ==
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr7213065wmk.10.1561724297609; 
 Fri, 28 Jun 2019 05:18:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6946:7a72:691a:cf7d])
 by smtp.gmail.com with ESMTPSA id a64sm7236740wmf.1.2019.06.28.05.18.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 05:18:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amdgpu: allow direct submission of clears
Date: Fri, 28 Jun 2019 14:18:11 +0200
Message-Id: <20190628121812.1400-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628121812.1400-1-christian.koenig@amd.com>
References: <20190628121812.1400-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0jI7zxm1oOHhu9/SNEgQnFsXgRYae37FrP4GLaEn7c=;
 b=Bz9CaEl4dpY7MiGUo39bVn8oyBszCw2c6UtBywBaRYjsj1OjqIrHB/3HM21lkg6bha
 hGBs0ycTm9vj4BM73kuLq56j9ex1MeF4HZdIb8VlHmbVE+8moUMxU42RJE/YtUQJRtCb
 m3aOUHUsghjA8zaARouO8QlU08M0pm5DLKF2O+n4xwLJHjzVPFFbztESNwD2iT0H9cyJ
 BnOL0jZh7P+lVZ+lbksfmHe6y6AgsA6KGkDZyzPWXTVo/aY0HxArP2G0f5/Uc1XKnwnz
 Cj4CFql/cWWDDLxxRMFo+7CSPXFGfOl9mHfHiMzV25rST/NlDsi+RkrZ3e2pu2SCBTE6
 9GVw==
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
Cc: Felix.Kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGhhbmRsaW5nIFBEL1BUIGNsZWFycyBkaXJlY3RseSBpbiB0aGUgZmF1bHQgaGFuZGxlci4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDE3ICsrKysr
KysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IGE4ZWE3YmYx
OGNmNi4uYTJkMThmZTQ2NjkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YwpAQCAtNjk1LDYgKzY5NSw3IEBAIGJvb2wgYW1kZ3B1X3ZtX3JlYWR5KHN0cnVjdCBhbWRncHVf
dm0gKnZtKQogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHZtOiBWTSB0byBj
bGVhciBCTyBmcm9tCiAgKiBAYm86IEJPIHRvIGNsZWFyCisgKiBAZGlyZWN0OiB1c2UgYSBkaXJl
Y3QgdXBkYXRlCiAgKgogICogUm9vdCBQRCBuZWVkcyB0byBiZSByZXNlcnZlZCB3aGVuIGNhbGxp
bmcgdGhpcy4KICAqCkBAIC03MDMsNyArNzA0LDggQEAgYm9vbCBhbWRncHVfdm1fcmVhZHkoc3Ry
dWN0IGFtZGdwdV92bSAqdm0pCiAgKi8KIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NsZWFyX2JvKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICAgc3RydWN0IGFtZGdwdV92bSAqdm0s
Ci0JCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibykKKwkJCSAgICAgIHN0cnVjdCBhbWRncHVf
Ym8gKmJvLAorCQkJICAgICAgYm9vbCBkaXJlY3QpCiB7CiAJc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4IGN0eCA9IHsgdHJ1ZSwgZmFsc2UgfTsKIAl1bnNpZ25lZCBsZXZlbCA9IGFkZXYtPnZtX21h
bmFnZXIucm9vdF9sZXZlbDsKQEAgLTc2Miw2ICs3NjQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bV9jbGVhcl9ibyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAltZW1zZXQoJnBhcmFtcywg
MCwgc2l6ZW9mKHBhcmFtcykpOwogCXBhcmFtcy5hZGV2ID0gYWRldjsKIAlwYXJhbXMudm0gPSB2
bTsKKwlwYXJhbXMuZGlyZWN0ID0gZGlyZWN0OwogCiAJciA9IHZtLT51cGRhdGVfZnVuY3MtPnBy
ZXBhcmUoJnBhcmFtcywgQU1ER1BVX0ZFTkNFX09XTkVSX0tGRCwgTlVMTCk7CiAJaWYgKHIpCkBA
IC04NTIsNyArODU1LDggQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2JvX3BhcmFtKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKICAqLwogc3RhdGljIGlu
dCBhbWRncHVfdm1fYWxsb2NfcHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAg
ICAgIHN0cnVjdCBhbWRncHVfdm0gKnZtLAotCQkJICAgICAgIHN0cnVjdCBhbWRncHVfdm1fcHRf
Y3Vyc29yICpjdXJzb3IpCisJCQkgICAgICAgc3RydWN0IGFtZGdwdV92bV9wdF9jdXJzb3IgKmN1
cnNvciwKKwkJCSAgICAgICBib29sIGRpcmVjdCkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ICpl
bnRyeSA9IGN1cnNvci0+ZW50cnk7CiAJc3RydWN0IGFtZGdwdV9ib19wYXJhbSBicDsKQEAgLTg4
NSw3ICs4ODksNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9hbGxvY19wdHMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJcHQtPnBhcmVudCA9IGFtZGdwdV9ib19yZWYoY3Vyc29yLT5wYXJl
bnQtPmJhc2UuYm8pOwogCWFtZGdwdV92bV9ib19iYXNlX2luaXQoJmVudHJ5LT5iYXNlLCB2bSwg
cHQpOwogCi0JciA9IGFtZGdwdV92bV9jbGVhcl9ibyhhZGV2LCB2bSwgcHQpOworCXIgPSBhbWRn
cHVfdm1fY2xlYXJfYm8oYWRldiwgdm0sIHB0LCBkaXJlY3QpOwogCWlmIChyKQogCQlnb3RvIGVy
cm9yX2ZyZWVfcHQ7CiAKQEAgLTEzOTUsNyArMTM5OSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zt
X3VwZGF0ZV9wdGVzKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAogCQl1
aW50NjRfdCBpbmNyLCBlbnRyeV9lbmQsIHBlX3N0YXJ0OwogCQlzdHJ1Y3QgYW1kZ3B1X2JvICpw
dDsKIAotCQlyID0gYW1kZ3B1X3ZtX2FsbG9jX3B0cyhwYXJhbXMtPmFkZXYsIHBhcmFtcy0+dm0s
ICZjdXJzb3IpOworCQlyID0gYW1kZ3B1X3ZtX2FsbG9jX3B0cyhwYXJhbXMtPmFkZXYsIHBhcmFt
cy0+dm0sICZjdXJzb3IsCisJCQkJCXBhcmFtcy0+ZGlyZWN0KTsKIAkJaWYgKHIpCiAJCQlyZXR1
cm4gcjsKIApAQCAtMjczMyw3ICsyNzM4LDcgQEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAogCWFtZGdwdV92bV9i
b19iYXNlX2luaXQoJnZtLT5yb290LmJhc2UsIHZtLCByb290KTsKIAotCXIgPSBhbWRncHVfdm1f
Y2xlYXJfYm8oYWRldiwgdm0sIHJvb3QpOworCXIgPSBhbWRncHVfdm1fY2xlYXJfYm8oYWRldiwg
dm0sIHJvb3QsIGZhbHNlKTsKIAlpZiAocikKIAkJZ290byBlcnJvcl91bnJlc2VydmU7CiAKQEAg
LTI4NTMsNyArMjg1OCw3IEBAIGludCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgdW5zCiAJICovCiAJaWYgKHB0
ZV9zdXBwb3J0X2F0cyAhPSB2bS0+cHRlX3N1cHBvcnRfYXRzKSB7CiAJCXZtLT5wdGVfc3VwcG9y
dF9hdHMgPSBwdGVfc3VwcG9ydF9hdHM7Ci0JCXIgPSBhbWRncHVfdm1fY2xlYXJfYm8oYWRldiwg
dm0sIHZtLT5yb290LmJhc2UuYm8pOworCQlyID0gYW1kZ3B1X3ZtX2NsZWFyX2JvKGFkZXYsIHZt
LCB2bS0+cm9vdC5iYXNlLmJvLCBmYWxzZSk7CiAJCWlmIChyKQogCQkJZ290byBmcmVlX2lkcjsK
IAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
