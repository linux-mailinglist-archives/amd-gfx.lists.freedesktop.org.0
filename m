Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF5902CD
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 15:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDE06E3C9;
	Fri, 16 Aug 2019 13:21:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9E6E3C9
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 13:21:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t16so1531276wra.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqZeIaqDq3AtsqgMHpnbbJqsEh2rdB2mt4AoKqu7Xto=;
 b=CBDdJ3U4t1viJR5mxjBFwA1aO9s5bJVxbB3FNZhG5bNnKyzVL0g8L6dHhwOHOq1xXv
 7ZzjnNIg3ZNfcLYu+iMkiq3mk65TqaqcXxlVhBgjrG/hujqVZKGZh3eczgye89CH6KVT
 QLv2KOf43EX91CYOobwhpIjoaN230geAgBx7ZtdtNXhJq4dwi92LBQ3NgNqEKE5K4o0d
 v9yTgwx9JYbFm2sqjMfgvhJkkD2Oxh8Xk9M7wk0VOUnaau1w5CKKtX9Dm0xe75XojMR3
 IR+Jl5TB2p9g0dhu5HWUpUX7qii4nLtj1G5FZrBkgYCjk8YYUcAPiYdOxpgWNg8vfrHT
 nivA==
X-Gm-Message-State: APjAAAUOADYbWQlAINR0W1Id68l1I4ewZvy2bWhIMvhWswkvHO4FKg4T
 fjFgB1MYvaVWJmZTusf//83rh8GZ
X-Google-Smtp-Source: APXvYqxgzGYQywnNO56Xv5I7/SmUzoE7zSzsWZq00hegr/7P4OPdqx6urNhhMawkOgOk+RPxOWlufQ==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr10994422wrn.311.1565961693447; 
 Fri, 16 Aug 2019 06:21:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:2cfc:41c1:8b3e:90f5])
 by smtp.gmail.com with ESMTPSA id q124sm5451958wma.33.2019.08.16.06.21.32
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 06:21:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix dma_fence_wait without reference
Date: Fri, 16 Aug 2019 15:21:31 +0200
Message-Id: <20190816132131.1951-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqZeIaqDq3AtsqgMHpnbbJqsEh2rdB2mt4AoKqu7Xto=;
 b=qy4djfo1APXpt8c0211LPvBIAqOS7l/3Ax/kV5+VZgVD3482aArYF6xex/VteneAa3
 gKq9Dj8UOumA2zKrQVqvdJ9tec0S7nG+H6ikeK1Jt8j9GsH5xJhVdpHFiZXykUaXLP9Y
 NT9ioZAnBdCgUH8v/KVn52azj6StxS2JRgemFkbQyamRMOu/jOfBAzql4kA226vcPPV0
 U+vsaaqZsu0ePXxIrizTchClqfNPYOzm2fg1IMlgwmQ8OvA4DHihdy6RYOD7iLiwmhLz
 9uvY0ApcdODwmSQgwJK/d3F6CgYaukh0lqbz7xwzcA5gA4395OpMTk8HyE5zjisNjiP6
 mS8w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBncmFiIGEgcmVmZXJlbmNlIHRvIHRoZSBmZW5jZSB3ZSB3YWl0IGZvci4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgfCAyNyArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2N0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCmluZGV4
IGY1MzlhMmE5Mjc3NC4uNzM5OGI0ODUwNjQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2N0eC5jCkBAIC01MzQsMjEgKzUzNCwyNCBAQCBpbnQgYW1kZ3B1X2N0eF93YWl0X3By
ZXZfZmVuY2Uoc3RydWN0IGFtZGdwdV9jdHggKmN0eCwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX3Nj
aGVkX2VudGl0eSAqZW50aXR5KQogewogCXN0cnVjdCBhbWRncHVfY3R4X2VudGl0eSAqY2VudGl0
eSA9IHRvX2FtZGdwdV9jdHhfZW50aXR5KGVudGl0eSk7Ci0JdW5zaWduZWQgaWR4ID0gY2VudGl0
eS0+c2VxdWVuY2UgJiAoYW1kZ3B1X3NjaGVkX2pvYnMgLSAxKTsKLQlzdHJ1Y3QgZG1hX2ZlbmNl
ICpvdGhlciA9IGNlbnRpdHktPmZlbmNlc1tpZHhdOworCXN0cnVjdCBkbWFfZmVuY2UgKm90aGVy
OworCXVuc2lnbmVkIGlkeDsKKwlsb25nIHI7CiAKLQlpZiAob3RoZXIpIHsKLQkJc2lnbmVkIGxv
bmcgcjsKLQkJciA9IGRtYV9mZW5jZV93YWl0KG90aGVyLCB0cnVlKTsKLQkJaWYgKHIgPCAwKSB7
Ci0JCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpCi0JCQkJRFJNX0VSUk9SKCJFcnJvciAoJWxkKSB3
YWl0aW5nIGZvciBmZW5jZSFcbiIsIHIpOworCXNwaW5fbG9jaygmY3R4LT5yaW5nX2xvY2spOwor
CWlkeCA9IGNlbnRpdHktPnNlcXVlbmNlICYgKGFtZGdwdV9zY2hlZF9qb2JzIC0gMSk7CisJb3Ro
ZXIgPSBkbWFfZmVuY2VfZ2V0KGNlbnRpdHktPmZlbmNlc1tpZHhdKTsKKwlzcGluX3VubG9jaygm
Y3R4LT5yaW5nX2xvY2spOwogCi0JCQlyZXR1cm4gcjsKLQkJfQotCX0KKwlpZiAoIW90aGVyKQor
CQlyZXR1cm4gMDsKIAotCXJldHVybiAwOworCXIgPSBkbWFfZmVuY2Vfd2FpdChvdGhlciwgdHJ1
ZSk7CisJaWYgKHIgPCAwICYmIHIgIT0gLUVSRVNUQVJUU1lTKQorCQlEUk1fRVJST1IoIkVycm9y
ICglbGQpIHdhaXRpbmcgZm9yIGZlbmNlIVxuIiwgcik7CisKKwlkbWFfZmVuY2VfcHV0KG90aGVy
KTsKKwlyZXR1cm4gcjsKIH0KIAogdm9pZCBhbWRncHVfY3R4X21ncl9pbml0KHN0cnVjdCBhbWRn
cHVfY3R4X21nciAqbWdyKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
