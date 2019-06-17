Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23A48F55
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A873B89C19;
	Mon, 17 Jun 2019 19:31:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFD89BBE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:35 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c11so6945255qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cy6KRABPWe/rieKTUAxvYADAJiLgrZixlOzrgMnFTGU=;
 b=UsgAjE053asDf2/dxy/xvOf73Y6V3h+UmJUn5hxJHGA5Q0+EFSByj160bQfQy4c2+a
 vLPW9euQX+qS9Fkm/BsGm6lUHnvdtTx7/VBy6Unb4H9FLKYXLYxevsAniyf5NQzLsqpU
 g8ipp2WTgWzgXm0fCmhAriccx5QASvZyGvmUSMAJxilUCRwQRVg5elKUGEL+rAwlJ4Pn
 895Anq5HqkJ62iKxPxbMf5UJSRyvNfVyMnxkwGhkCRMQzCy+v4oeQTzaRMJvbbW30vGI
 ste7wryW7yzhZYlyneBYFEqH5LFaqCEyAIhyIYLj4ylfkEBG32UXQ4d+79wlYI1i76GE
 hJTQ==
X-Gm-Message-State: APjAAAWIJTYVC5X504HN8oBgsvZV1fBBXWLnaiJB0ge3E2INlHtl2cRD
 Mpe+2jT5fUPkpXrGrSzxl14EgaBvpFs=
X-Google-Smtp-Source: APXvYqxw42QF2onaBOZj1QXO/YYvtXlGDT561UR795r87RrhYweBiT7SeDIiArkzATTezawMpbODlw==
X-Received: by 2002:ae9:de83:: with SMTP id
 s125mr32776655qkf.115.1560799894955; 
 Mon, 17 Jun 2019 12:31:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 224/459] drm/amdgpu: RLC must be disabled after SMU when S3 on
 navi
Date: Mon, 17 Jun 2019 14:29:51 -0500
Message-Id: <20190617193106.18231-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cy6KRABPWe/rieKTUAxvYADAJiLgrZixlOzrgMnFTGU=;
 b=pke3zHb27Fe2SBtghwe+mvihLgQpq2fujKovzQJS1PH+zTUoZMKMiSyrx6zAn9JqcN
 VwMP7zEqFBMpee1R3a9j+rfFsuHq7YpC1dWW7X8zzjk5B7NS+kt2s8L92xLQV4mVi7p7
 VTGeNSuzJSXW9MtRsz66ZrxjwR2wmGu7lOqxrXfKJ5YySY4WX4LJdCjWF4VJA79Nc3zX
 LgU71AO0SbB33IOXJD6kYD7EL5SHZCMikZJHwuoon5rmHcEd1UruhYkTVo5JK6QwSBZ0
 iyWIyRkzyOl4Qi39BQUx0qNPZJwk4vFMfDRgoKewLT3iLY4B+aN3x8RB+pwMtkxvoWyj
 rY/Q==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClNNVSByZXF1aXJlcyB0byBpbnRl
cmFjdCB3aXRoIFJMQyB3aGVuIGRpc2FibGUgYWxsIGZlYXR1cmVzLApzbyBSTEMgc2hvdWxkbid0
IGJlIGRpc2FibGVkIGFoZWFkIG9mIFNNVS4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFj
ay5YaWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgICAg
fCA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQg
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA3MTY0NjczODhjMmQuLjI2
MmM0MDA0OTM5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE1
OTYsOCArMTU5Niw2IEBAIHZvaWQgZ2Z4X3YxMF8wX3JsY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFJMQ19DTlRMLCBSTENfRU5B
QkxFX0YzMiwgMCk7CiAJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19DTlRMLCB0bXApOwotCi0J
Z2Z4X3YxMF8wX2VuYWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQoYWRldiwgZmFsc2UpOwogfQogCiBz
dGF0aWMgdm9pZCBnZnhfdjEwXzBfcmxjX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQpAQCAtMzYzMCw3ICszNjI4LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfaHdfZmluaSh2b2lk
ICpoYW5kbGUpCiAJCXJldHVybiAwOwogCX0KIAlnZnhfdjEwXzBfY3BfZW5hYmxlKGFkZXYsIGZh
bHNlKTsKLQlnZnhfdjEwXzBfcmxjX3N0b3AoYWRldik7CisJZ2Z4X3YxMF8wX2VuYWJsZV9ndWlf
aWRsZV9pbnRlcnJ1cHQoYWRldiwgZmFsc2UpOwogCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNjUyOTYzZTUyYTVhLi4yMWE0
N2QwOGQ3MDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
QEAgLTk0Myw2ICs5NDMsMTAgQEAgc3RhdGljIGludCBzbXVfc3VzcGVuZCh2b2lkICpoYW5kbGUp
CiAKIAlzbXUtPndhdGVybWFya3NfYml0bWFwICY9IH4oV0FURVJNQVJLU19MT0FERUQpOwogCisJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCAmJgorCSAgICBhZGV2LT5nZngucmxj
LmZ1bmNzLT5zdG9wKQorCQlhZGV2LT5nZngucmxjLmZ1bmNzLT5zdG9wKGFkZXYpOworCiAJcmV0
dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
