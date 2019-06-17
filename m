Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18348E85
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DC6897FB;
	Mon, 17 Jun 2019 19:27:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0711897FB
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:13 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id m29so12246771qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4m7B8JYBXOSPvjOEDaaOD0Myou3jV6okTF3QiabHe+U=;
 b=S5XQdtzebEThCn51hdBc4FMWarjzOFlicKV3l8pTA9Av0gq99apA1Rj7HKuVy08KkA
 aPgUX1MonnBP99DYNJp3DJy+/dgXX3LJ22PEnoedergpAbYuqol89swCdnOZRMKSiHWQ
 OEDv0+aUCKNln7fjfsKWg//ceyp9jwsLy0/bfDUi4fNNXbYnuqziMm/XKz3NSw/oiaRe
 AATJER5+4SVoQmCfCQh2NlZ1XAn9XrR4bgIjLue/cnaALfxxeiPUwx7da6Ur/va+Xyqu
 sUeHB96aTa5t5MZqAwBBNQHmC/aB1P3Ep3YHj6IBF0Bwas14ebRaXnRZbdWfLUT+Tsdi
 fknQ==
X-Gm-Message-State: APjAAAV0Z6TrMvChEhvjtzlFPIwAaxgNyKIpvSbXU+hQVjSsKNO8kQBR
 tQMCFSX5jYZ7YpnnyC4gpI65go2XvvU=
X-Google-Smtp-Source: APXvYqzn3Zb2LrbNaY3xGq5sxyH9AIwMmdo9UWRujOG1jTOJzyPEW/fsbJnhbhRA2zPxNX3iEV7piw==
X-Received: by 2002:ac8:374b:: with SMTP id p11mr93019506qtb.316.1560799632911; 
 Mon, 17 Jun 2019 12:27:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 100/459] drm/amdgpu/discovery: add harvest info data table
Date: Mon, 17 Jun 2019 14:25:25 -0500
Message-Id: <20190617192704.18038-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4m7B8JYBXOSPvjOEDaaOD0Myou3jV6okTF3QiabHe+U=;
 b=DshEAagAjrbSV0EJ6RgMmjpFXqJMMVF7JokVKeK8Rky4m/XZ6fIdSq2ycm0/ROiB+4
 V02d7ZEP1jq1egEWMBQeHzReTNa/WEH3/OP42HSpYW51vNXX2yXs69R/asYAyojHTaWo
 NhDgDzSp1anFcgzWYWcE2eYLMNTXW2sFd81bP6WU1WgI6etPt5FaPyXuAmaSanuA3i/x
 FpLK0pXX58W+eSLNeyo5MG/CKhaRCmXyX+1hrgrw+MevJ7Ti0PREGM4UfNCopqQRELVD
 MpnOO71VcClsHZjdpkT4U7X2PmVrgeFBuuVqWGLIHlHw1JmVMBicffs5zEEyUQfnwC4w
 BMkw==
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
