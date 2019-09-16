Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C7B415B
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 21:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BC86EA69;
	Mon, 16 Sep 2019 19:51:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120D6EA69
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 19:51:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 201so1220926qkd.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 12:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwLZz3n5FLjlWWZqJXcsEkmrjI+6b23SrIiJ9PjfEbY=;
 b=Ml2sJn2iu/+PjYBcYDS79rwLk3KSyVA5tJGtnKRnXTZUFicO5bqyrUhxH8FuBnYJuR
 fYAdmf9Vh83fVLtLzJ3h30C1YNG9ZSRStFj1zwWK5urIdavReBpo76DSJ0W2v/KFu/sH
 tHTr6FA7JQWfoDmbn0TVm5QaY7mcmLni6wRUZcov0BDKnZWW818VkNXWvbTfTT4VTJBt
 dWAZPV/s1tsc4MZJ5WyJ3WQtiEUJ5jUugo6VEC9ZPqSp3K6SZIlIU/F6klU9oeVAOHwJ
 kzQqu78sUuOUH+YU38ZF2UtI0MR8kCjc38BLa1e8NbdJMarGxFif0MdEDGa1u2JOMG4q
 6pGA==
X-Gm-Message-State: APjAAAVDF6NxhnKrWxDs3BuTNT3yBcXNMVbeeXLF1gaEa8omERdsiSUd
 xfThd2CpK307M8d+oVuDiYcOJoAP
X-Google-Smtp-Source: APXvYqwYB9bru2gId1gt+sV8wmHHQ7Q2Kq4Pa58i85HsnqaM+cKryIeaTc5FSoThPn+FV0dSG8Zjaw==
X-Received: by 2002:a37:4a0c:: with SMTP id x12mr1698620qka.23.1568663461274; 
 Mon, 16 Sep 2019 12:51:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id g194sm19171174qke.46.2019.09.16.12.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 12:51:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/ras: use GPU PAGE_SIZE/SHIFT for reserving pages
Date: Mon, 16 Sep 2019 14:50:52 -0500
Message-Id: <20190916195052.29281-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwLZz3n5FLjlWWZqJXcsEkmrjI+6b23SrIiJ9PjfEbY=;
 b=NP6MmwCbvahgO9WApjfrAZ/YXZAWY2zHihkzVLjyIAvN5CzhET/4bQwl6IUCoksgOz
 BXtbxsfdikQ3A+9w1PwS8vCYKc9dmo8ZF5ocVXRlak8FEJMr/MNOs/Z4rJEzfsve8blX
 nOFmOGPEdufZTfFXcGfH1IMxzatE8zzz+F80TMz+vdx7uxgDwSDpJDSeZXAzuEjDVGuC
 iavbdg7AZV0KO3JdQyl/FPJ8ZfWnf/FpMZ6MvvgKNsPd5uW+a1ip6nzHjgiJiQPs6886
 NdsKlNdMkr6m1x/3w3V3tnwc+3vYa4gwrPUmYCaM/9b/RCfC6rEfdw5mqzolAsu0CB+h
 nRdg==
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

V2UgYXJlIHJlc2VydmluZyB2cmFtIHBhZ2VzIHNvIHRoZXkgc2hvdWxkIGJlIGFsaWduZWQgdG8g
dGhlCkdQVSBwYWdlIHNpemUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZmYxZmMw
ODRmZmUxLi4xMzFjNTNmYThlZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKQEAgLTE0MDksNyArMTQwOSw4IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVz
ZXJ2ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7CiAJCWJwID0gZGF0YS0+YnBzW2ldLnJldGly
ZWRfcGFnZTsKIAotCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwg
UEFHRV9TSElGVCwgUEFHRV9TSVpFLAorCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQo
YWRldiwgYnAgPDwgQU1ER1BVX0dQVV9QQUdFX1NISUZULAorCQkJCQkgICAgICAgQU1ER1BVX0dQ
VV9QQUdFX1NJWkUsCiAJCQkJCSAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAogCQkJCQkg
ICAgICAgJmJvLCBOVUxMKSkKIAkJCURSTV9FUlJPUigiUkFTIEVSUk9SOiByZXNlcnZlIHZyYW0g
JWxseCBmYWlsXG4iLCBicCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
