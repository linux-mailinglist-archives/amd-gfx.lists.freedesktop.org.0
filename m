Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85822A471A
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Nov 2020 14:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F107E6ECB6;
	Tue,  3 Nov 2020 13:58:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226A6ECB5
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 13:58:45 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v4so18374538edi.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Nov 2020 05:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6dXfLo1Tnv+uzCZx5qanUWNs8vml3AL6A1pGpF1OtIE=;
 b=vDNqptv0tX3Z8aXaLq21f0z6XR9i2Ib9A1tE2VcqhuLfw4exfXArr2r+Uxn1qM2xEm
 EjNaREgQwvUAZedME6En7E6A8Aaybq0hgzhawamUGgk6ToItoW/mLe/9iCxH+/qD+6gJ
 Iz5rqRmUCjEsdi0u9NiAlEuxi1xojoF/10CaaCa8vTYzWSu/QP92XYvAEw6IstanbQv8
 uLKlh6BN+j7wHuYkCsJKfm8y17PztmCVjGq/+zsRNKt+zHB0lHkTa+/AHFPVIw+evcWb
 VziwKC2Ek/V2XQ1o+Moej/Q6CbiUwUu9XypcbFBRBuh2WuT2cCz8DUBXKktjaZ1FWncr
 bDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dXfLo1Tnv+uzCZx5qanUWNs8vml3AL6A1pGpF1OtIE=;
 b=UbUD7xQBFebCP+c4Njvjl2kUg5Q7ILVEj4F1tua6y8ktwCzM5s4Z7jygXU7/IFzr1W
 xe8l/IPohjAGkYZQm3METgp3cGN+wNMsiWIaSLdC9BzA4awfnuzG4h+qBgKuXa2Lb8ip
 SnPCL72g6EYu3ryQ3j6MGEDKw+KSox+8jueLutZR8W3zIh4tFx5En592Ilo0dyMwwEgd
 33K6QbtTZ3miVHcizLHv9eGYwNUXQlW2Aq596guEhHD/EJrNA4RwF9tMoB7etKf/d2mw
 ZAAi5dsYkqVdmIb+Uiog+exnuBK9V01Alq0qkXPAKbc7ktHuHfP2Bxhh6SiIQXpIEDKn
 d5Vg==
X-Gm-Message-State: AOAM530no39uTRhHApG+e++nDlnSVyHeGphGn9wIPXIBhl/qmOZyFADn
 K7J13Pams64azfqYLvsiqooGMhpqTDQ=
X-Google-Smtp-Source: ABdhPJyl7lJgPtbAR1x0PWbtOcDBLbhA8N8T3wfIB8vbl4ZIuRTUPFy9LbieUa9Q+q2S2bYWbV1zPQ==
X-Received: by 2002:a50:fd8b:: with SMTP id o11mr10600887edt.156.1604411924279; 
 Tue, 03 Nov 2020 05:58:44 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f3a2:b920:33f3:da11])
 by smtp.gmail.com with ESMTPSA id j6sm7903263edy.87.2020.11.03.05.58.43
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:58:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/amdgpu: implement retry fault handling for Navi
Date: Tue,  3 Nov 2020 14:58:37 +0100
Message-Id: <20201103135837.39693-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103135837.39693-1-christian.koenig@amd.com>
References: <20201103135837.39693-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2FtZSBhcyBnbWM5LCBiYXNpY2FsbHkgZmlsdGVyIHRoZSBmYXVsdCwgcmVyb3V0ZSBvciBoYW5k
bGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKaW5kZXggY2ZmYzNjYThm
Y2RlLi40ZjZlNDRlMjE2OTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
CkBAIC05NCw2ICs5NCw3IEBAIHN0YXRpYyBpbnQgZ21jX3YxMF8wX3Byb2Nlc3NfaW50ZXJydXB0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2ly
cV9zcmMgKnNvdXJjZSwKIAkJCQkgICAgICAgc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkp
CiB7CisJYm9vbCByZXRyeV9mYXVsdCA9ICEhKGVudHJ5LT5zcmNfZGF0YVsxXSAmIDB4ODApOwog
CXN0cnVjdCBhbWRncHVfdm1odWIgKmh1YiA9ICZhZGV2LT52bWh1YltlbnRyeS0+dm1pZF9zcmNd
OwogCXN0cnVjdCBhbWRncHVfdGFza19pbmZvIHRhc2tfaW5mbzsKIAl1aW50MzJfdCBzdGF0dXMg
PSAwOwpAQCAtMTAyLDYgKzEwMywzMCBAQCBzdGF0aWMgaW50IGdtY192MTBfMF9wcm9jZXNzX2lu
dGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhZGRyID0gKHU2NCllbnRyeS0+
c3JjX2RhdGFbMF0gPDwgMTI7CiAJYWRkciB8PSAoKHU2NCllbnRyeS0+c3JjX2RhdGFbMV0gJiAw
eGYpIDw8IDQ0OwogCisJaWYgKHJldHJ5X2ZhdWx0KSB7CisJCS8qIFJldHVybmluZyAxIGhlcmUg
YWxzbyBwcmV2ZW50cyBzZW5kaW5nIHRoZSBJViB0byB0aGUgS0ZEICovCisKKwkJLyogUHJvY2Vz
cyBpdCBvbnlsIGlmIGl0J3MgdGhlIGZpcnN0IGZhdWx0IGZvciB0aGlzIGFkZHJlc3MgKi8KKwkJ
aWYgKGVudHJ5LT5paCAhPSAmYWRldi0+aXJxLmloX3NvZnQgJiYKKwkJICAgIGFtZGdwdV9nbWNf
ZmlsdGVyX2ZhdWx0cyhhZGV2LCBhZGRyLCBlbnRyeS0+cGFzaWQsCisJCQkJCSAgICAgZW50cnkt
PnRpbWVzdGFtcCkpCisJCQlyZXR1cm4gMTsKKworCQkvKiBEZWxlZ2F0ZSBpdCB0byBhIGRpZmZl
cmVudCByaW5nIGlmIHRoZSBoYXJkd2FyZSBoYXNuJ3QKKwkJICogYWxyZWFkeSBkb25lIGl0Lgor
CQkgKi8KKwkJaWYgKGluX2ludGVycnVwdCgpKSB7CisJCQlhbWRncHVfaXJxX2RlbGVnYXRlKGFk
ZXYsIGVudHJ5LCA4KTsKKwkJCXJldHVybiAxOworCQl9CisKKwkJLyogVHJ5IHRvIGhhbmRsZSB0
aGUgcmVjb3ZlcmFibGUgcGFnZSBmYXVsdHMgYnkgZmlsbGluZyBwYWdlCisJCSAqIHRhYmxlcwor
CQkgKi8KKwkJaWYgKGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoYWRldiwgZW50cnktPnBhc2lkLCBh
ZGRyKSkKKwkJCXJldHVybiAxOworCX0KKwogCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7
CiAJCS8qCiAJCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3RhdHVzIHJl
Z2lzdGVyIHRvCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=
