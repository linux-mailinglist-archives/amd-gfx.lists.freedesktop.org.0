Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70F2AF86E
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Nov 2020 19:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0446E0DA;
	Wed, 11 Nov 2020 18:45:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4D66E0AB
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 18:35:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so3491272wrb.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=pZ+Qh5Ir0/lUkjSQsdZgT0qNsnE0Kwon6ayRY4sx+bJ7U2t95+wam8fCVcVYBQy3hX
 AuDoAsSXTh3xeuT4E4r2i+u0RRFD1EiCY9T3C0Xgkq8wSfVcPtW9PVHnim5Cnp+zsmT9
 zz112QT7ngXkmeKYTV3biTKexdGTYGHonT4el6Xo2iPzUX/ZkfMN3Du0t7dd80eMKzZP
 f93rAUQgaRHJzbR7P9KIZYs5AM0iFg4IUBa1MtgtG3Q/Owj5iXYPEx9PjJBnC5zbS6C8
 xR3zEPCXFZNsjaNtqFCbfMXBHlp+C98S3ZNNEW8ePYQAYo/iIenIqSTFaMe9Vs6uQnEw
 sEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=C8SewiHouMjdi0qn3ADjkRBOa7pXTr9RvVufwkwIe/6CDutoNMj1xI9WSUdRGlhhmb
 7KJVFKsi4QFHXUimUeF9opcCvWdeK1l9WM0x1sj4FVlNfARV/Nb/wbOBtVH+W0mUtKPL
 HxRpadErkD+xQeNjDlXubVcAwZLQOF0zeWKTwSr7qfCQfDAULGOwxeIQEJBaLG0iIToM
 AbWnMWZHXLkgZHnv/CDc7hyUIIMyKyUnfJyCNydd752ZEp7ZWgP7BoQQZjDY4G0P5Jb6
 j0xnOeXy0xtolFYbnycA/HXGAciQj2v734Yl7GVdXX4/nY/rRWNDZy2pHBWXk3tTxprR
 789A==
X-Gm-Message-State: AOAM5305iJVu0wPlJj2ATqNOAGN2pN2KytRBqtsbMy/GwaZM2IoSS9Xp
 7l+ltcarvHDov7SEP0wM7cVJ9w==
X-Google-Smtp-Source: ABdhPJzXU4WDrLLMPa79WjcoHOQsKAyxzRDNTbkyMczIslidwC4TN6humNF53xIsEkReAjLaT3O4uw==
X-Received: by 2002:adf:de91:: with SMTP id w17mr30549664wrl.84.1605119751376; 
 Wed, 11 Nov 2020 10:35:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:35:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/19] drm/radeon/r600: Move 'evergreen_rlc_resume()'s
 prototype to shared header
Date: Wed, 11 Nov 2020 18:35:28 +0000
Message-Id: <20201111183545.1756994-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 18:45:15 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzo0MzgwOjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYZXZlcmdyZWVuX3JsY19yZXN1bWXigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogNDM4MCB8IGludCBldmVyZ3JlZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldikKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ldmVyZ3JlZW4uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmgKaW5kZXggZWI0NmFjNzc3Njk1MS4uZjhk
NzcyZTYxMmE0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4u
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5oCkBAIC00OCw1ICs0OCw2
IEBAIHZvaWQgZXZlcmdyZWVuX2dwdV9wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKIHUzMiBldmVyZ3JlZW5fZ2V0X251bWJlcl9vZl9kcmFtX2NoYW5uZWxzKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgZXZlcmdyZWVuX3ByaW50X2dwdV9zdGF0
dXNfcmVncyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB1MzIgZXZlcmdyZWVuX2dwdV9j
aGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK2ludCBldmVyZ3Jl
ZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKICNlbmRpZgkJCQkv
KiBfX1JBREVPTl9FVkVSR1JFRU5fSF9fICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3I2MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCmluZGV4IDk0ZTg4
MTVlNTA2N2QuLmI0NGUwYzYwN2IxYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcjYwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCkBAIC0zOSw2ICsz
OSw3IEBACiAKICNpbmNsdWRlICJhdG9tLmgiCiAjaW5jbHVkZSAiYXZpdm9kLmgiCisjaW5jbHVk
ZSAiZXZlcmdyZWVuLmgiCiAjaW5jbHVkZSAicjYwMC5oIgogI2luY2x1ZGUgInI2MDBkLmgiCiAj
aW5jbHVkZSAicnY3NzAuaCIKQEAgLTExMyw3ICsxMTQsNiBAQCBzdGF0aWMgdm9pZCByNjAwX2dw
dV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgcjYwMF9maW5pKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgcjYwMF9pcnFfZGlzYWJsZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7CiBzdGF0aWMgdm9pZCByNjAwX3BjaWVfZ2VuMl9lbmFibGUoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIGludCBldmVyZ3JlZW5fcmxjX3Jlc3Vt
ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKIC8qCiAgKiBJbmRpcmVjdCByZWdpc3Rl
cnMgYWNjZXNzb3IKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cg==
