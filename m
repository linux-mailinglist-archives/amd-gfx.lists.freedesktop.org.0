Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47649005
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1BB89E5B;
	Mon, 17 Jun 2019 19:46:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1134489E69
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x2so12337422qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoK/5iZD2GppRrRm72Dtdh0KPFpYJXR5T35ZJsf/1Xs=;
 b=qnnOg2ZTWrtQs86GgFgYDdyCPEZZ3TmMpqIk1DOwrYYPehxjL5vBAjtc+loE+4bF8c
 RAa3ioArvrQSk3In2guXp1XC0imkCwpkl47+beTngQ72f9qVKIEgsgD8OgxZfaP3SK4y
 wDR+QTxq40yTlNuiPUqKKh/d52RmC53WLb1hpBG4WkJnLJnfHKr8DzaKX7JEggCFXx3Y
 ptt06crHplKmn4VXBIsuHZMuztT3jRwTneT8icmXjY4fBg/UGe1YCfAsqTxWMoF0MQTE
 BAMSrgI60Ar5fAr+MMKgIrfxg4AKBzxVS2H8TdDO4VtnLd0VCZSTuR7TPWz+8lGzyRMZ
 BUvg==
X-Gm-Message-State: APjAAAVtkmQvJmQCDKRjw/xvAwr6kBxT0TIlGRndT2Ppqw+lpWVH6HuR
 WGS+ngUwuGCQa8i7x5/0cGFwq67mnU8=
X-Google-Smtp-Source: APXvYqxbOooiJHjnTF4eX8RDR823nkoqk6M2HYlG0mmL3VyEBAej7l9F04lWlIy60dU3COdzkbSqOA==
X-Received: by 2002:a0c:acb5:: with SMTP id m50mr23081498qvc.82.1560800803109; 
 Mon, 17 Jun 2019 12:46:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 345/459] drm/amd/display/dc: fix azalia workaround sw
 implementation bug
Date: Mon, 17 Jun 2019 14:44:46 -0500
Message-Id: <20190617194540.18497-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoK/5iZD2GppRrRm72Dtdh0KPFpYJXR5T35ZJsf/1Xs=;
 b=e+xYgvGBNLwF/yOdhXVs6P7Q1KYiv3+Q1L4OJBkZYH5qN9DkMgbrR/Npk5TvFCM6mM
 l33VjMZ2mCVHR+0VAQpblISq+Ap/12u5yzg7LHNxHuRbU0LNVR3HGL+CSd5YIFoqiAIi
 17vPqdBkTq8SEYYP3S0cnzCL4epLvL8LuDRZXhwmVFPWuuZcvtAm5FTX1OPm+tEIAIh6
 A4a7G9EONXvjrxWihfQw8Re87S6C9bO1DaBcAOZF1HKt33zMlZ/VzfsCDM+F3D8FuT4p
 I4yAiFuIwAcGckQVIEV7hrEtyaJwmzgUISphBGRdZqpPM5MrGcq2qRg0IAibwyuA8Ohu
 Fpew==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKY2FsbGVyIG9mIHBwX252X3Nl
dF9wbWVfd2FfZW5hYmxlIHBhc3MgaW5jb3JyZWN0IHBwX3NtdToKZGMtPnJlc19wb29sLT5wcF9z
bXUuIGl0IHNob3VsZCBiZSBkYy0+cmVzX3Bvb2wtPnBwX3NtdS0+bnZfZnVuY3MucHBfc211Lgp3
aXRoIGluY29ycmVjdCBpbnB1dCwgcHAtPmRtID0gTlVMTC4gVGhpcyBjYXVzZXMgc3lzdGVtIGNy
YXNoLgoKU2lnbmVkLW9mZi1ieTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2Vy
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
MTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwppbmRleCBlN2NjNThlZjZhNWUuLmVkZGE0MjZlMzJi
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2Ux
MTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTk2OSwxMCArOTY5LDEwIEBAIHN0YXRpYyB2
b2lkIHNldF9wbWVfd2FfZW5hYmxlX2J5X3ZlcnNpb24oc3RydWN0IGRjICpkYykKIAogCWlmIChw
cF9zbXUpIHsKIAkJaWYgKHBwX3NtdS0+Y3R4LnZlciA9PSBQUF9TTVVfVkVSX1JWICYmIHBwX3Nt
dS0+cnZfZnVuY3Muc2V0X3BtZV93YV9lbmFibGUpCi0JCQlwcF9zbXUtPnJ2X2Z1bmNzLnNldF9w
bWVfd2FfZW5hYmxlKCYocHBfc211LT5jdHgpKTsKKwkJCXBwX3NtdS0+cnZfZnVuY3Muc2V0X3Bt
ZV93YV9lbmFibGUoJihwcF9zbXUtPnJ2X2Z1bmNzLnBwX3NtdSkpOwogI2lmZGVmIENPTkZJR19E
Uk1fQU1EX0RDX0RDTjJfMAogCQllbHNlIGlmIChwcF9zbXUtPmN0eC52ZXIgPT0gUFBfU01VX1ZF
Ul9OViAmJiBwcF9zbXUtPm52X2Z1bmNzLnNldF9wbWVfd2FfZW5hYmxlKQotCQkJcHBfc211LT5u
dl9mdW5jcy5zZXRfcG1lX3dhX2VuYWJsZSgmKHBwX3NtdS0+Y3R4KSk7CisJCQlwcF9zbXUtPm52
X2Z1bmNzLnNldF9wbWVfd2FfZW5hYmxlKCYocHBfc211LT5udl9mdW5jcy5wcF9zbXUpKTsKICNl
bmRpZgogCX0KIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
