Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7232C48E25
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B0689728;
	Mon, 17 Jun 2019 19:18:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498E189700
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:38 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id s15so12158115qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m7B8JYBXOSPvjOEDaaOD0Myou3jV6okTF3QiabHe+U=;
 b=qGO8PgJxd0ptJPmXWfYPe7O/oqAlL+aGTaYZM3nOWZRekqR06pjypfQpUSz4bC0EDx
 g4IfDjahmzXgItK6SmXoKZyGvqHHP2hL07YCiPofbdeTXsi1mi8Ks7cpQ1BfLtvVa01W
 65221W+ngfpI4/kZ9p7Rvfdub+QrbgEofjWjm8foV6WB7tZmXL3jZGRZnGvcOgzB48ix
 mYXMuiMxhROdLhkDsT69VbmRK2lhjA+mxF0n905rf2YHbjCv1cwslVmJbWOQZnr8UjbI
 /SlcrQjA3gW6z3eIE2QglkWLgR5G0CZChDaEyt7JLTJ9/rI5kT+a/TLLt+fnyIwfoJql
 dovA==
X-Gm-Message-State: APjAAAVuTB2BUOxnfJCdpDs5gThD+lTMRgCALkWM3PIZ4QnMVhNviylK
 59scr8Ubi/AiH13SFzGNchFe8wNCj20=
X-Google-Smtp-Source: APXvYqzBFNOlPqZ7WNZtST9YlAXxrlMqi6jI0m25E6ioBFGsXQ4TBHX8u15atHo4pUhmlyTlZ8r3sA==
X-Received: by 2002:ac8:2bd4:: with SMTP id n20mr86820961qtn.131.1560799117207; 
 Mon, 17 Jun 2019 12:18:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 100/459] drm/amdgpu/discovery: add harvest info data table
Date: Mon, 17 Jun 2019 14:11:01 -0500
Message-Id: <20190617191700.17899-89-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m7B8JYBXOSPvjOEDaaOD0Myou3jV6okTF3QiabHe+U=;
 b=Rpl3w8NOV8+z3EWUlghuuRsqxunDTXmKfnR8weQSnTrHI+Rwr9AD0BAyeDClYdJGKX
 Ssev7hRioEAxi+LLynk0B8nk3sA+mu2oWLc2vAnCXH4dOBmoDjcBsIhayXGlLyTzRiMt
 RhuzxeqHJQP01QqRrGdboqDG4WE0ximVYrpgf0Y7rQEXcxGScoFVw7LuBC50qtpQbvaV
 BYtx1ordZ4/HHX5U2ANvUb99W2Bk+fK1LPkJTaQzAWITMwkgIKXlYBCZrjnwd0CzL4IM
 1uAe+UW1hD6GxItG1SnPSGrBIBebLlz9tVu40vjzlzECltpLkK8PPfvrjbH8T3gsBCp4
 czuw==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rp
c2NvdmVyeS5oIHwgMTggKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9kaXNjb3ZlcnkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9kaXNj
b3ZlcnkuaAppbmRleCA5M2E4YWUwYWFjZGEuLmUwMWQ0Y2Q5ZjJjYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9kaXNjb3ZlcnkuaApAQCAtMzMsNyArMzMsNyBAQCB0eXBlZGVmIGVudW0K
IHsKIAlJUF9ESVNDT1ZFUlkgPSAwLAogCUdDLAotCVRBQkxFXzMsCisJSEFSVkVTVF9JTkZPLAog
CVRBQkxFXzQsCiAJUkVTRVJWRURfMSwKIAlSRVNFUlZFRF8yLApAQCAtMTQ0LDYgKzE0NCwyMiBA
QCBzdHJ1Y3QgZ2NfaW5mb192MV8wIHsKIAl1aW50MzJfdCBnY19udW1fZ2wyYTsKIH07CiAKK3R5
cGVkZWYgc3RydWN0IGhhcnZlc3RfaW5mb19oZWFkZXIgeworCXVpbnQzMl90IHNpZ25hdHVyZTsg
LyogVGFibGUgU2lnbmF0dXJlICovCisJdWludDMyX3QgdmVyc2lvbjsgICAvKiBUYWJsZSBWZXJz
aW9uICovCit9IGhhcnZlc3RfaW5mb19oZWFkZXI7CisKK3R5cGVkZWYgc3RydWN0IGhhcnZlc3Rf
aW5mbyB7CisJdWludDE2X3QgaHdfaWQ7ICAgICAgICAgIC8qIEhhcmR3YXJlIElEICovCisJdWlu
dDhfdCBudW1iZXJfaW5zdGFuY2U7IC8qIEluc3RhbmNlIG9mIHRoZSBJUCAqLworCXVpbnQ4X3Qg
cmVzZXJ2ZWQ7ICAgICAgICAvKiBSZXNlcnZlZCBmb3IgYWxpZ25tZW50ICovCit9IGhhcnZlc3Rf
aW5mbzsKKwordHlwZWRlZiBzdHJ1Y3QgaGFydmVzdF90YWJsZSB7CisJaGFydmVzdF9pbmZvX2hl
YWRlciBoZWFkZXI7CisJaGFydmVzdF9pbmZvIGxpc3RbMzJdOworfSBoYXJ2ZXN0X3RhYmxlOwor
CiAjcHJhZ21hIHBhY2soKQogCiAjZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
