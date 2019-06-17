Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8748E30
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1DB897BB;
	Mon, 17 Jun 2019 19:18:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75BB89781
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12158870qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhBCTqswIb5lUStstabeSRg+EZg8BdoLvcIskFD3Mk4=;
 b=K8LfN0KZgKiFPDCRRAXgdArkAIGn2UuPTdsul/oucqrE+u/lFaJF0IBQt+n7mNrWH+
 pmYQyrHc/rDmLVY7nijAHmIL3oP7qqrJ4EGP/snr7QZ0KGhO5OEPl5CpU13BtD0lcO+7
 grbfX6XR8C3vVWNItM2fyyvn3PQD+p7EOxjPBDQjBXrrnRZzYVFWUAtau3+LYyBNvEKW
 4Qg2R4Z5cuWM2F6qOKQ8nCu/4KwBDlITM6y3iV/rdBLQe/unKzxr33xP6EIg9LQGOw2j
 e26BfI85rRKSTqFQ6eyUYwcwr9wTit0DIRAxhOMNM7LMI3DkkoKFtcw67XgQV2QUUAz1
 2qLg==
X-Gm-Message-State: APjAAAWZ30igirJiUCVzQdl2KxiKKn7/xi7irAQDOcSBWFkCH+ugQNhD
 P+ULRilCAg0WHLPmRbW88ONlr4jgtLA=
X-Google-Smtp-Source: APXvYqyL03ut9Gbk0sPNidsUf04DdmsJs11mIb3dMgUQUiqO4plSbCmW2OtBSkYjGoMjU68/C89rgg==
X-Received: by 2002:ac8:2bdc:: with SMTP id n28mr58076970qtn.197.1560799127715; 
 Mon, 17 Jun 2019 12:18:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 112/459] drm/amdgpu: add Navi10 VCN firmware support
Date: Mon, 17 Jun 2019 14:11:13 -0500
Message-Id: <20190617191700.17899-101-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhBCTqswIb5lUStstabeSRg+EZg8BdoLvcIskFD3Mk4=;
 b=Nr537cDtjmkHzZBgQ7Mnqe7PxpeiQ8KV3nniphvRbKwT8AUfUZdDG1tjUQwk0Go4ub
 QO0uqes320byt8eo1LyQ8HxxvJTJF+T41JcziBX33rRro3/BLUOrdBmsdkPyiRUVLdWZ
 TdC64wNK80YD3j6UGq8nhf90V5ErSo9DP5+zKG0cSuZKyf6CkkhXhf2DqFTqmMkhoxFJ
 3FcjigLLVehNsb2K6wV3y3Ohn/TxaSpOfr1aU90O4VkW16uG3glbAmUvP+n21VyVqjCT
 l0vd9EcrpbhVLtW3m3mmnKL9l9OPRDIrH7z0jkN6mlAN3qsGbSDMQ1TYDhQYBLO7f0WI
 BKVA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIE5hdmkxMCB0byBWQ04gZmFtaWx5
CgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCmluZGV4
IGQ3ODYwOTgzNjRkZC4uOGVjZTQyN2I2MDE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Zjbi5jCkBAIC00NSwxMCArNDUsMTIgQEAKICNkZWZpbmUgRklSTVdBUkVfUkFWRU4J
CSJhbWRncHUvcmF2ZW5fdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfUElDQVNTTwkiYW1kZ3B1
L3BpY2Fzc29fdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfUkFWRU4yCQkiYW1kZ3B1L3JhdmVu
Ml92Y24uYmluIgorI2RlZmluZSBGSVJNV0FSRV9OQVZJMTAgCSJhbWRncHUvbmF2aTEwX3Zjbi5i
aW4iCiAKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9SQVZFTik7CiBNT0RVTEVfRklSTVdBUkUo
RklSTVdBUkVfUElDQVNTTyk7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfUkFWRU4yKTsKK01P
RFVMRV9GSVJNV0FSRShGSVJNV0FSRV9OQVZJMTApOwogCiBzdGF0aWMgdm9pZCBhbWRncHVfdmNu
X2lkbGVfd29ya19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CiAKQEAgLTcxLDYg
KzczLDkgQEAgaW50IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAkJZWxzZQogCQkJZndfbmFtZSA9IEZJUk1XQVJFX1JBVkVOOwogCQlicmVhazsKKwljYXNl
IENISVBfTkFWSTEwOgorCQlmd19uYW1lID0gRklSTVdBUkVfTkFWSTEwOworCQlicmVhazsKIAlk
ZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
