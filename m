Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D8B69C8
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 19:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA036F5B6;
	Wed, 18 Sep 2019 17:43:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5C6F5B6
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 17:43:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so267818wrv.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 10:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKkemcMIhQx6GYfFiCoed+BpwH2biJ9nM0vMpAKPtZ4=;
 b=obAAw9EHNMJhJiTEBoSiRwyEDhnamgvcqsH589WE344S2SqY54YR4V7rCDJ3fl3opZ
 5I8m6u7vlwgJLeEs4kfaDAIKnQtMTEA/QgsVIz4fxzYcR6gCRy8/FtPy50xUrjmywFZG
 oSmmc8OkRf/VJm+MucbIplmbEhzU22FrNYjXNlhkaC0GJK71y3snlktNp8iuhtF2UWbz
 yhetGFiU3ufw7jPhOwafEXf2Pi+HgldtwBiVgyQOydDeLpTuF81JAAqGfoxIM557+d1Z
 Vv6zr3ptPI5byopH9Vz1ZJivWk+Nna8kUl9OJU6VTLcF4dm5MhzTCm740ZuhBPp2JYUF
 T14w==
X-Gm-Message-State: APjAAAVfPBwLouttoba/en0W4bxWdTuLyuTZ/yF2u5jpPNV8WyPu9VXj
 TigqfMoZYnH+TzwVEx5uM+Bmi1Ta
X-Google-Smtp-Source: APXvYqwh/Vq+h0SkxdukaZsNtFNVU2jAy1zTC/vGgYHIbtjRp509EMFFTBv+nr6qR1V1f8MxCDG2Kg==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr3732087wrn.47.1568828590468; 
 Wed, 18 Sep 2019 10:43:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f002:ffad:c852:eff6])
 by smtp.gmail.com with ESMTPSA id a18sm14061517wrh.25.2019.09.18.10.43.09
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 10:43:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix error handling in amdgpu_bo_list_create
Date: Wed, 18 Sep 2019 19:43:08 +0200
Message-Id: <20190918174308.107845-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKkemcMIhQx6GYfFiCoed+BpwH2biJ9nM0vMpAKPtZ4=;
 b=U2ltCkMcd6Fegj+emU1vJEofbQbwRf5XO6BLCIwvnCrbXbfsWzXoGac77m9UU7iTVY
 L3dfMbaOBZdMvIvdC7wotVW4To0Lcr5FKdeVjd8NrL0sD23scrcpvJj4JTbyk2bhomsD
 wzQOJUzewkhMr2icjgWJ3kKkHhv1heqaQul2FEJEIHri1GyF3cCtKnd6dJI6NbMOu0jA
 FPWC1zLRBgKdKKIVPjaoUYGIqWkq9bJkrjmwNb5Kn1IlR6V5eV461LL9t6ZGSiG0+ASZ
 dYFdRFMXx/aoVUkkWf5Ehin2BT8DeZyD8r3YfFbBd4pYcbJ9/d8M48fjyNPz+1vRZnE3
 RD9g==
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

V2UgbmVlZCB0byBkcm9wIG5vcm1hbCBhbmQgdXNlcnB0ciBCT3Mgc2VwYXJhdGVseS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIHwgNyArKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMKaW5kZXggZDQ5NzQ2N2I3ZmM2
Li45NDkwOGJmMjY5YTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9ib19saXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Jv
X2xpc3QuYwpAQCAtMTM5LDcgKzEzOSwxMiBAQCBpbnQgYW1kZ3B1X2JvX2xpc3RfY3JlYXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCiAJcmV0dXJu
IDA7CiAKIGVycm9yX2ZyZWU6Ci0Jd2hpbGUgKGktLSkgeworCWZvciAoaSA9IDA7IGkgPCBsYXN0
X2VudHJ5OyArK2kpIHsKKwkJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2Jv
KGFycmF5W2ldLnR2LmJvKTsKKworCQlhbWRncHVfYm9fdW5yZWYoJmJvKTsKKwl9CisJZm9yIChp
ID0gZmlyc3RfdXNlcnB0cjsgaSA8IG51bV9lbnRyaWVzOyArK2kpIHsKIAkJc3RydWN0IGFtZGdw
dV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGFycmF5W2ldLnR2LmJvKTsKIAogCQlhbWRncHVf
Ym9fdW5yZWYoJmJvKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
