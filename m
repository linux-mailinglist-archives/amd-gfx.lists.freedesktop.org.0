Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A8D36D1
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07506EB97;
	Fri, 11 Oct 2019 01:21:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474266EB97
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id v52so11565880qtb.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Flhoo0dlyEjyT/s+ZjI7CDj9NM8rxL341uWQE/QHlM=;
 b=kNNgPeLAnhp+A6aqSllVvZCvAs8bvSPsKJL1usLJ8tpy32G5R6EDHNdg0kqWAN7sMQ
 nnNGHFS5ng8/BqCvv2ZMfiNr8uEEWzB5VlOzqjKS201OIUuCeOpVfx4OPHvBKIa51OnF
 ilkF4dh3Xm1xewH4FI2NcbRARXhdcn2HRH561MMt6f/uESANizbdfvqAQ29Ovd2AtlE1
 jRc4FVOjc7L+UgRZU0EhZZz02TQEm9pF6KHQCjZY7fx9zKN4JuCgLlkIu4+FlnbitE49
 3a9+8WVlnJ2+Er2vf6hP6PKssEdtKoFBg+vLfBOt+hbYMI85MIr4pz+doEEQD9SMaEO/
 jgeg==
X-Gm-Message-State: APjAAAUma70BJLPIYNGH+McMIRLnvz+RLREGkW7hK/gG0+4djtp8L/sj
 kOgDApSlnE7Mo7x5uXm4W2pRG7zN
X-Google-Smtp-Source: APXvYqx0XdfVsQId4zw8Ojd/NwYyLMjTWYqwlhEAZOoGNA4d+LXf8q6ChJFEI5r/6R0P1GqmEfHanA==
X-Received: by 2002:ac8:1e91:: with SMTP id c17mr14342578qtm.348.1570756910059; 
 Thu, 10 Oct 2019 18:21:50 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/15] drm/amdgpu/powerplay: add core support for pre-SOC15
 baco
Date: Thu, 10 Oct 2019 20:21:26 -0500
Message-Id: <20191011012135.18566-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Flhoo0dlyEjyT/s+ZjI7CDj9NM8rxL341uWQE/QHlM=;
 b=U/ClhL7fEFjt7coKUB1m1pKXmKHfuQTIeUxzckpRhCKoGl8cqHWUdzTdc3UuorULYi
 dfayEqk+1MH1tzB5bHww7aurJd+Iz5fLf3Bu8pihLqC/7OCUvnhnd3HeXatGt40/PMYL
 2XTsdTy3xNwhz9oYKa7KgX4g672CfRuMhnWrHXymuWPKEaaFA+GPZjnVn+tYGNGyiemx
 4CkPZxyToUI3LZxbRmHww95i0ucUXD0h2D4m+ZspBfI34Xz6UvKOGpk+psBIeM/p3ri4
 vwPRR8LiWv0pvz49mHZPw4VQ10BoJnUrNhry+t2ReZm7NxUcea3O8mEGjU8v5Zbi/UQU
 KnLw==
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

