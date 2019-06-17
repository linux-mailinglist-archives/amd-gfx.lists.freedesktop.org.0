Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931048F4A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE7389BF4;
	Mon, 17 Jun 2019 19:31:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7689BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:37 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so12257272qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLdZDwqKWtHwWUBvQICC374jptL74KcemMJZ83K47tE=;
 b=PndMZUFvaflUNobxPbo1PVbekvTigFWJazyAdYnqe1ZL5C0AWUB7T1WPKrqs0rAaeq
 L/QMg4QrLPPHZksB5U+MzmfRsiyjSKYYPplMK/iU2NCAJSvT11FtcxZ6jTcUoJ0FZ/lS
 m/44wpHRO9Ii3il/uYI52NdKJ+HURjsmKUQzlxTu1MEfUC3X9GErH2tm9eOoI9jDKL/4
 QW378aYLn2uuz0XFaNkp8J+4X72xFcRwj+/TI836VFkldN3QCL8gU5endf1RXqGMrufP
 QwF1JFlFgCJQl6fDWSewbobSvM+5clM8Yi5qgOv94yeYcA84aT/jHEzfqwyH3G7iQ6R6
 asog==
X-Gm-Message-State: APjAAAVLo3U4sGKYwROa17DmvsoJMYVIY5Ct3PAztU3MOY5WoiMiz1eZ
 FIUyC2VrLwfj2Yc4UrrvXAA15e8sm5Q=
X-Google-Smtp-Source: APXvYqy+MdPtOpQkqDJ4jdaZkNtpuWEChugkm+LNs7C9Yjd+G7OeLKmLsY9PDnOBNydwUDrPReBprA==
X-Received: by 2002:a0c:d295:: with SMTP id q21mr23141303qvh.245.1560799896584; 
 Mon, 17 Jun 2019 12:31:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 226/459] drm/amdgpu/gfx10: require to pin/unpin CSIB BO when
 suspend/resume
Date: Mon, 17 Jun 2019 14:29:53 -0500
Message-Id: <20190617193106.18231-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLdZDwqKWtHwWUBvQICC374jptL74KcemMJZ83K47tE=;
 b=Sizn46yxagUUj3jYJhKMTwdVf98shnc3qMQtE8ncCljSaqIi6JvMWGDSpSdTkhMNOv
 ymAL9IAgsrtwKOWs7/Xl8R+JIZ8+lLwl8SQ+2/r6rarR+lpq02zuUYUDeUodYvGbjwJ/
 to1z9cSHflecD7SAXFPVUPSWd0t7gyy7vSRHMQpLOWn69YsA3/OWOwi2Fez2jjkPpj6q
 +en4E0tNqq2KadA0zWmtCKzR0yb9UYkGlpjmSgUGs7OWqpPCmK+IDV8F3q+bh9x0ySmv
 kffgvUHn6bFagRDn7PRMkJpN/QDT5Vvx84mSE0g//Fq7BZQOVPokdVbpYIxnlb1gZwYG
 y88Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkNTSUIgQk8gaXMgcmVxdWlyZWQg
dG8gYmUgcGlubmVkIGRvd24gdG8gZ3VhcmFudGVlCmJvIGlzIGFsd2F5cyB2YWxpZCB3aGVuIHJl
c3VtZSwgYW5kIHRvIGJlIHVucGlubmVkIGl0CnNvIHRoYXQgaXRzIGNvbnRlbnQgY2FuIGJlIHNh
dmVkIGR1cmluZyBzdXNwZW5kLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9A
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMzggKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBmYzZiOTVmZTY4NzkuLmY2
ZWE2OWE0MjMwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTgx
Myw2ICs4MTMsMzkgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfcmxjX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgZ2Z4X3YxMF8wX2Nz
Yl92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKworCXIg
PSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2Up
OworCWlmICh1bmxpa2VseShyICE9IDApKQorCQlyZXR1cm4gcjsKKworCXIgPSBhbWRncHVfYm9f
cGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLAorCQkJQU1ER1BVX0dFTV9ET01BSU5f
VlJBTSk7CisJaWYgKCFyKQorCQlhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dwdV9hZGRyID0K
KwkJCWFtZGdwdV9ib19ncHVfb2Zmc2V0KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsK
KworCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwor
CisJcmV0dXJuIHI7Cit9CisKK3N0YXRpYyB2b2lkIGdmeF92MTBfMF9jc2JfdnJhbV91bnBpbihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKworCWlmICghYWRldi0+Z2Z4
LnJsYy5jbGVhcl9zdGF0ZV9vYmopCisJCXJldHVybjsKKworCXIgPSBhbWRncHVfYm9fcmVzZXJ2
ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgdHJ1ZSk7CisJaWYgKGxpa2VseShyID09
IDApKSB7CisJCWFtZGdwdV9ib191bnBpbihhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7
CisJCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwor
CX0KK30KKwogc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX21lY19maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogewogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z2Z4Lm1lYy5ocGRf
ZW9wX29iaiwgTlVMTCwgTlVMTCk7CkBAIC0zNTE3LDYgKzM1NTAsMTAgQEAgc3RhdGljIGludCBn
ZnhfdjEwXzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJaW50IHI7CiAJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKKwlyID0gZ2Z4
X3YxMF8wX2NzYl92cmFtX3BpbihhZGV2KTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisKIAlpZiAo
IWFtZGdwdV9lbXVfbW9kZSkKIAkJZ2Z4X3YxMF8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhhZGV2
KTsKIApAQCAtMzYwNCw2ICszNjQxLDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfaHdfZmluaSh2
b2lkICpoYW5kbGUpCiAJfQogCWdmeF92MTBfMF9jcF9lbmFibGUoYWRldiwgZmFsc2UpOwogCWdm
eF92MTBfMF9lbmFibGVfZ3VpX2lkbGVfaW50ZXJydXB0KGFkZXYsIGZhbHNlKTsKKwlnZnhfdjEw
XzBfY3NiX3ZyYW1fdW5waW4oYWRldik7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
