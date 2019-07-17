Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E751B6BE5E
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 16:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7D89E1D;
	Wed, 17 Jul 2019 14:35:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511189E1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 14:35:55 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so23574704qto.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 07:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKLxVxNqrsf8jwONHS9xvR9fvl7LBW+hB7jc0nyg230=;
 b=gaSDxBdDIRZl46DlG12xGw620cgQcrp0uIi81LJxBd8JSWvWPjXrK/wXHaasuNsvX0
 xRdHIjgeo41XMO/Lqcr8rEr9axAKY3Cw1/5pReEt71keiOxP05gu5Card7AFd5K8GlMS
 IeKvseBVpZJEaFCGNeKHJwUydEvEm5V8CBdvpgkkzJD6txdkHEzOhe9ef+jK0+EqgDA0
 K01QQNfiQcXBML/BQDbFkwbMLPat6PkkjJbozMlSAF8RclqEdl/DngQfcbPkmVoVSWb3
 yyl59c+RFWafRl7vtBxPXjxjLqtbkEucQ01iiMwTmqhwX3XHgQosC46fDMRyfvzvVSfu
 3U0Q==
X-Gm-Message-State: APjAAAUAMZcJaMkXrO5Ki0XwLyYLLX3+ECxdvMXkKizz/dO5cL1hYpV5
 Uobq1K/xcsE2G8qE69ardfvqVRCT
X-Google-Smtp-Source: APXvYqzwxXYRHPwIU0AJOU6Jp0sbTioi7W226rvUeuhexcvwwszGDSRR1mLXoftZHIF94cuy+RtwMg==
X-Received: by 2002:a0c:8b49:: with SMTP id d9mr28480136qvc.178.1563374154489; 
 Wed, 17 Jul 2019 07:35:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id l19sm14739828qtb.6.2019.07.17.07.35.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 07:35:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
Date: Wed, 17 Jul 2019 09:35:40 -0500
Message-Id: <20190717143540.30090-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717143540.30090-1-alexander.deucher@amd.com>
References: <20190717143540.30090-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKLxVxNqrsf8jwONHS9xvR9fvl7LBW+hB7jc0nyg230=;
 b=u0AbQXkKTpCCzQZ1m5bTwaTvj/fwH9OujS7cYy6VXnFu7GlznQtIsyUiAjpVSfdD5Y
 Zj9CimyDE6IsZhGsiEDu79/LJ90bAEjJKnCV/v2UbAoj7qMsMzujxwJqzi1fR3ftwj8E
 UqSvCEL/B+KuYFMNM27ca0hEgHjxtareG4AKOxLRpyw/9bLi0pE4Yu2vTN06crvFClZ2
 +bwKzaizKLmhhMwEoWCdMhoL6QKZeRrKmOBFGdjlAkU+5Y+VEoAixsJmnEt4r/bGo0Ct
 P95OUA2//Amj0qjxOxchpoQrm20Kxn6My1Oqa8cdYj6FE61fNPrDLpBnXhHg1+ERRCRX
 LPBg==
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

UXVlcnkgdGhlIG1ldHJpY3MgdGFibGUgdG8gZ2V0IHRoZSBhdmVyYWdlIHNjbGsgYW5kIHVjbGsu
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgMzUgKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOTIwNGU0ZTUw
ZDA5Li43NjNkNzNhZjZjZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMKQEAgLTMxMTcsNiArMzExNywzNiBAQCBzdGF0aWMgaW50IHZlZ2EyMF90aGVybWFs
X2dldF90ZW1wZXJhdHVyZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAogCXJldHVybiAwOwog
fQorCitzdGF0aWMgaW50IHZlZ2EyMF9nZXRfYXZnX2Nsb2NrcyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwKKwkJCQkgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCisJCQkJIHVpbnQzMl90ICp2
YWx1ZSkKK3sKKwlTbXVNZXRyaWNzX3QgbWV0cmljczsKKwlpbnQgcmV0ID0gMDsKKworCWlmICgh
dmFsdWUpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUs
IFNNVV9UQUJMRV9TTVVfTUVUUklDUywgKHZvaWQgKikmbWV0cmljcywgZmFsc2UpOworCWlmIChy
ZXQpCisJCXJldHVybiByZXQ7CisKKwlzd2l0Y2ggKHNlbnNvcikgeworCWNhc2UgQU1ER1BVX1BQ
X1NFTlNPUl9HRlhfU0NMSzoKKwkJKnZhbHVlID0gbWV0cmljcy5BdmVyYWdlR2Z4Y2xrRnJlcXVl
bmN5ICogMTAwOworCQlicmVhazsKKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfR0ZYX01DTEs6CisJ
CSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVVjbGtGcmVxdWVuY3kgKiAxMDA7CisJCWJyZWFrOwor
CWRlZmF1bHQ6CisJCXByX2VycigiSW52YWxpZCBzZW5zb3IgZm9yIHJldHJpZXZpbmcgYXZnIGNs
b2NrXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJuIDA7Cit9CisKIHN0YXRp
YyBpbnQgdmVnYTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSBl
bnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJCQkgdm9pZCAqZGF0YSwgdWludDMyX3QgKnNp
emUpCkBAIC0zMTQ3LDYgKzMxNzcsMTEgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9zZW5zb3Io
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCXJldCA9IHZlZ2EyMF90aGVybWFsX2dldF90ZW1w
ZXJhdHVyZShzbXUsIHNlbnNvciwgKHVpbnQzMl90ICopZGF0YSk7CiAJCSpzaXplID0gNDsKIAkJ
YnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX0dGWF9TQ0xLOgorCWNhc2UgQU1ER1BVX1BQ
X1NFTlNPUl9HRlhfTUNMSzoKKwkJcmV0ID0gdmVnYTIwX2dldF9hdmdfY2xvY2tzKHNtdSwgc2Vu
c29yLCAodWludDMyX3QgKilkYXRhKTsKKwkJKnNpemUgPSA0OworCQlicmVhazsKIAlkZWZhdWx0
OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
