Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A548F51
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D981589C0A;
	Mon, 17 Jun 2019 19:31:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F6F89BFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s15so12212767qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPWUfhlq16ltI3DhWurA5gFczPIMg9tpuBGeJkh9ErA=;
 b=ue29ntSIkP9Y2J/2ir+Bbwxl+ZIFjw/HCRVzpdt4H3QQOPPvBOsWbfInY/+rIGxfgs
 RMUvRmrnxBXYi+Y445zuO1DY/IcHnp9U8CgFuYMFEFVB31jIaPdYHSlavlzIm8E8pcjG
 TSQWjVTG5Dp7YE3RV080FcVb3B6Cc7Y440Bd03R9tpYERmdrTqIFx2QKtR/WaH1+4tX8
 VcCSw3VmwgI1/YOU7p59wby86cS8JV1ro7TzuJaaH/xZPQiF7qHs3wEdIbMaWFYlOQla
 E2YPsZhee3b7KVS+thvav9YM4CAFBxbuBz5OB/nc9rUzIOQRDFD7PyHUrS6dvW5OsLE9
 basQ==
X-Gm-Message-State: APjAAAVn8hCMUUIGHMHtTFpAA2DS5skcQipCwGqR2EEb6eWc/FIEb77v
 mZomO8XHH4gUU8IZu3dtlmEvnyjSyFo=
X-Google-Smtp-Source: APXvYqw8inp9tHyVIkPad7b3M8jhHptlG+sfdwwCTry+P6zCP549y6EVoTnUWCP615XS1AUWRTq+rw==
X-Received: by 2002:a0c:afac:: with SMTP id s41mr23424065qvc.184.1560799898273; 
 Mon, 17 Jun 2019 12:31:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 228/459] drm/amd/powerplay: add helper function to get dpm
 freq informations
Date: Mon, 17 Jun 2019 14:29:55 -0500
Message-Id: <20190617193106.18231-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPWUfhlq16ltI3DhWurA5gFczPIMg9tpuBGeJkh9ErA=;
 b=rr8tNmekLcSD92SyUa/RQWMREOsOh5cn0lFSAnzAn32fAKQ+MnKH3bbEqkCBf9Zver
 3vvCxtAaO+7NdeSdJ/HfGaxheiZV2OpEcraZFdxsqZfRGyLn0zsg2Mt3eHCdl3UPwLUo
 ksgC3OxTaL5AyobFUford0NPipLHBOvE0D2+xVLbBoLTN657LMIbGZ/w0qQfu4q48i2d
 5Hk+NYzV9T1qRiZI+0U1iGpsZcubKzK9G5cs3p7HxIlAxj0JYIwNfriqua0q0yoqcb7a
 UtLasvSfNYsmH/rUfAJXlJBYjpF8TD/mcpC969JdwpPEVlTkt/TTzIDugWEoVMl9J5Oh
 2cPg==
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

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoaXMgZnVuY3Rpb24gY2Fu
IGhlbHAgZHJpdmVyIHRvIGdldCBwcGNsayBpbmZvcm1hdGlvbnMKClNpZ25lZC1vZmYtYnk6IEtl
dmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDQgKysKIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpp
bmRleCAyMWE0N2QwOGQ3MDMuLmQ1NjVkYjRjZTZkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNjAsNiArNjAsNDMgQEAgaW50IHNtdV9nZXRfc21j
X3ZlcnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICppZl92ZXJzaW9uLCB1
aW50MzJfdAogCXJldHVybiByZXQ7CiB9CiAKK2ludCBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKKwkJ
CSAgICAgIHVpbnQxNl90IGxldmVsLCB1aW50MzJfdCAqdmFsdWUpCit7CisJaW50IHJldCA9IDAs
IGNsa19pZCA9IDA7CisJdWludDMyX3QgcGFyYW07CisKKwlpZiAoIXZhbHVlKQorCQlyZXR1cm4g
LUVJTlZBTDsKKworCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwor
CWlmIChjbGtfaWQgPCAwKQorCQlyZXR1cm4gY2xrX2lkOworCisJcGFyYW0gPSAodWludDMyX3Qp
KCgoY2xrX2lkICYgMHhmZmZmKSA8PCAxNikgfCAobGV2ZWwgJiAweGZmZmYpKTsKKworCXJldCA9
IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsU01VX01TR19HZXREcG1GcmVxQnlJbmRl
eCwKKwkJCQkJICBwYXJhbSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldCA9IHNt
dV9yZWFkX3NtY19hcmcoc211LCAmcGFyYW0pOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisK
KwkvKiBCSVQzMTogIDAgLSBGaW5lIGdyYWluZWQgRFBNLCAxIC0gRGljcmV0ZSBEUE0KKwkgKiBu
b3csIHdlIHVuLXN1cHBvcnQgaXQgKi8KKwkqdmFsdWUgPSBwYXJhbSAmIDB4N2ZmZmZmZmY7CisK
KwlyZXR1cm4gcmV0OworfQorCitpbnQgc211X2dldF9kcG1fbGV2ZWxfY291bnQoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAorCQkJICAgIHVpbnQz
Ml90ICp2YWx1ZSkKK3sKKwlyZXR1cm4gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNs
a190eXBlLCAweGZmLCB2YWx1ZSk7Cit9CisKIGludCBzbXVfZHBtX3NldF9wb3dlcl9nYXRlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBibG9ja190eXBlLAogCQkJICAgYm9vbCBn
YXRlKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2Ft
ZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmgKaW5kZXggNGZjMTgzYmQwODg2Li4xMmFiMWVlNTM1ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtOTI4LDQgKzkyOCw4IEBAIGV4
dGVybiBpbnQgc211X2hhbmRsZV90YXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJICAg
ZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCwKIAkJCSAgIGVudW0gYW1kX3BwX3Rhc2sg
dGFza19pZCk7CiBpbnQgc211X2dldF9zbWNfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgdWludDMyX3QgKmlmX3ZlcnNpb24sIHVpbnQzMl90ICpzbXVfdmVyc2lvbik7CitpbnQgc211
X2dldF9kcG1fZnJlcV9ieV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVf
Y2xrX3R5cGUgY2xrX3R5cGUsCisJCQkgICAgICB1aW50MTZfdCBsZXZlbCwgdWludDMyX3QgKnZh
bHVlKTsKK2ludCBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCisJCQkgICAgdWludDMyX3QgKnZhbHVlKTsK
ICNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
