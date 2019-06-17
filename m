Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D852C485DA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2ED892BB;
	Mon, 17 Jun 2019 14:45:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B635892BB
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 14:45:10 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so6287408qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 07:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YiQA47Krasijo0+ZtBPzY5mYLwYB6d0Gb0bO+5vYpNI=;
 b=JFVMxE5gY117fwmcZhE6WLVoUsQ+qs61w3q+XH6BS3EiwSORqb9HiR+vHtcmiMHxld
 55XnGEBwGdp/JCSIoQI2xdd7NUYO4ldCEG3IDF5KXPjFSabT1gylXxpC1naf20b9VLB7
 EmqBT0OCR0MzmEllAG1wwR+obZukH/JYWxwwNl5CQEWqxIWQk5SIZZ60ARykIGhI/d9E
 Wb2tv5Fk7SX7hCXeOTs6MpYW+JRZnvYmoK8ooeoS+YU0nFjANPQXySgmhoM3Tx+sGluo
 VWLiuWaIBL76qOsWkqN8hyLkeajgRPgllj/0uhhINlrstDJb4Qxwy1XHqg95Wmmiu8MS
 nWZw==
X-Gm-Message-State: APjAAAUDrTCgbSV4bl0Sw3dtAbvBpiz9fubHKYdyi7KlpRnQUsh/VsFd
 MysfH8gDHVUFk9JS+A3wGB7PRh77x74=
X-Google-Smtp-Source: APXvYqzenTIFQC5E/YoymBCuBcynaLwG43jwPuS7v3tYvlO1tIUjH3j+l4q6WQL0k8eSF5dWsuRSgg==
X-Received: by 2002:a05:620a:1107:: with SMTP id
 o7mr57705826qkk.324.1560782708875; 
 Mon, 17 Jun 2019 07:45:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id e52sm2105240qtk.20.2019.06.17.07.45.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:45:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: wait to fetch the vbios until after common init
Date: Mon, 17 Jun 2019 09:45:00 -0500
Message-Id: <20190617144500.29491-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YiQA47Krasijo0+ZtBPzY5mYLwYB6d0Gb0bO+5vYpNI=;
 b=YtJUKftE3mZHF3n6Mrb3O3n2ffs7UaQyJHD5ytb0SlLg6WARj6fW1cZoPdZo7K7zmR
 rz8UeJ3N4F0rnEiOdQVvLCme6kKplKqOsSTurUkqYPjIGEn7g5ycrjfv9PlG4X7KPr9G
 kkGVL7FBBUesosxsCFjYq8Zt/ZHsktaEsxBPapwwB9KxTVLaei1pyfVi4VEpg6nYbabt
 F2MSsdtqk60XLwNzA0YsV3fGVPyWC+JjVHBjE2cZ0lVVn10vrqV74N+HND/iNsqo8X8v
 PYLVattayl4zIJGjs5dWFE42WQx7bFC3le5ldUb3GKsVPNoTUJeLk5OXnBWkSzB0hc8P
 T4qQ==
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

V2UgbmVlZCB0aGUgYXNpY19mdW5jcyBzZXQgZm9yIHRoZSBnZXQgcm9tIGNhbGxiYWNrcyBpbiBz
b21lCmNhc2VzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKaW5kZXggNGE4MzZkYjEwMDBmLi5lMjYzMDNiYzU2N2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE1MzQsMTcgKzE1MzQsNiBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQogCQlhZGV2LT5wbS5wcF9m
ZWF0dXJlICY9IH5QUF9HRlhPRkZfTUFTSzsKIAotCS8qIFJlYWQgQklPUyAqLwotCWlmICghYW1k
Z3B1X2dldF9iaW9zKGFkZXYpKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCXIgPSBhbWRncHVfYXRv
bWJpb3NfaW5pdChhZGV2KTsKLQlpZiAocikgewotCQlkZXZfZXJyKGFkZXYtPmRldiwgImFtZGdw
dV9hdG9tYmlvc19pbml0IGZhaWxlZFxuIik7Ci0JCWFtZGdwdV92Zl9lcnJvcl9wdXQoYWRldiwg
QU1ER0lNX0VSUk9SX1ZGX0FUT01CSU9TX0lOSVRfRkFJTCwgMCwgMCk7Ci0JCXJldHVybiByOwot
CX0KLQogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1faXBfYmxvY2tzOyBpKyspIHsKIAkJaWYg
KChhbWRncHVfaXBfYmxvY2tfbWFzayAmICgxIDw8IGkpKSA9PSAwKSB7CiAJCQlEUk1fRVJST1Io
ImRpc2FibGVkIGlwIGJsb2NrOiAlZCA8JXM+XG4iLApAQCAtMTU2Niw2ICsxNTU1LDE5IEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCQkJCWFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMudmFsaWQgPSB0cnVlOwogCQkJ
fQogCQl9CisJCS8qIGdldCB0aGUgdmJpb3MgYWZ0ZXIgdGhlIGFzaWNfZnVuY3MgYXJlIHNldCB1
cCAqLworCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQX0JM
T0NLX1RZUEVfQ09NTU9OKSB7CisJCQkvKiBSZWFkIEJJT1MgKi8KKwkJCWlmICghYW1kZ3B1X2dl
dF9iaW9zKGFkZXYpKQorCQkJCXJldHVybiAtRUlOVkFMOworCisJCQlyID0gYW1kZ3B1X2F0b21i
aW9zX2luaXQoYWRldik7CisJCQlpZiAocikgeworCQkJCWRldl9lcnIoYWRldi0+ZGV2LCAiYW1k
Z3B1X2F0b21iaW9zX2luaXQgZmFpbGVkXG4iKTsKKwkJCQlhbWRncHVfdmZfZXJyb3JfcHV0KGFk
ZXYsIEFNREdJTV9FUlJPUl9WRl9BVE9NQklPU19JTklUX0ZBSUwsIDAsIDApOworCQkJCXJldHVy
biByOworCQkJfQorCQl9CiAJfQogCiAJYWRldi0+Y2dfZmxhZ3MgJj0gYW1kZ3B1X2NnX21hc2s7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
