Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48B48F69
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A6D89C3F;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7EE89C49
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:01 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x2so12276430qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MuaZS0yekPrSA4N/thHmWHztpa7aB1peoTiNoYiGMn4=;
 b=jxx5id5DEAiS17s6Beg54pmyK+CSjpEB0ehNKQz1g2FAKGqGmBlGfpyHeBr2TLv/fF
 3axXfJ/yi+ioglo6jldWvruWjZvKt2sktJowRz8k3Gfst/gh1idTy4Pmhx7XN6kqVMlX
 7G2jn5KwnfqQBa90oCe9l6X6997FWm7FxdWLtICz6cIt+Byhr86zJMaN07pi/JGIKSyp
 oqj5beb0jVC65wBRfbXDB/pBthSD9w+OGmyX52p+dGehvg6K6EwtDUqA9FuRchtY/FNv
 MKWBinGUtHHW8LksfBRGD/Us9sOwj2IkbesBoTDjU5FjihNeqddjOUoTk29IRYwcsqLM
 RM9Q==
X-Gm-Message-State: APjAAAWrN+sNevR3jBGf1rq9CPQxiDAzAfDs2q6GpYidlX7vq3I4J0BX
 RsSBo637eOW+kwCtoSFUggB0u1LrTUM=
X-Google-Smtp-Source: APXvYqwQ4ifq3xzB5DMge7knVgkuSN9NE/spa1NCKlX4/sYQgGzLj8dQWDkDP59DTl5AEQLoVgj+dQ==
X-Received: by 2002:ac8:290c:: with SMTP id y12mr7285472qty.141.1560799920140; 
 Mon, 17 Jun 2019 12:32:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 251/459] drm/amd/powerplay: add function
 notify_smc_display_config_change for navi10
