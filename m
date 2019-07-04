Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF345F1A1
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 04:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254F6E235;
	Thu,  4 Jul 2019 02:58:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A86E235
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 02:58:33 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r21so4248992qke.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 19:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFzahrOqQOS/J479FWOpVCwY2F5C8r+jY6YwGTcp4A8=;
 b=ad7gz4IENtlQRYZczNZ8Sg2i8zzsOX+U0mxKoY8Mw2ZkGdkGYzD5ndSCpvsui5rBZ3
 4nLEhsny9ZNmmnj9IdCuv0QZBeX9tgyNDa4/96RGdU0fQ5uH/00rAeYxJJOr6SH9XjFk
 aXBPgjhHMVcUhWPwee31UTNE7kuJ3iEYsEETpr5JfRQWrlvUiHlTXrKrpsYSFz+AIYVo
 nagqz/a0+bh0pc5aP2WpC7M3/zKhxAbhL8E0F5a6lNZyHc3481T2RcIW0xBdVFAJ9Mqm
 zw7z8oljCYOmQJ1bNqGvw79ilgprpdPFTdWZVN6R+V8DbgG+Ab4Db5sveZ3m3uGGT2IH
 +ocA==
X-Gm-Message-State: APjAAAXRi17lJjAC7Rp5Lxip0yGiyJcSOvrb2VtvxlR41psOs3p5U7cb
 qRaVEXRv4H3NFS/WNcx7Em9O0//2uCE=
X-Google-Smtp-Source: APXvYqzkafCcWEe0lJJrXmPSJedRHWiL/E5r+4vzfnbH9Yi3z6vNxM6rW/kUnlBci+8Sr55L5uKV3A==
X-Received: by 2002:a37:be86:: with SMTP id o128mr1805271qkf.40.1562209112176; 
 Wed, 03 Jul 2019 19:58:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id p21sm1659133qtq.17.2019.07.03.19.58.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 19:58:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support for navi10
Date: Wed,  3 Jul 2019 21:58:22 -0500
Message-Id: <20190704025822.18970-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190704025822.18970-1-alexander.deucher@amd.com>
References: <20190704025822.18970-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFzahrOqQOS/J479FWOpVCwY2F5C8r+jY6YwGTcp4A8=;
 b=USxsk0hUnPdGfof/qci10ILo+A+wB3oQFf0Rq55acUdCo77jFxCi+TZQQo+ymxWfnw
 GdSk64+PaOmznI3qei2AnJwS4jz8FcI4mt2Fb63gQo79wnqrIkhTxDF22W3rZZdzcnf2
 7Geyhr0Ja0N9KzpcynxvuSQamj17FMSH4jVGjZ481FC5Pmznhbd3r0MOooW5nLRa361E
 1JZQMKX3SQpPK/F3BurAFES/n4wWxtGeoghCUVVMSrKbu05vnLzMNfA1JoqPdH2KTGVG
 rsJO5cbn5qpLfcegxjuXzIgxxSOtZLFpU2vuNH08YHdXmCyeeRE6pDNxTOGgxxwTXuBc
 7lXQ==
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

VGhpcyB3YXMgZHJvcHBlZCB3aGVuIHRoZSBjb2RlIHdhcyByZWZhY3RvcmVkLiAgUmUtYWRkIGl0
CmZvciBuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5k
ZXggNTc5NGY3Y2VmMWM4Li4zNGZiYzRiZTIyNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTkwMCw2ICs5MDAsNDIgQEAgc3RhdGljIGludCBuYXZp
MTBfZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBuYXZpMTBfdGhlcm1hbF9nZXRfdGVtcGVyYXR1
cmUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJCSAgZW51bSBhbWRfcHBfc2Vuc29ycyBz
ZW5zb3IsCisJCQkJCSAgdWludDMyX3QgKnZhbHVlKQoreworCWludCByZXQgPSAwOworCVNtdU1l
dHJpY3NfdCBtZXRyaWNzOworCisJaWYgKCF2YWx1ZSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwly
ZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCAodm9pZCAq
KSZtZXRyaWNzLAorCQkJICAgICAgIGZhbHNlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0Owor
CisJc3dpdGNoIChzZW5zb3IpIHsKKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfSE9UU1BPVF9URU1Q
OgorCQkqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlSG90c3BvdCAqCisJCQlTTVVfVEVNUEVS
QVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOworCQlicmVhazsKKwljYXNlIEFNREdQVV9QUF9T
RU5TT1JfRURHRV9URU1QOgorCQkqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlRWRnZSAqCisJ
CQlTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOworCQlicmVhazsKKwljYXNl
IEFNREdQVV9QUF9TRU5TT1JfTUVNX1RFTVA6CisJCSp2YWx1ZSA9IG1ldHJpY3MuVGVtcGVyYXR1
cmVNZW0gKgorCQkJU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKKwkJYnJl
YWs7CisJZGVmYXVsdDoKKwkJcHJfZXJyKCJJbnZhbGlkIHNlbnNvciBmb3IgcmV0cmlldmluZyB0
ZW1wXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJuIDA7Cit9CisKIHN0YXRp
YyBib29sIG5hdmkxMF9pc19kcG1fcnVubmluZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsK
IAlpbnQgcmV0ID0gMDsKQEAgLTEyODAsNiArMTMxNiwxMiBAQCBzdGF0aWMgaW50IG5hdmkxMF9y
ZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJcmV0ID0gbmF2aTEwX2dldF9n
cHVfcG93ZXIoc211LCAodWludDMyX3QgKilkYXRhKTsKIAkJKnNpemUgPSA0OwogCQlicmVhazsK
KwljYXNlIEFNREdQVV9QUF9TRU5TT1JfSE9UU1BPVF9URU1QOgorCWNhc2UgQU1ER1BVX1BQX1NF
TlNPUl9FREdFX1RFTVA6CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX01FTV9URU1QOgorCQlyZXQg
PSBuYXZpMTBfdGhlcm1hbF9nZXRfdGVtcGVyYXR1cmUoc211LCBzZW5zb3IsICh1aW50MzJfdCAq
KWRhdGEpOworCQkqc2l6ZSA9IDQ7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAtRUlO
VkFMOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
