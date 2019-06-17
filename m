Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F4848FDB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6CA89DA4;
	Mon, 17 Jun 2019 19:46:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7689D52
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:03 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h21so12245343qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9P17GnLU3CS4ISgGM/qisNOVJ2qsvuG3T4+URdDrloU=;
 b=bTPnrTcUsIz89ATWQmP49djB2X/AGVD7w9n7C/l+dlkoL0/ZbXHaGfiVD/FL8ctVSq
 QzSo1SQ5mFkxo7Xo6P8Dbj9j+m9iLQ5jp6OJezB8HdCHR2o+9c0atWJkkxTz6E2DWcCB
 6fZdnA9hQIoBuU8OU3VnZHwYwiv+PuMqq7nYDPJgOZMFbjP5OMFBpl1V/7tXATbmbinE
 P+wQul/Sg2013U9g8RGoXnatv8+pgxG5Q882Dl0tAda8gZ1ycJi3mk6M0uVdqG6SYCdd
 8RRHgYS7mHPF0URybaITNN+K69MP0e6YZFjWKSzUB0zUB/UcpZz33FhNMwToVu3FeMko
 9KtA==
X-Gm-Message-State: APjAAAXNsiwlDtpJwVx8oOPjhKzdwEcS+UzxQ+FoK8+pERbUlJafjsJz
 xBRSvnrEfDwD2YpqY07O+4a7nqK85R4=
X-Google-Smtp-Source: APXvYqxd1gn1BwgXXTESXhKd6yc472EHEsyk+T5vHUDrVEDnG7TPZljxqoXAHYgWy4u4mpW+niEVzQ==
X-Received: by 2002:ac8:1a59:: with SMTP id q25mr95000525qtk.76.1560800762260; 
 Mon, 17 Jun 2019 12:46:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 312/459] drm/amd/powerplay: notify smu with active display
 count
Date: Mon, 17 Jun 2019 14:44:13 -0500
Message-Id: <20190617194540.18497-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9P17GnLU3CS4ISgGM/qisNOVJ2qsvuG3T4+URdDrloU=;
 b=rr7kXRkWo90FqXE/y8d3Dy1nIWXRKUBRNFOB2eQebu9YictQfX4Sn4NnknA5b1q3zn
 RT8i1DbK25KRqzirAQPGN314Z8zoDmTrqT+DOpgcTxdjUV7FPwCelLraWP/iiZ/89VHt
 FaemMALxTfuYpCKYfzB1Wfb/CDLK5gI8myOeBR/rRTMNQNszjzFhFgiZ+t4cKo7PbBpi
 /ANjjsGok8DYar2A52TTPIMnkLBiVIfX9ru210S0ATZkIbSqYLGzt92dq68e5UOI2qZ4
 WHxEQBqdGymlZOB5DlWubljoiDH10M54Cpva7kY+4tqzx8mKe7iGRvbVumRRzXBMfTBY
 aYJw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKd2hlbiBkYyB1cGRhdGUgY2xv
Y2tzIHZpYSBzbXUsIHNtdSBuZWVkcyB0byBrbm93IGhvdyBtYW55CmRpc3BsYXlzIGFjdGl2ZS4g
dGhpcyBpbnRlcmZhY2UgaXMgZm9yIGRjIG5vdGlmeSBudW1iZXIKb2YgYWN0aXZlIGRpc3BsYXlz
IHRvIHNtdS4KClNpZ25lZC1vZmYtYnk6IGhlcnNlbiB3dSA8aGVyc2VueHMud3VAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA3
MzY2ZWYzNmFjNTUuLmNhZjZjOTg0N2MwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKQEAgLTc3Myw2ICs3NzMsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9p
bml0X2Rpc3BsYXlfY291bnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IGNvdW50
KQogCiAJaWYgKCFzbXUtPnBtX2VuYWJsZWQpCiAJCXJldHVybiByZXQ7CisKIAlyZXQgPSBzbXVf
c2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX051bU9mRGlzcGxheXMsIGNvdW50
KTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
