Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56948FF9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C73A89DEA;
	Mon, 17 Jun 2019 19:46:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D7989DEA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:33 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id t8so7005054qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEKC47UYOyTdNmlC1jcvCvOYgiqn0x2xtKNebWzddPQ=;
 b=B8GcfFxBVr324UUG9SD10A8sHkknFD3pbvVPXt+fYlvQPM43KtTUB9sQBv41gpMP09
 +YDqtJLwoySXRZvnokIKInzBRuIWDQb1tXbSGuvqg8TzxND5giJ8BpmwFNWWlinQUszu
 zefZ3GO1Wwo/rSnnNBs9Qk+qs2hsXLbmhzkCssH27Cr4qZOggbQQUUia6+1qKXv5xHAv
 Ie21JYYrdL42NRft6IRBnz6iHlveec908Dy2wFyj71/u9EZ/VH235l7rVXohK73bdfH9
 ZSGnSzMrzyOty0jesIrBV1eYyHQg8WtWDIoBxbbIJ51Xv0z5TCacJRLhMtwnYv3IHFrG
 4Scw==
X-Gm-Message-State: APjAAAWWgXc+/XQn8r+Agud6bK/vahsuPgDoR5KLt3/UupBqM8orZpt2
 2xm+xfgGUvk6xDjC+7CxiHaDQO7aPvk=
X-Google-Smtp-Source: APXvYqyjC1bethoQ/sRiBTPGgAPNzH/JxH+45ur/VtRH/5hIVGtfxQNurTUb0vB4TruxyieOlmJd1Q==
X-Received: by 2002:a37:5942:: with SMTP id n63mr77380385qkb.69.1560800792067; 
 Mon, 17 Jun 2019 12:46:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 336/459] drm/amd/powerplay: add interface to get uclk dpm table
Date: Mon, 17 Jun 2019 14:44:37 -0500
Message-Id: <20190617194540.18497-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEKC47UYOyTdNmlC1jcvCvOYgiqn0x2xtKNebWzddPQ=;
 b=szs4CWmwBOgzjVSedSYQhtmAzOSLBh4kh+te9xSq+/8nRxJ8tyb3t+dpHUgo6ASZav
 s/QmyYruJHdSj4cvEH0P3o1j0DPDzF9ud6n9YQkmWcOQmcQrcGFWfay1Pea5F7Eb8O7x
 4Mc+i3apTOzAjMVrN0ipBPcsrgUspmTiYj2cLrsJDXXo2sjUoNAkOENV9MwlBwwB41ci
 +72+6PgTpYhzP9eoqTtf+Bk4AmivCW47l1ImeQdwM20CcBjBHWsf6EeUjD+i2dm+0oiG
 rNj1zTnLgQoN1eY6ZrhUA8lvCk/qbD75z9LMpdpYUXDmzLgyfPvO5ShNrXCMOFYNlOaf
 JMfQ==
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

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKZGMgbmVlZHMgZ2V0IHVjbGsg
ZHBtIHRhYmxlIGZvciBiYW5kd2lkdGggY2FsY3VsYXRpb24KClNpZ25lZC1vZmYtYnk6IGhlcnNl
biB3dSA8aGVyc2VueHMud3VAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggYzc0ODgyMWVmNzY2
Li4yODE4ZGY0NjQ4MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaApAQCAtODc4LDYgKzg3OCw4IEBAIHN0cnVjdCBzbXVfZnVuY3MKIAkoKHNt
dSktPnBwdF9mdW5jcy0+c2V0X3dhdGVybWFya3NfdGFibGUgPyAoc211KS0+cHB0X2Z1bmNzLT5z
ZXRfd2F0ZXJtYXJrc190YWJsZSgoc211KSwgKHRhYiksIChjbG9ja19yYW5nZXMpKSA6IDApCiAj
ZGVmaW5lIHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzbXUsIGNsa190eXBlLCB2
YWx1ZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJs
ZSA/IChzbXUpLT5wcHRfZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKChzbXUp
LCAoY2xrX3R5cGUpLCAodmFsdWUpKSA6IDApCisjZGVmaW5lIHNtdV90aGVybWFsX3RlbXBlcmF0
dXJlX3JhbmdlX3VwZGF0ZShzbXUsIHJhbmdlLCBydykgXAorCSgoc211KS0+cHB0X2Z1bmNzLT50
aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlX3VwZGF0ZT8gKHNtdSktPnBwdF9mdW5jcy0+dGhlcm1h
bF90ZW1wZXJhdHVyZV9yYW5nZV91cGRhdGUoKHNtdSksIChyYW5nZSksIChydykpIDogMCkKICNk
ZWZpbmUgc211X2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKHNtdSwgcmFuZ2UpIFwKIAko
KHNtdSktPnBwdF9mdW5jcy0+Z2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFuZ2U/IChzbXUpLT5w
cHRfZnVuY3MtPmdldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKChzbXUpLCAocmFuZ2UpKSA6
IDApCiAjZGVmaW5lIHNtdV9yZWdpc3Rlcl9pcnFfaGFuZGxlcihzbXUpIFwKQEAgLTg4OCw2ICs4
OTAsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2Rw
bV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAo
Y2xvY2tzX2luX2toeiksIChudW1fc3RhdGVzKSkgOiAwKQogI2RlZmluZSBzbXVfZ2V0X21heF9z
dXN0YWluYWJsZV9jbG9ja3NfYnlfZGMoc211LCBtYXhfY2xvY2tzKSBcCiAJKChzbXUpLT5mdW5j
cy0+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMgPyAoc211KS0+ZnVuY3MtPmdldF9t
YXhfc3VzdGFpbmFibGVfY2xvY2tzX2J5X2RjKChzbXUpLCAobWF4X2Nsb2NrcykpIDogMCkKKyNk
ZWZpbmUgc211X2dldF91Y2xrX2RwbV9zdGF0ZXMoc211LCBjbG9ja3NfaW5fa2h6LCBudW1fc3Rh
dGVzKSBcCisJKChzbXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+
cHB0X2Z1bmNzLT5nZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xvY2tzX2luX2toeiksIChu
dW1fc3RhdGVzKSkgOiAwKQogCiBleHRlcm4gaW50IHNtdV9nZXRfYXRvbV9kYXRhX3RhYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCB0YWJsZSwKIAkJCQkgICB1aW50MTZfdCAq
c2l6ZSwgdWludDhfdCAqZnJldiwgdWludDhfdCAqY3JldiwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
