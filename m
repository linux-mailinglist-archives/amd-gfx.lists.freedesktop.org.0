Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27EB75D54
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AABE6E869;
	Fri, 26 Jul 2019 03:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8884F6E867
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:05 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a27so38112494qkk.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5df2jImouxMeWAVNfZBRiVQuLtUzO2Y4+8JxAylMN4=;
 b=SsjJjLAaJD2EGIpWcTOUIAZJWrRVwpvXFwDdalVqEMMLhdjcx8PwWX7P1azEfrPq7N
 X1xlS4QE1p9WLG8hWBXXc86Zch9iM6nerQ3CdXWGmHhEIAGfeMAm6EQh0svgIKT9m7jZ
 Rbvqq23WnAQNKwyFTSOe4TG/fmTAwnzIoqi/ZNH2Q3vXmyuGpr1rhqLMmNW0dx+WIodw
 +9CMEUcaBXNCvzpy1DQWAVORctUkPaTjly8RD0C3hjFnSeeVvihhkGGdJvhKR+fsA6/5
 fQXS3GPbOXm38+393txdsah9JRdDp3M9oHTyl5h7lG0Xfvq0MdCW9RGRvwbXSnbfNzbp
 7CrA==
X-Gm-Message-State: APjAAAXFfkVCy9sFsg/BOcNmIqSnnLSEE+3BCGcXItH5kj9VEl0m+fmA
 1a8nICd5YPgu80SSKm4Jq219L8rN
X-Google-Smtp-Source: APXvYqwfuEMCzir26BsMldExqcEAs6C9ww+V1dyeoywF5bg3YOTjQCf7C1rD2Uwz0hLEqfuj/zOyBg==
X-Received: by 2002:a37:4d82:: with SMTP id a124mr59173038qkb.72.1564111324367; 
 Thu, 25 Jul 2019 20:22:04 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/11] drm/amdgpu/powerplay: add a new interface to set the
 mp1 state
Date: Thu, 25 Jul 2019 22:21:42 -0500
Message-Id: <20190726032146.3187-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5df2jImouxMeWAVNfZBRiVQuLtUzO2Y4+8JxAylMN4=;
 b=QGg+BuaPeSxPZs7VhGP+5D/JkreqcaqKuwW/5ETF7ncKcdT/8+GONxFL9ruZNLd4xH
 PoHOTaAV0sKMFDRhlciCT1KgbwvoJqX3UuQljdbtgBNmWYa/dfF8y59li+UwO8oZijRn
 3LUd42ftfpjw1YTiLSsbFgFTHf5pHn9APXCDdsC8yFRd9oY/ZdVOtnzszGJEPzHfHigs
 9YvvzIaR/KObHIrfK38tqRYUKbGMKtAchPImQFttreAnjjVAToJ18gGe37oN0A/bKqZ2
 V6aO0XZOpYHg288JVnOrsk9QcCWQhekG1Lwob/Bo5I6fZFUPiz0h1yK1tFGLTlGXTy1A
 6TrA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyByZXF1aXJlZCBmb3IgY2VydGFpbiBjYXNlcyBzdWNoIGFzIHZhcmlvdXMgR1BVIHJl
