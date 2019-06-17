Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3948F8F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947089D43;
	Mon, 17 Jun 2019 19:32:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D079B89CDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x2so12278421qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O9v8Ud2nIesJkV6ogkT3RHoWV8uVQBW1DfpZZmpCG20=;
 b=NTB2vtldeS6HcVDGsPdwjR1nu9dZVHYQ4F2sIgEqa1yZzR2KDlL1Dtm7rSU6tOrDXK
 0jUk/moMJjvrWvCphlKtVEWta1XHN3W8L/IWfAdTm2eCC0Mje1KUbrjczJBPtB3kR44U
 +fA1AYqSrkmfcxL9sohcPEwsck3+EA2/0MklniWywqVWDs2Ab3TUBSkzWzcG4BSr2vpb
 2YdlohNRKVEEYDcBTDIS7HOVLJpODf8e3plFxTORl1tVlMY59EcOahsVg/Ifu8zIHqhP
 jMUss9DEg7BZt0VDftgQj7fMjv8RUmjggVmZMjOENjPZoRKnMG4a+VR92b6+vShNJi2V
 NaFw==
X-Gm-Message-State: APjAAAWop+rvcLTsxocG5SPyYsAdppKeyYEsagwkwJiCjjMpXznF2XIt
 7kWujrHBSNV9KI0kBc2VNb/UPVGxCJc=
X-Google-Smtp-Source: APXvYqyG8xsyd6aliIFiDU5MuI0guk2W7DCc09TZOwZ7UX+753Eome9fDTIN3AqlaX0sxG//fZiqsQ==
X-Received: by 2002:aed:3ec5:: with SMTP id o5mr68268008qtf.199.1560799948635; 
 Mon, 17 Jun 2019 12:32:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 283/459] drm/amd/powerplay: fix deadlock issue for
 smu_force_performance_level
Date: Mon, 17 Jun 2019 14:30:50 -0500
Message-Id: <20190617193106.18231-84-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O9v8Ud2nIesJkV6ogkT3RHoWV8uVQBW1DfpZZmpCG20=;
 b=osKlxxx9ledGBcXn+6oNWbSsk3NPylQmBGizgzElMnxd2Qo05c0m2hNx3LR4ldkowI
 oVo1hByearc2I+yoGmn4nlaXNK+nEzHSP0g+d3tyrsJdgn7+w9Q2yH2W5bdjOJY905Ll
 A7erMIaZQD6CWfKwO5vfZZC4euh3bv3Mf/Nr5Z6qmOjoR7nOAYN/FBITCRYtdbzx5Zk0
 RCVwGwgYB0+8/WMJePyjsQAsfv2PFzI2k3AGnw1b/S44dhhBqjD5Rp4R0eSQhRD/wVNq
 ogFP9Duc+mOoHi07IDM7hjDbpBaRMe/GnR6LlDs7x7kYFyVsLA7YrDJeJEHpPqgyO2id
 r6vw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBzbXUtPm11dGV4IGlz
IGludGVybmFsIGxvY2sgcmVzb3VyY2UgaW4gc3ctc211LCBzb21lIGZ1bmN0aW9ucyB3aWxsIHVz
ZQppdCBhdCB0aGUgc2FtZSB0aW1lLCBzbyBpdCBtYXliZSB3aWxsIGNhdXNlIGRlYWRsb2NrIGlz
c3VlLgp0aGlzIHBhdGNoIGZpeCB0aGlzIGlzc3VlIGluIHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9s
ZXZlbCBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAgfCA5
IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwg
NSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggNmI5N2YzMDk4MTE4
Li5jMzdkYjUxNjYzNDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBA
IC0zNzAsMTggKzM3MCw5IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfZHBtX2ZvcmNlZF9w
ZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJfQogCiAJaWYgKGlzX3N1cHBv
cnRfc3dfc211KGFkZXYpKSB7Ci0JCW11dGV4X2xvY2soJmFkZXYtPnBtLm11dGV4KTsKLQkJaWYg
KGFkZXYtPnBtLmRwbS50aGVybWFsX2FjdGl2ZSkgewotCQkJY291bnQgPSAtRUlOVkFMOwotCQkJ
bXV0ZXhfdW5sb2NrKCZhZGV2LT5wbS5tdXRleCk7Ci0JCQlnb3RvIGZhaWw7Ci0JCX0KIAkJcmV0
ID0gc211X2ZvcmNlX3BlcmZvcm1hbmNlX2xldmVsKCZhZGV2LT5zbXUsIGxldmVsKTsKIAkJaWYg
KHJldCkKIAkJCWNvdW50ID0gLUVJTlZBTDsKLQkJZWxzZQotCQkJYWRldi0+cG0uZHBtLmZvcmNl
ZF9sZXZlbCA9IGxldmVsOwotCQltdXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsKIAl9IGVs
c2UgaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+Zm9yY2VfcGVyZm9ybWFuY2VfbGV2ZWwp
IHsKIAkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOwogCQlpZiAoYWRldi0+cG0uZHBtLnRo
ZXJtYWxfYWN0aXZlKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKaW5kZXggOTM4NGMxYTVjNTk0Li5jYTE2ZWFkNDYzNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTE0NTksMTIgKzE0NTksMTUgQEAgaW50IHNt
dV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBh
bWRfZHBtX2ZvcmNlZF9sZXYKIAkJCWJyZWFrOwogCX0KIAotCW11dGV4X2xvY2soJnNtdS0+bXV0
ZXgpOwogCiAJc211LT5hZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPmVuYWJsZV91
bWRfcHN0YXRlKHNtdSwgJmxldmVsKTsKIAlyZXQgPSBzbXVfaGFuZGxlX3Rhc2soc211LCBsZXZl
bCwKIAkJCSAgICAgIEFNRF9QUF9UQVNLX1JFQURKVVNUX1BPV0VSX1NUQVRFKTsKKwlpZiAocmV0
KQorCQlyZXR1cm4gcmV0OwogCisJbXV0ZXhfbG9jaygmc211LT5tdXRleCk7CisJc211X2RwbV9j
dHgtPmRwbV9sZXZlbCA9IGxldmVsOwogCW11dGV4X3VubG9jaygmc211LT5tdXRleCk7CiAKIAly
ZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