Date: Mon, 17 Jun 2019 14:30:18 -0500
Message-Id: <20190617193106.18231-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MuaZS0yekPrSA4N/thHmWHztpa7aB1peoTiNoYiGMn4=;
 b=TvYUaqGqmEthcR14oAWiyPSrFgNKSeBh3j8Tq2J8p45ZAEf1ef/AsfmS5cjTN7E26n
 wHfttdY7nYqBlxsC/aTVEcDLLZkELuUkO+gacFKkPf7+/4PzqG64jVj91y0D0gqXtbZW
 2cUGu3O5/esIlO9wcFlvZ4R+oKDyg3I0re9UKek6LKM1j1TdAJgPsjP97yN4yq7m8308
 NFP53UUogpDdtpzfUaz59MRNKQnsTDWJ7Gst9XVUKK7end4XMMcZyvaB5St9c6yztSEn
 0Qt3H+7ZCtYIbSQZXcNljmuc+y3WyAzdAV2oN2zFB7qsnkRq0oh5cGrLBbqOOaqQGy9F
 BUiA==
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
dGlvbiBub3RpZnlfc21jX2Rpc3BsYXlfY29uZmlnX2NoYW5nZSBmb3IgbmF2aTEwIGFzaWMKClNp
Z25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKaW5kZXggMWQ0MmQ2ODY2ZmM5Li5kY2ExNmViNGFjNGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTEwNzEsNiArMTA3MSw0
NSBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfcHJvZmlsaW5nX2Nsa19tYXNrKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX25vdGlm
eV9zbWNfZGlzcGFseV9jb25maWcoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJc3RydWN0
IHNtdV9jbG9ja3MgbWluX2Nsb2NrcyA9IHswfTsKKwlzdHJ1Y3QgcHBfZGlzcGxheV9jbG9ja19y
ZXF1ZXN0IGNsb2NrX3JlcTsKKwlpbnQgcmV0ID0gMDsKKworCW1pbl9jbG9ja3MuZGNlZl9jbG9j
ayA9IHNtdS0+ZGlzcGxheV9jb25maWctPm1pbl9kY2VmX3NldF9jbGs7CisJbWluX2Nsb2Nrcy5k
Y2VmX2Nsb2NrX2luX3NyID0gc211LT5kaXNwbGF5X2NvbmZpZy0+bWluX2RjZWZfZGVlcF9zbGVl
cF9zZXRfY2xrOworCW1pbl9jbG9ja3MubWVtb3J5X2Nsb2NrID0gc211LT5kaXNwbGF5X2NvbmZp
Zy0+bWluX21lbV9zZXRfY2xvY2s7CisKKwlpZiAoc211X2ZlYXR1cmVfaXNfc3VwcG9ydGVkKHNt
dSwgU01VX0ZFQVRVUkVfRFBNX0RDRUZDTEtfQklUKSkgeworCQljbG9ja19yZXEuY2xvY2tfdHlw
ZSA9IGFtZF9wcF9kY2VmX2Nsb2NrOworCQljbG9ja19yZXEuY2xvY2tfZnJlcV9pbl9raHogPSBt
aW5fY2xvY2tzLmRjZWZfY2xvY2sgKiAxMDsKKwkJaWYgKCFzbXVfZGlzcGxheV9jbG9ja192b2x0
YWdlX3JlcXVlc3Qoc211LCAmY2xvY2tfcmVxKSkgeworCQkJaWYgKHNtdV9mZWF0dXJlX2lzX3N1
cHBvcnRlZChzbXUsIFNNVV9GRUFUVVJFX0RTX0RDRUZDTEtfQklUKSkgeworCQkJCXJldCA9IHNt
dV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsCisJCQkJCQkJCSAgU01VX01TR19TZXRNaW5E
ZWVwU2xlZXBEY2VmY2xrLAorCQkJCQkJCQkgIG1pbl9jbG9ja3MuZGNlZl9jbG9ja19pbl9zci8x
MDApOworCQkJCWlmIChyZXQpIHsKKwkJCQkJcHJfZXJyKCJBdHRlbXB0IHRvIHNldCBkaXZpZGVy
IGZvciBEQ0VGQ0xLIEZhaWxlZCEiKTsKKwkJCQkJcmV0dXJuIHJldDsKKwkJCQl9CisJCQl9CisJ
CX0gZWxzZSB7CisJCQlwcl9pbmZvKCJBdHRlbXB0IHRvIHNldCBIYXJkIE1pbiBmb3IgRENFRkNM
SyBGYWlsZWQhIik7CisJCX0KKwl9CisKKwlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUs
IFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsKKwkJcmV0ID0gc211X3NldF9oYXJkX2ZyZXFf
cmFuZ2Uoc211LCBTTVVfVUNMSywgbWluX2Nsb2Nrcy5tZW1vcnlfY2xvY2svMTAwLCAwKTsKKwkJ
aWYgKHJldCkgeworCQkJcHJfZXJyKCJbJXNdIFNldCBoYXJkIG1pbiB1Y2xrIGZhaWxlZCEiLCBf
X2Z1bmNfXyk7CisJCQlyZXR1cm4gcmV0OworCQl9CisJfQorCisJcmV0dXJuIDA7Cit9CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS50
YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRleHQgPSBu
YXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQsCkBAIC0xMDkzLDYgKzExMzIsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X2Ns
b2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5ID0gbmF2aTEwX2dldF9jbG9ja19ieV90eXBlX3dpdGhf
bGF0ZW5jeSwKIAkucHJlX2Rpc3BsYXlfY29uZmlnX2NoYW5nZWQgPSBuYXZpMTBfcHJlX2Rpc3Bs
YXlfY29uZmlnX2NoYW5nZWQsCiAJLmRpc3BsYXlfY29uZmlnX2NoYW5nZWQgPSBuYXZpMTBfZGlz
cGxheV9jb25maWdfY2hhbmdlZCwKKwkubm90aWZ5X3NtY19kaXNwYWx5X2NvbmZpZyA9IG5hdmkx
MF9ub3RpZnlfc21jX2Rpc3BhbHlfY29uZmlnLAogCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUgPSBu
YXZpMTBfZm9yY2VfZHBtX2xpbWl0X3ZhbHVlLAogCS51bmZvcmNlX2RwbV9sZXZlbHMgPSBuYXZp
MTBfdW5mb3JjZV9kcG1fbGV2ZWxzLAogCS5nZXRfZ3B1X3Bvd2VyID0gbmF2aTEwX2dldF9ncHVf
cG93ZXIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
