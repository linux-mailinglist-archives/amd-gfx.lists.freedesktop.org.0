Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D31B48F5E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3689BFE;
	Mon, 17 Jun 2019 19:32:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEA289C51
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:00 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p144so6927663qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMckAlguBt4i7jj09KkQNx+XFwXB2gBmX7YQR991R4I=;
 b=lgKkT+DZ2MfuNbAOBmSUKFjlt1ETZ7zU78D112wqwkSyk7TQKRhkMJr5/4OHslShUm
 lZi5NShjmLXeSBdHl5+gIwNf+pmACKg0Vy73pfO1BvsWKQY52y5aHOp9rBh14rNlESWv
 nxIC5Fxkd2tnH3RqETusalbxQl0y0I4dbsonHpTlNLgmduQ8GBMTZXxtu3zO21DU7UMF
 IEarXS5Zz9fITkbZhxS8C8np2bXZ+z+N9JicOuikMR24Jc5CkQaMsHdRzyUE4QMjIzxA
 pSMgXYJYFG8Sflx9RsdcYA7gh9qtlMUIRrBjZU0bIwjE2E8Mee3aGHtGImK1pkd7wPwA
 Srqw==
X-Gm-Message-State: APjAAAUVMrGPksbbcxSYcZgqPIg4fftTC6FPU0hghwy/GQhZ2pQrO/nZ
 pCJCl2p0HKzw626OEOxPz+82kmWD76w=
X-Google-Smtp-Source: APXvYqxvB86HLcIUGA43Yj6FNj6KIlAtfaIaaF31uq7G5XHWYWVLgM0fQU2oUJv68PHh41nokD+r4A==
X-Received: by 2002:a37:b87:: with SMTP id 129mr71704609qkl.132.1560799919363; 
 Mon, 17 Jun 2019 12:31:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 250/459] drm/amd/powerplay: add function
 get_profiling_clk_mask for navi10
Date: Mon, 17 Jun 2019 14:30:17 -0500
Message-Id: <20190617193106.18231-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMckAlguBt4i7jj09KkQNx+XFwXB2gBmX7YQR991R4I=;
 b=uIHVlS82/Smea5BA8PTX9XjEVg2clBb113P/N5d43KZmjuVSlo8oAuQLQV7GD8mZt7
 Cj03RiKwbGtOFIJV9HQw/mzLVOEPZbwSho3ILDcMbhueQZgZSZB1+ThaZuc/PC7Kf7r/
 N+hiX5Rm6kokmTYmgkFSCMPVtwP2HCmtNN4cLm23YOhf3Ft+PFtEFwooWuGVc3i3ieW8
 yiY76sYBvU08Twf79dm/RtfhfWpM14nRmR8Xtw+E/awij9uVCN41BCWbqObJraeizJ1l
 +r5qFs5UHIV+X/iHIq9PkoFEOKXqqCDa6QJYx1+b0lt9uRBf+pPACNQ81+HgaxSC4FPN
 1lIA==
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
dGlvbiBnZXRfcHJvZmlsaW5nX2Nsa19tYXNrIGZvciBuYXZpMTAgYXNpYwoKU2lnbmVkLW9mZi1i
eTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYwppbmRleCA1NWQ2N2NkOTIyZjMuLjFkNDJkNjg2NmZjOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMTAzMCw2ICsxMDMwLDQ3IEBAIHN0YXRp
YyBpbnQgbmF2aTEwX3NldF9wb3dlcl9wcm9maWxlX21vZGUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIGxvbmcgKmlucHV0LCB1CiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBuYXZpMTBf
Z2V0X3Byb2ZpbGluZ19jbGtfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkJIGVu
dW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgbGV2ZWwsCisJCQkJCSB1aW50MzJfdCAqc2Nsa19tYXNr
LAorCQkJCQkgdWludDMyX3QgKm1jbGtfbWFzaywKKwkJCQkJIHVpbnQzMl90ICpzb2NfbWFzaykK
K3sKKwlpbnQgcmV0ID0gMDsKKwl1aW50MzJfdCBsZXZlbF9jb3VudCA9IDA7CisKKwlpZiAobGV2
ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fU0NMSykgeworCQlpZiAoc2Ns
a19tYXNrKQorCQkJKnNjbGtfbWFzayA9IDA7CisJfSBlbHNlIGlmIChsZXZlbCA9PSBBTURfRFBN
X0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9NQ0xLKSB7CisJCWlmIChtY2xrX21hc2spCisJCQkq
bWNsa19tYXNrID0gMDsKKwl9IGVsc2UgaWYgKGxldmVsID09IEFNRF9EUE1fRk9SQ0VEX0xFVkVM
X1BST0ZJTEVfUEVBSykgeworCQlpZihzY2xrX21hc2spIHsKKwkJCXJldCA9IHNtdV9nZXRfZHBt
X2xldmVsX2NvdW50KHNtdSwgU01VX1NDTEssICZsZXZlbF9jb3VudCk7CisJCQlpZiAocmV0KQor
CQkJCXJldHVybiByZXQ7CisJCQkqc2Nsa19tYXNrID0gbGV2ZWxfY291bnQgLSAxOworCQl9CisK
KwkJaWYobWNsa19tYXNrKSB7CisJCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzbXUs
IFNNVV9NQ0xLLCAmbGV2ZWxfY291bnQpOworCQkJaWYgKHJldCkKKwkJCQlyZXR1cm4gcmV0Owor
CQkJKnNjbGtfbWFzayA9IGxldmVsX2NvdW50IC0gMTsKKwkJfQorCisJCWlmKHNvY19tYXNrKSB7
CisJCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzbXUsIFNNVV9TT0NDTEssICZsZXZl
bF9jb3VudCk7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiByZXQ7CisJCQkqc2Nsa19tYXNrID0g
bGV2ZWxfY291bnQgLSAxOworCQl9CisJfQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNv
bnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxlc19p
bml0ID0gbmF2aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9h
bGxvY2F0ZV9kcG1fY29udGV4dCwKQEAgLTEwNjEsNiArMTEwMiw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5nZXRfZmFuX3NwZWVk
X3BlcmNlbnQgPSBuYXZpMTBfZ2V0X2Zhbl9zcGVlZF9wZXJjZW50LAogCS5nZXRfcG93ZXJfcHJv
ZmlsZV9tb2RlID0gbmF2aTEwX2dldF9wb3dlcl9wcm9maWxlX21vZGUsCiAJLnNldF9wb3dlcl9w
cm9maWxlX21vZGUgPSBuYXZpMTBfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKKwkuZ2V0X3Byb2Zp
bGluZ19jbGtfbWFzayA9IG5hdmkxMF9nZXRfcHJvZmlsaW5nX2Nsa19tYXNrLAogfTsKIAogdm9p
ZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
