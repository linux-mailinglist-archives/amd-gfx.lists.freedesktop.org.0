Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615D48FCF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEE789CB9;
	Mon, 17 Jun 2019 19:45:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C6F89C9D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12252672qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR3G7itcYLOEEL+m6JP0qSOza3/hcAygygS6ebzUc6I=;
 b=Dj+kiujrvaxvMdrIhsKHkkuRcJwrXPzLJ/aMG5KtgLTTlZT/hoMXCeFPMnxjVyvh+3
 2Q5VS6/ymwQaazeB/AW+fkCWQR/na4xBr7kVj1Hwmk1EaRdvOAMVBPmxfFxnbbksKrmv
 WwxZidGdLvfuWSjCLg8G+puBGrt83PMtv7XuJri5RmhBc+/5SVS7TcdalZteOP4d3kZv
 H/e3Ua/yk+MtPH341k8xYPQXXfl7OIMtKtj8Cp37vNWmtWIRcTa9vWyzKg9FA0UBgvAv
 GRqpqy9sjE5Ko7ge5FwNlXCWqFfnjCWV892MJRZnY5FCnO5hkbuKysFezNJXoZa9Hy9o
 aqIw==
X-Gm-Message-State: APjAAAUDEGrhX1RHTjwYjy4xBbKFqX2/pbd8iNXHtYLci54rZAcsW9nx
 pvajk5e7jQiQ5eFOJ9nSFnYdLCkaumc=
X-Google-Smtp-Source: APXvYqzCrQ4aXYcp+jUPxkjOBUovjThKJagGUhvinGta+zWCfBpdNiP56qYl+L8h5G3bPdrC4YtRLw==
X-Received: by 2002:ac8:2cd1:: with SMTP id 17mr93461573qtx.356.1560800752718; 
 Mon, 17 Jun 2019 12:45:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 302/459] drm/amdgpu/powerplay/vega20: use correct table index
Date: Mon, 17 Jun 2019 14:44:03 -0500
Message-Id: <20190617194540.18497-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR3G7itcYLOEEL+m6JP0qSOza3/hcAygygS6ebzUc6I=;
 b=lmPdYb6YYbtCPUHZXGxhwHYjLZuiAJH5KwQzEkawxaBTHb9phzO5OoSTMrcCtQeYMC
 BkJoqbzLyS4dIzGqi4UbsRL0X3hsN+47Tgw66LNxnQ/jxEcWDRerCR4iDfh9PeMFBX8f
 2Er7Q+XwtrBtsH/lAUC8MZU6VH8v5vmSkl7qZpgrcDZJbXZYptL+qWKX8e1HQ6e1e5ry
 eM5aKOUj16YPIODNiV/VQc9JTBwpZnrCpLR/czShDVnLtWQ38GlHf45y8jZEqb1Nki/R
 /TkOMXYq2Zqgwrrv0+M+3fcy5N5HAmZyB0Scuv19fyKM+5fp/y493ezvbkxQ7oc9TOO3
 2ymg==
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