VGhpcyBhZGRzIGNvcmUgc3VwcG9ydCBmb3IgQkFDTyBvbiBwcmUtdmVnYSBhc2ljcy4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAu
Li4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NvbW1vbl9iYWNvLmMgfCAxOSArKysrKysr
KysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NvbW1vbl9iYWNv
LmggfCAxMyArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jb21tb25f
YmFjby5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY29tbW9uX2JhY28u
YwppbmRleCA5YzU3YzFmNjc3NDkuLjFjNzM3NzZiZDYwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY29tbW9uX2JhY28uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jb21tb25fYmFjby5jCkBAIC03OSw2ICs3OSwyNSBA
QCBzdGF0aWMgYm9vbCBiYWNvX2NtZF9oYW5kbGVyKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIHUz
MiBjb21tYW5kLCB1MzIgcmVnLCB1MzIgbQogCXJldHVybiByZXQ7CiB9CiAKK2Jvb2wgYmFjb19w
cm9ncmFtX3JlZ2lzdGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAorCQkJICAgIGNvbnN0IHN0
cnVjdCBiYWNvX2NtZF9lbnRyeSAqZW50cnksCisJCQkgICAgY29uc3QgdTMyIGFycmF5X3NpemUp
Cit7CisJdTMyIGksIHJlZyA9IDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgYXJyYXlfc2l6ZTsgaSsr
KSB7CisJCWlmICgoZW50cnlbaV0uY21kID09IENNRF9XUklURSkgfHwKKwkJICAgIChlbnRyeVtp
XS5jbWQgPT0gQ01EX1JFQURNT0RJRllXUklURSkgfHwKKwkJICAgIChlbnRyeVtpXS5jbWQgPT0g
Q01EX1dBSVRGT1IpKQorCQkJcmVnID0gZW50cnlbaV0ucmVnX29mZnNldDsKKwkJaWYgKCFiYWNv
X2NtZF9oYW5kbGVyKGh3bWdyLCBlbnRyeVtpXS5jbWQsIHJlZywgZW50cnlbaV0ubWFzaywKKwkJ
CQkgICAgIGVudHJ5W2ldLnNoaWZ0LCBlbnRyeVtpXS52YWwsIGVudHJ5W2ldLnRpbWVvdXQpKQor
CQkJcmV0dXJuIGZhbHNlOworCX0KKworCXJldHVybiB0cnVlOworfQorCiBib29sIHNvYzE1X2Jh
Y29fcHJvZ3JhbV9yZWdpc3RlcnMoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJCQkgY29uc3Qg
c3RydWN0IHNvYzE1X2JhY29fY21kX2VudHJ5ICplbnRyeSwKIAkJCQkgY29uc3QgdTMyIGFycmF5
X3NpemUpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9j
b21tb25fYmFjby5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY29tbW9u
X2JhY28uaAppbmRleCA5NTI5NmM5MTZmNGUuLjgzOTNlYjYyNzA2ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY29tbW9uX2JhY28uaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jb21tb25fYmFjby5oCkBAIC0zMyw2ICsz
MywxNSBAQCBlbnVtIGJhY29fY21kX3R5cGUgewogCUNNRF9ERUxBWV9VUywKIH07CiAKK3N0cnVj
dCBiYWNvX2NtZF9lbnRyeSB7CisJZW51bSBiYWNvX2NtZF90eXBlIGNtZDsKKwl1aW50MzJfdCAJ
cmVnX29mZnNldDsKKwl1aW50MzJfdCAgICAgCW1hc2s7CisJdWludDMyX3QgICAgIAlzaGlmdDsK
Kwl1aW50MzJfdCAgICAgCXRpbWVvdXQ7CisJdWludDMyX3QgICAgIAl2YWw7Cit9OworCiBzdHJ1
Y3Qgc29jMTVfYmFjb19jbWRfZW50cnkgewogCWVudW0gYmFjb19jbWRfdHlwZSBjbWQ7CiAJdWlu
dDMyX3QgCWh3aXA7CkBAIC00NCw2ICs1MywxMCBAQCBzdHJ1Y3Qgc29jMTVfYmFjb19jbWRfZW50
cnkgewogCXVpbnQzMl90ICAgICAJdGltZW91dDsKIAl1aW50MzJfdCAgICAgCXZhbDsKIH07CisK
K2V4dGVybiBib29sIGJhY29fcHJvZ3JhbV9yZWdpc3RlcnMoc3RydWN0IHBwX2h3bWdyICpod21n
ciwKKwkJCQkgICBjb25zdCBzdHJ1Y3QgYmFjb19jbWRfZW50cnkgKmVudHJ5LAorCQkJCSAgIGNv
bnN0IHUzMiBhcnJheV9zaXplKTsKIGV4dGVybiBib29sIHNvYzE1X2JhY29fcHJvZ3JhbV9yZWdp
c3RlcnMoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJCQkJY29uc3Qgc3RydWN0IHNvYzE1X2Jh
Y29fY21kX2VudHJ5ICplbnRyeSwKIAkJCQkJY29uc3QgdTMyIGFycmF5X3NpemUpOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
