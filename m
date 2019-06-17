Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2148F5A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB7F89C27;
	Mon, 17 Jun 2019 19:31:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945A289C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x2so12275408qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+p6voJTlEXomKj2hlUMaV0u53kIElbFcDGrtBg80P2s=;
 b=mB6rG46Qdi4X/ZDhr3j9F3V7IFU3biAJzaEvMpapJ9igyYOOFZDzVl5GI+qx3vMzOv
 bJpNUJ3vc/oe9nDirVXXdqEMDLBszBHcA7z8vsYPOi+NOcwb80JvA+DBYiW64W3qkoBp
 4M8irPaqjIUX10HS61ZG/MWKOkGCnkNc5oFDm0esONjFSy84lDHr3VX07MvP3ETlxS5W
 Rig2bnoe5grb5mwlrr2m9K6E2wBRH3wVlzrBzWRK/L1hEquweKdzc5Ic7pYZxH+p/Boe
 s5rIH13G1VF9QzHPnuM8EUSV06gxNhl7N479mxP16ncNjNPnP+hd3SPR2kwQ8Z/MJy+j
 nIpA==
X-Gm-Message-State: APjAAAWSOAcgVpJu+Jmc7+PpH2yHxX/uamKqEoooX815f/FO6sErAjgT
 5VoR70dVLmkkc2qZeeaKm5+J1dItYas=
X-Google-Smtp-Source: APXvYqx/WcVR6A0jMbW3nQhEPXza7Vx0WqAWdw6Xly8OUOP2ytzxgpvsotLH5g8A68SkgOa6ecMZLg==
X-Received: by 2002:aed:2fa7:: with SMTP id m36mr69737109qtd.344.1560799906049; 
 Mon, 17 Jun 2019 12:31:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 236/459] drm/amd/powerplay: add function
 pre_display_config_changed for navi10
Date: Mon, 17 Jun 2019 14:30:03 -0500
Message-Id: <20190617193106.18231-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+p6voJTlEXomKj2hlUMaV0u53kIElbFcDGrtBg80P2s=;
 b=Z6xVrZB5qeaRVCusvKZ6GAADBQsSCX05S8Z1WUTce7qu1xqHy2KCqOzOlbxltXX+X2
 u7NOeBhNKQSpK+A9hEWp072IscfblvdHxEOuCytpRMd30u6Agl+fP4XLOHsSnThIiEsj
 z/k32nNGhAHvBvim8JM1m6lmADDa5RuweYTPBOQTDYwJGzmaoETZr4SYyL9sHj9J21qB
 /mfpLppUgM3mlWy02V4iIm7G4JJuMUMF5pMyLf2LD6h+A9Phzj5IrrLqZmM7NM8j4BZw
 zDKkL/5DlEWaWpFVcoqpPPdmwVmbcyahfxF36cNDbFTbtxV7TNyYmgu25/WbHXOE+m6d
 qrYQ==
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

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBwcmVfZGlzcGxheV9jb25maWdfY2hhbmdlZCBmb3IgbmF2aTEwIGFzaWMKClNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFu
ZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKaW5kZXggMjE0Y2VlY2U0MjhkLi41NjlmNzg4Y2UyZjYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTY1MCw2ICs2NTAsMjcgQEAgc3Rh
dGljIGludCBuYXZpMTBfZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5KHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX3ByZV9k
aXNwbGF5X2NvbmZpZ19jaGFuZ2VkKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQoreworCWludCBy
ZXQgPSAwOworCXVpbnQzMl90IG1heF9mcmVxID0gMDsKKworCXJldCA9IHNtdV9zZW5kX3NtY19t
c2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfTnVtT2ZEaXNwbGF5cywgMCk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIHJldDsKKworCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZF
QVRVUkVfRFBNX1VDTEtfQklUKSkgeworCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNt
dSwgU01VX1VDTEssIE5VTEwsICZtYXhfZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0
OworCQlyZXQgPSBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzbXUsIFNNVV9VQ0xLLCAwLCBtYXhf
ZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiByZXQ7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0g
ewogCS50YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRl
eHQgPSBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQsCkBAIC02NjksNiArNjkwLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLmZv
cmNlX2Nsa19sZXZlbHMgPSBuYXZpMTBfZm9yY2VfY2xrX2xldmVscywKIAkucG9wdWxhdGVfdW1k
X3N0YXRlX2NsayA9IG5hdmkxMF9wb3B1bGF0ZV91bWRfc3RhdGVfY2xrLAogCS5nZXRfY2xvY2tf
YnlfdHlwZV93aXRoX2xhdGVuY3kgPSBuYXZpMTBfZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRl
bmN5LAorCS5wcmVfZGlzcGxheV9jb25maWdfY2hhbmdlZCA9IG5hdmkxMF9wcmVfZGlzcGxheV9j
b25maWdfY2hhbmdlZCwKIH07CiAKIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