VXNlIHRoZSBTTVVfKiB2YXJpYW50IHNvIHdlIGxvb2sgdXAgdGhlIGNvcnJlY3QgaW5kZXguCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggNTE0ZTQwOTc5
ZjE5Li5hZGY1MWY5ZTFlNzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMKQEAgLTE4MDIsNyArMTgwMiw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9wb3dl
cl9wcm9maWxlX21vZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1ZikKIAkJLyog
Y29udiBQUF9TTUNfUE9XRVJfUFJPRklMRSogdG8gV09SS0xPQURfUFBMSUJfKl9CSVQgKi8KIAkJ
d29ya2xvYWRfdHlwZSA9IHNtdV93b3JrbG9hZF9nZXRfdHlwZShzbXUsIGkpOwogCQlyZXN1bHQg
PSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwKLQkJCQkJICBUQUJMRV9BQ1RJVklUWV9NT05JVE9SX0NP
RUZGIHwgd29ya2xvYWRfdHlwZSA8PCAxNiwKKwkJCQkJICBTTVVfVEFCTEVfQUNUSVZJVFlfTU9O
SVRPUl9DT0VGRiB8IHdvcmtsb2FkX3R5cGUgPDwgMTYsCiAJCQkJCSAgKHZvaWQgKikoJmFjdGl2
aXR5X21vbml0b3IpLCBmYWxzZSk7CiAJCWlmIChyZXN1bHQpIHsKIAkJCXByX2VycigiWyVzXSBG
YWlsZWQgdG8gZ2V0IGFjdGl2aXR5IG1vbml0b3IhIiwgX19mdW5jX18pOwpAQCAtMTg4OCw3ICsx
ODg4LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgbG9uZyAqaW5wdXQsIHUKIAogCWlmIChzbXUtPnBvd2VyX3Byb2Zp
bGVfbW9kZSA9PSBQUF9TTUNfUE9XRVJfUFJPRklMRV9DVVNUT00pIHsKIAkJcmV0ID0gc211X3Vw
ZGF0ZV90YWJsZShzbXUsCi0JCQkJICAgICAgIFRBQkxFX0FDVElWSVRZX01PTklUT1JfQ09FRkYg
fCBXT1JLTE9BRF9QUExJQl9DVVNUT01fQklUIDw8IDE2LAorCQkJCSAgICAgICBTTVVfVEFCTEVf
QUNUSVZJVFlfTU9OSVRPUl9DT0VGRiB8IFdPUktMT0FEX1BQTElCX0NVU1RPTV9CSVQgPDwgMTYs
CiAJCQkJICAgICAgICh2b2lkICopKCZhY3Rpdml0eV9tb25pdG9yKSwgZmFsc2UpOwogCQlpZiAo
cmV0KSB7CiAJCQlwcl9lcnIoIlslc10gRmFpbGVkIHRvIGdldCBhY3Rpdml0eSBtb25pdG9yISIs
IF9fZnVuY19fKTsKQEAgLTE5NDMsNyArMTk0Myw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3NldF9w
b3dlcl9wcm9maWxlX21vZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGxvbmcgKmlucHV0LCB1
CiAJCX0KIAogCQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwKLQkJCQkgICAgICAgVEFCTEVf
QUNUSVZJVFlfTU9OSVRPUl9DT0VGRiB8IFdPUktMT0FEX1BQTElCX0NVU1RPTV9CSVQgPDwgMTYs
CisJCQkJICAgICAgIFNNVV9UQUJMRV9BQ1RJVklUWV9NT05JVE9SX0NPRUZGIHwgV09SS0xPQURf
UFBMSUJfQ1VTVE9NX0JJVCA8PCAxNiwKIAkJCQkgICAgICAgKHZvaWQgKikoJmFjdGl2aXR5X21v
bml0b3IpLCB0cnVlKTsKIAkJaWYgKHJldCkgewogCQkJcHJfZXJyKCJbJXNdIEZhaWxlZCB0byBz
ZXQgYWN0aXZpdHkgbW9uaXRvciEiLCBfX2Z1bmNfXyk7CkBAIC0yNzY3LDcgKzI3NjcsNyBAQCBz
dGF0aWMgaW50IHZlZ2EyMF9vZG5fZWRpdF9kcG1fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsCiAJCWJyZWFrOwogCiAJY2FzZSBQUF9PRF9SRVNUT1JFX0RFRkFVTFRfVEFCTEU6Ci0JCXJl
dCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBUQUJMRV9PVkVSRFJJVkUsIHRhYmxlX2NvbnRleHQt
Pm92ZXJkcml2ZV90YWJsZSwgZmFsc2UpOworCQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwg
U01VX1RBQkxFX09WRVJEUklWRSwgdGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlLCBmYWxz
ZSk7CiAJCWlmIChyZXQpIHsKIAkJCXByX2VycigiRmFpbGVkIHRvIGV4cG9ydCBvdmVyIGRyaXZl
IHRhYmxlIVxuIik7CiAJCQlyZXR1cm4gcmV0OwpAQCAtMjc3Niw3ICsyNzc2LDcgQEAgc3RhdGlj
IGludCB2ZWdhMjBfb2RuX2VkaXRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAog
CQlicmVhazsKIAogCWNhc2UgUFBfT0RfQ09NTUlUX0RQTV9UQUJMRToKLQkJcmV0ID0gc211X3Vw
ZGF0ZV90YWJsZShzbXUsIFRBQkxFX09WRVJEUklWRSwgdGFibGVfY29udGV4dC0+b3ZlcmRyaXZl
X3RhYmxlLCB0cnVlKTsKKwkJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9P
VkVSRFJJVkUsIHRhYmxlX2NvbnRleHQtPm92ZXJkcml2ZV90YWJsZSwgdHJ1ZSk7CiAJCWlmIChy
ZXQpIHsKIAkJCXByX2VycigiRmFpbGVkIHRvIGltcG9ydCBvdmVyIGRyaXZlIHRhYmxlIVxuIik7
CiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
