Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B334075D97
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 06:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF826E878;
	Fri, 26 Jul 2019 04:10:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21B16E878
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 04:10:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k10so51401636qtq.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 21:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0DJbA9Foh9i4FLIkJexkYK+OaA7U4E8v7BwbvD1c2A=;
 b=Bq4mPNFeBv9x61/U96xwcOyaTzsd58NpRlrEJ2k+jNhUriiF41X1Rt7zaIm2wd/l5T
 nlFUCIGd+EtSJLmBhuLLoZhJUPyFhM7kKz5S6xRCjhX5AccSJVFay2OgXxFobuY4hS6w
 84lmkIs2BVJhe7PXe52yDSGuAPjF0n2UEUO1CnTech+ExpAQySnvwp7lrSk/pPVWGIsV
 Gj+8PusxygJZEajrzTXgHuJUbphrf6KJgSwVYwn55R3OlJ3pg6hE2MWOlr0A793sB5Bb
 1oHyFve+tdWr+uR1h1Rf4lrKlBKCTif9NAeJYxZlFgURWS/IpoVto3VIf7NYYNYnQ/YA
 NWvw==
X-Gm-Message-State: APjAAAXcuE70Dp37AZpSZvfE3BiihxSq+txxLEhuZ2XpVyyEOx9kWkC1
 l0NNeqrxrVPDW3UZGTWba+O1sbZ3
X-Google-Smtp-Source: APXvYqxR+Ic1yWklqYheBUaSFujl/jeVlbc9wh50CUCe4S+FnlDxksT7ewrE6rsQz0v8YDVcnUFwEw==
X-Received: by 2002:ac8:368a:: with SMTP id a10mr64933570qtc.143.1564114252724; 
 Thu, 25 Jul 2019 21:10:52 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id d123sm24337272qkb.94.2019.07.25.21.10.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 21:10:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Date: Thu, 25 Jul 2019 23:10:41 -0500
Message-Id: <20190726041041.4023-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0DJbA9Foh9i4FLIkJexkYK+OaA7U4E8v7BwbvD1c2A=;
 b=ujUmWdq27ZB60YnHo3pgDLZqs131cXQ3zwGZ39/RFkfTvJIqOqb7WKE0hDgv7KRfRE
 r8QXet+PzliE7hGDy8hH/bmGSO/EvicoaMTNvwTGS1ORKUxEPk9VcIxn6f3gtjiHOhuY
 JqUEvv1OaK2M2BmuphctT2LYQyzTva/xHEKV7vmosyVV3xZD+2XTjIkyAAJ7KqPBgtmj
 awrJ8/xU1VOM90rEt4nUr48GgUsrWrNo6ZngSLz6a2VzYfhRZ28QeTJMCMaqW9ghWMpz
 qnucMjLiA8NkhHa93QanuPju4ymJZi8TV5qYcKXexAEYZ/SZELIjvYu8tdMtaXu8oII2
 A2PQ==
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

VGhlIFBDSSByZXZpc2lvbiBpZCBkZXRlcm1pbmVzIHRoZSBza3UuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jCmluZGV4IGM4NzMyMjhiZjA1Zi4uZGJhYzI0ZTQ0MTc0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0xNTkyLDcgKzE1OTIs
NyBAQCBzdGF0aWMgaW50IG5hdmkxMF9zZXRfcGVha19jbG9ja19ieV9kZXZpY2Uoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCiAJdWludDMyX3Qgc2Nsa19mcmVxID0gMCwgdWNsa19mcmVxID0gMDsK
IAl1aW50MzJfdCB1Y2xrX2xldmVsID0gMDsKIAotCXN3aXRjaCAoYWRldi0+cmV2X2lkKSB7CisJ
c3dpdGNoIChhZGV2LT5wZGV2LT5yZXZpc2lvbikgewogCWNhc2UgMHhmMDogLyogWFRYICovCiAJ
Y2FzZSAweGMwOgogCQlzY2xrX2ZyZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hUWDsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
