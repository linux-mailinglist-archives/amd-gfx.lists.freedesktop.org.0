Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2448F54
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9989C17;
	Mon, 17 Jun 2019 19:31:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279089BFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:42 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id x2so12275025qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kl47SLmXTrVqBNqxf+dg9aFa9ueZ7USv4CX814nNyKA=;
 b=fAFGcsYQxwqc6Jc7WAilfFV7aq3L5yrYmAEidWTLkinSzDf/7Qc+H1dyxIMv0tM7Yn
 QQ1ev+45bjtnOha5PN7XY1rynnMKw9IStR6UzD9Mx3FEKMANFIOmLWuT5Rn/RArFhthn
 i/aqbhCH2cEXTHPoMLaP2/PVe4DB4wQ2XH1fVdCixSnDFGv7YW3diHkDWtwh6SP5j9Vd
 lv4fID9W1yIGFMidZH6LwBY5lidA3vpn25aLC6LqdKIkX+kB23b6lzkiSApAxc66sdQU
 qRkTeU2BgmQAm82Q9nmdYzqIDnwm2dzPyRGrGPJMxQcb7My/Z98QJlQaCtv+JCQ10nKl
 K0/A==
X-Gm-Message-State: APjAAAWzGfWnPrQS1k72nXxV0I0jlfO7/bEobDpky4Sptq7tJRH4K8tQ
 cYsHcOUcsnty5CXJjZDdfPZ78oOgLhs=
X-Google-Smtp-Source: APXvYqxYZJpCmLV2hErdyXsaLPBZCQyCI+4h9fXTGaBWrZ6aL+AVETLJtLgZMS82V+IyCEWZYhnIMg==
X-Received: by 2002:a0c:aed0:: with SMTP id n16mr23487868qvd.101.1560799900798; 
 Mon, 17 Jun 2019 12:31:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 231/459] drm/amd/powerplay: add helper function of
 smu_set_soft_freq_range
Date: Mon, 17 Jun 2019 14:29:58 -0500
Message-Id: <20190617193106.18231-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kl47SLmXTrVqBNqxf+dg9aFa9ueZ7USv4CX814nNyKA=;
 b=HEcagQH5rz9bXr+RQzdCM91zfuEkf0d37ocHz1HHL3SVvXAx0dIWvAO8YxK5PAHlcs
 8Lj7MVG7FX3D4gq5UNZjWC9F78TU4C/YIbQeICe80yBst3Urd/z9yTaT1MlesDjjLQbe
 8ePGBFRdO/aJDDuS9YYrrQZTk3twtnj0AmrfUfjRS7PNCbDh981Ig28IRPhgsWGokXSS
 wucZVLhQ8u2oAhdofZWVf3+LeYpLDsrksu5bRoojozhezYOHkvqDcaeRozoZUyjWZ+1L
 5ZYk9nCkBrlTQHcFPPg/BW3bD9L34AcfFtLeNX4+bdlDmd9QpfcVtIv9fMYAXJWwk9DK
 MpuA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCB0aGlzIGhlbHBlciBm
dW5jdGlvbiB0byBnZXQgZHBtIGNsayBpbmZvcm1hdGlvbi4KClNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRl
eCBjMzdmNTliMzk5NWIuLjU0MDRmMzJjYzJjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNjAsNiArNjAsMzkgQEAgaW50IHNtdV9nZXRfc21jX3Zl
cnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICppZl92ZXJzaW9uLCB1aW50
MzJfdAogCXJldHVybiByZXQ7CiB9CiAKK2ludCBzbXVfc2V0X3NvZnRfZnJlcV9yYW5nZShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCisJCQkgICAg
dWludDMyX3QgbWluLCB1aW50MzJfdCBtYXgpCit7CisJaW50IHJldCA9IDAsIGNsa19pZCA9IDA7
CisJdWludDMyX3QgcGFyYW07CisKKwlpZiAobWluIDw9IDAgJiYgbWF4IDw9IDApCisJCXJldHVy
biAtRUlOVkFMOworCisJY2xrX2lkID0gc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7
CisJaWYgKGNsa19pZCA8IDApCisJCXJldHVybiBjbGtfaWQ7CisKKwlpZiAobWF4ID4gMCkgewor
CQlwYXJhbSA9ICh1aW50MzJfdCkoKGNsa19pZCA8PCAxNikgfCAobWF4ICYgMHhmZmZmKSk7CisJ
CXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0U29mdE1h
eEJ5RnJlcSwKKwkJCQkJCSAgcGFyYW0pOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9
CisKKwlpZiAobWluID4gMCkgeworCQlwYXJhbSA9ICh1aW50MzJfdCkoKGNsa19pZCA8PCAxNikg
fCAobWluICYgMHhmZmZmKSk7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShz
bXUsIFNNVV9NU0dfU2V0U29mdE1pbkJ5RnJlcSwKKwkJCQkJCSAgcGFyYW0pOworCQlpZiAocmV0
KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKworCXJldHVybiByZXQ7Cit9CisKIGludCBzbXVfZ2V0
X2RwbV9mcmVxX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlw
ZSBjbGtfdHlwZSwKIAkJCSAgIHVpbnQzMl90ICptaW4sIHVpbnQzMl90ICptYXgpCiB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCA3ODk5
M2U0ZWU1ODguLjQxNmVhN2I4NTc2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC05NDEsNCArOTQxLDYgQEAgaW50IHNtdV9nZXRfZHBt
X2xldmVsX2NvdW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBj
bGtfdHlwZSwKIAkJCSAgICB1aW50MzJfdCAqdmFsdWUpOwogaW50IHNtdV9nZXRfZHBtX2ZyZXFf
cmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBl
LAogCQkJICAgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCk7CitpbnQgc211X3NldF9zb2Z0
X2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNs
a190eXBlLAorCQkJICAgIHVpbnQzMl90IG1pbiwgdWludDMyX3QgbWF4KTsKICNlbmRpZgotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
