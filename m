Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4FE48E23
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C9289708;
	Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56B8970B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so12202143qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Lm3t2ajT7q0rdXwWDvruafilecXeRySuoAif0m9Xi8=;
 b=IHB2OsSujOJObhY7p4/RZyA++XZxLezt4I/T1PkD4htwp3SXV7TEJyiQBdUWoa7VWQ
 lA/cV7+/BcQAXE6aya7egX3sg8TwaR2p56XjALIHKNJOjWNr9rhgN+FIKYEjo7SVR2U7
 wUtU7tpqxyLPN8bc6F3oQGUzCFEePwltkTxIs3GCNfqoqSh4WUXrDprUMVnwk3zPU/0L
 K8KarGvLUfDlNwlmEqKW7+68aCORXma0I2sCea+qoHvQlclu7/U9dQNoGPt/xHCJ71vI
 CN/ZdCxBp6i29WLVhPXAtG33y4x0kZurQBXn7nRyUbe+RbrMKCDVzBasLSKjoW6lE80V
 60XQ==
X-Gm-Message-State: APjAAAW3yXf6cY5dc8saYCRM26Dc7D/j3ntIinnzuu6Pc/L65+E3bMgW
 J5QqLYirbUfOovxwoOiYKEZO3qaGPaQ=
X-Google-Smtp-Source: APXvYqyYZMeaX6aGAh7B+4RCxxVEi3RHyJDItQGC0wLUqFwp8qTUekf7+Y+rkv0EVBXXrhsAGu87Gw==
X-Received: by 2002:ac8:5294:: with SMTP id s20mr29678381qtn.279.1560799115537; 
 Mon, 17 Jun 2019 12:18:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 098/459] drm/amdgpu/discovery: fix calculations of some gfx
 info
Date: Mon, 17 Jun 2019 14:10:59 -0500
Message-Id: <20190617191700.17899-87-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Lm3t2ajT7q0rdXwWDvruafilecXeRySuoAif0m9Xi8=;
 b=UysoVxXeNCOA/0gDs/q36csDrc/jDqNFjWz5ZOfMR6ZPOADWDHyHL90s+oaZoup0O9
 HbyEh1FlOH2EDc+hoYDWUvsgduDzbQOIezZUuh+ytOLLgIWeAP+w59EITjVMMMjsK19a
 KAqSEMUsQkazCt9MV418uwT1mAB++96rkBe4BabQBRi+4dR7jhg/+0UXEaIvJ+vvmaU+
 6lAmjVv0iqe/zNnLfIsYI0t0KppFFZXswjRwFCSe8UvVtrlPmS9BEXnHucqkb/t0QayW
 m+mAb/aJfzufX+9IxyCxE68DXFlae+EL7jn4Af2TUBkN/vP9c72CVQuhAjfc9wxo8dBG
 cObA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CkFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwppbmRleCA3YjU4MjczZTJlZDUuLmY2MWViODU0MmM0
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVy
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpA
QCAtMzgxLDggKzM4MSw5IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWxlMTZfdG9fY3B1KGJoZHItPnRhYmxlX2xpc3Rb
R0NdLm9mZnNldCkpOwogCiAJYWRldi0+Z2Z4LmNvbmZpZy5tYXhfc2hhZGVyX2VuZ2luZXMgPSBs
ZTMyX3RvX2NwdShnY19pbmZvLT5nY19udW1fc2UpOwotCWFkZXYtPmdmeC5jb25maWcubWF4X2N1
X3Blcl9zaCA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV93Z3AwX3Blcl9zYSk7Ci0JYWRl
di0+Z2Z4LmNvbmZpZy5tYXhfc2hfcGVyX3NlID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVt
X3dncDFfcGVyX3NhKTsKKwlhZGV2LT5nZnguY29uZmlnLm1heF9jdV9wZXJfc2ggPSAyICogKGxl
MzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV93Z3AwX3Blcl9zYSkgKworCQkJCQkgICAgICBsZTMy
X3RvX2NwdShnY19pbmZvLT5nY19udW1fd2dwMV9wZXJfc2EpKTsKKwlhZGV2LT5nZnguY29uZmln
Lm1heF9zaF9wZXJfc2UgPSBsZTMyX3RvX2NwdShnY19pbmZvLT5nY19udW1fc2FfcGVyX3NlKTsK
IAlhZGV2LT5nZnguY29uZmlnLm1heF9iYWNrZW5kc19wZXJfc2UgPSBsZTMyX3RvX2NwdShnY19p
bmZvLT5nY19udW1fcmJfcGVyX3NlKTsKIAlhZGV2LT5nZnguY29uZmlnLm1heF90ZXh0dXJlX2No
YW5uZWxfY2FjaGVzID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX2dsMmMpOwogCWFkZXYt
PmdmeC5jb25maWcubWF4X2dwcnMgPSBsZTMyX3RvX2NwdShnY19pbmZvLT5nY19udW1fZ3Bycyk7
CkBAIC0zOTQsOCArMzk1LDkgQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2dmeF9pbmZvKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFkZXYtPmdmeC5jdV9pbmZvLm1heF93YXZlc19w
ZXJfc2ltZCA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX21heF93YXZlc19wZXJfc2ltZCk7CiAJ
YWRldi0+Z2Z4LmN1X2luZm8ubWF4X3NjcmF0Y2hfc2xvdHNfcGVyX2N1ID0gbGUzMl90b19jcHUo
Z2NfaW5mby0+Z2NfbWF4X3NjcmF0Y2hfc2xvdHNfcGVyX2N1KTsKIAlhZGV2LT5nZnguY3VfaW5m
by5sZHNfc2l6ZSA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX2xkc19zaXplKTsKLQlhZGV2LT5n
ZnguY29uZmlnLm51bV9zY19wZXJfc2ggPSBsZTMyX3RvX2NwdShnY19pbmZvLT5nY19udW1fc2Nf
cGVyX3NlKTsKLQlhZGV2LT5nZnguY29uZmlnLm51bV9wYWNrZXJfcGVyX3NjID0gbGUzMl90b19j
cHUoZ2NfaW5mby0+Z2NfbnVtX3NhX3Blcl9zZSk7CisJYWRldi0+Z2Z4LmNvbmZpZy5udW1fc2Nf
cGVyX3NoID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX3NjX3Blcl9zZSkgLworCQkJCQkg
bGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX3NhX3Blcl9zZSk7CisJYWRldi0+Z2Z4LmNvbmZp
Zy5udW1fcGFja2VyX3Blcl9zYyA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV9wYWNrZXJf
cGVyX3NjKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