c2V0cwoobW9kZTEsIG1vZGUyKSwgQkFDTywgc2h1dGRvd24sIHVubG9hZCwgZXRjLiB0byBwdXQg
dGhlIFNNVSBpbnRvCnRoZSBhcHByb3ByaWF0ZSBzdGF0ZSBmb3Igd2hlbiB0aGUgaHcgaXMgcmUt
aW5pdGlhbGl6ZWQuCgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmggfCAgOCAr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jICB8
IDE2ICsrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9o
d21nci5oICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaAppbmRleCA5
NzMzYmJmOWJjNzIuLjk1ZWRjM2QzYTljNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCkBAIC0xNzEsNiArMTcxLDEzIEBAIGVudW0gUFBfSFdN
T05fVEVNUCB7CiAJUFBfVEVNUF9NQVgKIH07CiAKK2VudW0gcHBfbXAxX3N0YXRlIHsKKwlQUF9N
UDFfU1RBVEVfTk9ORSwKKwlQUF9NUDFfU1RBVEVfU0hVVERPV04sCisJUFBfTVAxX1NUQVRFX1VO
TE9BRCwKKwlQUF9NUDFfU1RBVEVfUkVTRVQsCit9OworCiAjZGVmaW5lIFBQX0dST1VQX01BU0sg
ICAgICAgIDB4RjAwMDAwMDAKICNkZWZpbmUgUFBfR1JPVVBfU0hJRlQgICAgICAgMjgKIApAQCAt
MjY2LDYgKzI3Myw3IEBAIHN0cnVjdCBhbWRfcG1fZnVuY3MgewogCWludCAoKmdldF9wb3dlcl9w
cm9maWxlX21vZGUpKHZvaWQgKmhhbmRsZSwgY2hhciAqYnVmKTsKIAlpbnQgKCpzZXRfcG93ZXJf
cHJvZmlsZV9tb2RlKSh2b2lkICpoYW5kbGUsIGxvbmcgKmlucHV0LCB1aW50MzJfdCBzaXplKTsK
IAlpbnQgKCpvZG5fZWRpdF9kcG1fdGFibGUpKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgdHlwZSwg
bG9uZyAqaW5wdXQsIHVpbnQzMl90IHNpemUpOworCWludCAoKnNldF9tcDFfc3RhdGUpKHZvaWQg
KmhhbmRsZSwgZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKTsKIC8qIGV4cG9ydCB0byBEQyAq
LwogCXUzMiAoKmdldF9zY2xrKSh2b2lkICpoYW5kbGUsIGJvb2wgbG93KTsKIAl1MzIgKCpnZXRf
bWNsaykodm9pZCAqaGFuZGxlLCBib29sIGxvdyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRfcG93ZXJwbGF5LmMKaW5kZXggYmVhMTU4N2QzNTJkLi44OGEyZWY3NWI3ZTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMKQEAg
LTkyNCw2ICs5MjQsMjEgQEAgc3RhdGljIGludCBwcF9vZG5fZWRpdF9kcG1fdGFibGUodm9pZCAq
aGFuZGxlLCB1aW50MzJfdCB0eXBlLCBsb25nICppbnB1dCwgdWludDMKIAlyZXR1cm4gaHdtZ3It
Pmh3bWdyX2Z1bmMtPm9kbl9lZGl0X2RwbV90YWJsZShod21nciwgdHlwZSwgaW5wdXQsIHNpemUp
OwogfQogCitzdGF0aWMgaW50IHBwX2RwbV9zZXRfbXAxX3N0YXRlKHZvaWQgKmhhbmRsZSwgZW51
bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKQoreworCXN0cnVjdCBwcF9od21nciAqaHdtZ3IgPSBo
YW5kbGU7CisKKwlpZiAoIWh3bWdyIHx8ICFod21nci0+cG1fZW4pCisJCXJldHVybiAtRUlOVkFM
OworCisJaWYgKGh3bWdyLT5od21ncl9mdW5jLT5zZXRfbXAxX3N0YXRlID09IE5VTEwpIHsKKwkJ
cHJfaW5mb19yYXRlbGltaXRlZCgiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19f
KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5z
ZXRfbXAxX3N0YXRlKGh3bWdyLCBtcDFfc3RhdGUpOworfQorCiBzdGF0aWMgaW50IHBwX2RwbV9z
d2l0Y2hfcG93ZXJfcHJvZmlsZSh2b2lkICpoYW5kbGUsCiAJCWVudW0gUFBfU01DX1BPV0VSX1BS
T0ZJTEUgdHlwZSwgYm9vbCBlbikKIHsKQEAgLTE1MjUsNiArMTU0MCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzIHBwX2RwbV9mdW5jcyA9IHsKIAkuZ2V0X3Bvd2VyX3Byb2Zp
bGVfbW9kZSA9IHBwX2dldF9wb3dlcl9wcm9maWxlX21vZGUsCiAJLnNldF9wb3dlcl9wcm9maWxl
X21vZGUgPSBwcF9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlLAogCS5vZG5fZWRpdF9kcG1fdGFibGUg
PSBwcF9vZG5fZWRpdF9kcG1fdGFibGUsCisJLnNldF9tcDFfc3RhdGUgPSBwcF9kcG1fc2V0X21w
MV9zdGF0ZSwKIAkuc2V0X3Bvd2VyX2xpbWl0ID0gcHBfc2V0X3Bvd2VyX2xpbWl0LAogCS5nZXRf
cG93ZXJfbGltaXQgPSBwcF9nZXRfcG93ZXJfbGltaXQsCiAvKiBleHBvcnQgdG8gREMgKi8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmgKaW5kZXggYzU5ODljYjM4YjFi
Li4wN2ZkNjRhYWQyYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9od21nci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21n
ci5oCkBAIC0zNDQsNiArMzQ0LDcgQEAgc3RydWN0IHBwX2h3bWdyX2Z1bmMgewogCWludCAoKnNl
dF9hc2ljX2JhY29fc3RhdGUpKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGVudW0gQkFDT19TVEFU
RSBzdGF0ZSk7CiAJaW50ICgqZ2V0X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IsIGNoYXIgKmJ1Zik7CiAJaW50ICgqc2V0X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsIHVpbnQ2NF90IHBwZmVhdHVyZV9tYXNrcyk7CisJaW50ICgqc2V0X21w
MV9zdGF0ZSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0
YXRlKTsKIH07CiAKIHN0cnVjdCBwcF90YWJsZV9mdW5jIHsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
