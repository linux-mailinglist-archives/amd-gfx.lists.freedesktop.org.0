Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B648F58
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5045289C08;
	Mon, 17 Jun 2019 19:31:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F78B89C1C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12224490qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Gn0pbY12WVRreTsytLhbYhTagNAWHLekZr243t39/M=;
 b=lrpqnM0HJr/wAJJlODX16jy8RJaXzN/7U4s7u1JmezfnhxWgc2EaZiqpsVJf+3A2Nc
 Q8R4zb5PKAmuGgwR4FrZY39YFrTETOPC6QeSOPIUaygnS9rbNZfLBBjlN+ZsOSXqsf2f
 gHH9QExUWNW6Et/YnK4F0ALHiksVTDcXuw5SMtXa7WZalzZBIh32/Si0HenOtZkoUBzu
 JcyWliS9rcp2H5vdt2NgPD3457X0KIhOh27zmarwnPk+GIkASVuSXxCGZDYwdJjfi183
 F9lPL84x2Eq6tc7Vm3VHNQov2v/qDAvR+V+NSqBxE5imNXRm/VayQEFNX4K5tTUJuEtB
 Hs1g==
X-Gm-Message-State: APjAAAXyRBmj+GMrI+jrDbG5o/UB3NIiVSF+4ntTIK+r4WHx8C8IK5vv
 ywk8YOc9mPJ3P/PZU8F+2CQ6vzBU1yg=
X-Google-Smtp-Source: APXvYqwRzLOyePyAIyMzmRUP8KwS5BpZFSQiL3NlhVK57teBEkxn9Uo0vG79hfQG+aSCN2t2doN7BA==
X-Received: by 2002:a0c:9332:: with SMTP id d47mr22945005qvd.222.1560799903446; 
 Mon, 17 Jun 2019 12:31:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 234/459] drm/amd/powerplay: add function
 populate_umd_state_clk for navi10
Date: Mon, 17 Jun 2019 14:30:01 -0500
Message-Id: <20190617193106.18231-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Gn0pbY12WVRreTsytLhbYhTagNAWHLekZr243t39/M=;
 b=EpLheANW357d5zyKEXQGHim9Zc8v7l7fv2leVYx8abSKHfCvX4FdR2DSOqPZ+byFGa
 987WFRLlJyeWUdD08cJKy6jaSKwGDk64b5IeFRh89NwCH9duZq7D7bvjXTrUhG7DzxnJ
 FmbuvJeykvahkC52jP+mRCsGunnHcUAcC4z3GNjDSsO3x8y2a3YpkxZpN2c3mNseSLuD
 irae8NJxegYJG/AU6t1Jw0l50TaDl4QqmBOsC8OHPc/vxjJ9xM+LrcrbnPBbs+GIKOCS
 eFDlk1CLMCBQsoPibqR/Dj9qSuXCRKARLSaRwvfDbcCFbdYen8on7YEAQ1g7aABdo9i3
 9eeQ==
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
dGlvbiBwb3B1bGF0ZV91bWRfc3RhdGVfY2xrIGZvciBuYXZpMTAgYXNpYwoKU2lnbmVkLW9mZi1i
eTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmlu
ZGV4IDMxMWE4NTYxMzAwMS4uOTM2ZGZlNTcxZTZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC02MDIsNiArNjAyLDIwIEBAIHN0YXRpYyBpbnQgbmF2
aTEwX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHNp
emU7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX3BvcHVsYXRlX3VtZF9zdGF0ZV9jbGsoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUpCit7CisJaW50IHJldCA9IDA7CisJdWludDMyX3QgbWluX3NjbGtf
ZnJlcSA9IDA7CisKKwlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgU01VX1NDTEss
ICZtaW5fc2Nsa19mcmVxLCBOVUxMKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJc211
LT5wc3RhdGVfc2NsayA9IG1pbl9zY2xrX2ZyZXEgKiAxMDA7CisKKwlyZXR1cm4gcmV0OworfQor
CiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsK
IAkudGFibGVzX2luaXQgPSBuYXZpMTBfdGFibGVzX2luaXQsCiAJLmFsbG9jX2RwbV9jb250ZXh0
ID0gbmF2aTEwX2FsbG9jYXRlX2RwbV9jb250ZXh0LApAQCAtNjE5LDYgKzYzMyw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5nZXRf
Y3VycmVudF9jbGtfZnJlcV9ieV90YWJsZSA9IG5hdmkxMF9nZXRfY3VycmVudF9jbGtfZnJlcV9i
eV90YWJsZSwKIAkucHJpbnRfY2xrX2xldmVscyA9IG5hdmkxMF9wcmludF9jbGtfbGV2ZWxzLAog
CS5mb3JjZV9jbGtfbGV2ZWxzID0gbmF2aTEwX2ZvcmNlX2Nsa19sZXZlbHMsCisJLnBvcHVsYXRl
X3VtZF9zdGF0ZV9jbGsgPSBuYXZpMTBfcG9wdWxhdGVfdW1kX3N0YXRlX2NsaywKIH07CiAKIHZv
aWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
