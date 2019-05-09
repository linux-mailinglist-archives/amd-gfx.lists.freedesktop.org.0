Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C0318BA5
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 16:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4589C5E;
	Thu,  9 May 2019 14:23:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957089C5E
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 14:23:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k24so1929964qtq.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 07:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79JFa4BYwleesTeFSDu8nvs9Kefw+Xdnp4x6cDwaxmo=;
 b=tXsVfB/QAoCg9wceugzhKPnfBN4wt9w+WUIbH/1xfNmhIgz+Y1JknbWhvNV1OWgujL
 h3HyZPa5ccd9ZRRoPHEkPp4Yz8S34wKJHskQliDDuBU0LGHuSi4a5vnxyKBBLPQQUp11
 kBJFsBeuSSqEFqa3CKEDJei+sUDi5Xuu64HXTJPNdsmk59kAGNss40q3UiRHV1aJtUmR
 m9nB9oFSzxmtK+HOi6oXbSAkyGJjH3syQZT3B5FZe7Y3GS12Tcya+1aJ+veUWcEs1k7E
 hXw0MF6fJKyaz1o4IwIHhTN0qD1BLRL0c5aXyHKDRKtTxJmj4ep0ZjIj3ep9wBofcuJk
 ICGQ==
X-Gm-Message-State: APjAAAWlMej57ZpoyYaU6SPnZxzG/zFinbWNnamgNlb+y71+pqwQBOUP
 SuA2iUTZ3jAiJuhoyOatt6Y1UWNwKL4=
X-Google-Smtp-Source: APXvYqxHM2jhOdlffqXmYLnK+Td8HvtVKCB+2YdQGJ+6pYzU5BXuNp8nK/9HxfQt+7uobyWcL1GQVg==
X-Received: by 2002:ac8:53d9:: with SMTP id c25mr4027215qtq.276.1557411822198; 
 Thu, 09 May 2019 07:23:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id d41sm1244404qta.22.2019.05.09.07.23.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 09 May 2019 07:23:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/psp: move psp version specific function pointers
 to early_init
Date: Thu,  9 May 2019 09:23:34 -0500
Message-Id: <20190509142334.24760-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79JFa4BYwleesTeFSDu8nvs9Kefw+Xdnp4x6cDwaxmo=;
 b=KKcu2wcQKC7U2JlCgqtub7DyuAkIxLKaSAyZZU2wx9HOqyn2Tpq7U8ruYVqivanVkm
 djefkUZ+bjTtUGceQSlShn6jyuEp9Qv7qPXYY7LPEbj6c/dQX/EDxqWqYtUVSHLxgtUL
 M9Bc5tlkkRkiWiarq2dRmQRDU5JjruD6Nc9PZHdkGlz2nI5mBhsR2hUbZI2G/5z+VTlc
 iLwU22YyXXj1ne9PfTkWPc0k8Z0GLEJVQmZYdHP9CLMgYc99+HCw50SWh5PunQsWVYKv
 N1XJWPYkZZLm4iK9Cx19HKkenG0lNxeQreqw9YuopxnPjIORe6QfLphW/+49DqCr8g22
 cfCg==
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

SW4gY2FzZSB3ZSBuZWVkIHRvIHVzZSB0aGVtIGZvciBHUFUgcmVzZXQgcHJpb3IgaW5pdGlhbGl6
aW5nIHRoZQphc2ljLiAgRml4ZXMgYSBjcmFzaCBpZiB0aGUgZHJpdmVyIGF0dGVtcHRzIHRvIHJl
c2V0IHRoZSBHUFUgYXQgZHJpdmVyCmxvYWQgdGltZS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXggOTA1Y2NlMTgxNGYzLi4wNTg5N2IwNTc2NmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTM4LDE4ICszOCwxMCBA
QCBzdGF0aWMgdm9pZCBwc3Bfc2V0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
IHN0YXRpYyBpbnQgcHNwX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOworCXN0cnVj
dCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsKIAogCXBzcF9zZXRfZnVuY3MoYWRldik7
CiAKLQlyZXR1cm4gMDsKLX0KLQotc3RhdGljIGludCBwc3Bfc3dfaW5pdCh2b2lkICpoYW5kbGUp
Ci17Ci0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7Ci0Jc3RydWN0IHBzcF9jb250ZXh0ICpwc3AgPSAmYWRldi0+cHNwOwotCWludCBy
ZXQ7Ci0KIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9WRUdBMTA6CiAJ
Y2FzZSBDSElQX1ZFR0ExMjoKQEAgLTY3LDYgKzU5LDE1IEBAIHN0YXRpYyBpbnQgcHNwX3N3X2lu
aXQodm9pZCAqaGFuZGxlKQogCiAJcHNwLT5hZGV2ID0gYWRldjsKIAorCXJldHVybiAwOworfQor
CitzdGF0aWMgaW50IHBzcF9zd19pbml0KHZvaWQgKmhhbmRsZSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKKwlzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCA9ICZhZGV2LT5wc3A7CisJaW50IHJldDsKKwogCXJldCA9IHBzcF9p
bml0X21pY3JvY29kZShwc3ApOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
bG9hZCBwc3AgZmlybXdhcmUhXG4iKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
