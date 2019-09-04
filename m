Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649EA85E0
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504ED89C21;
	Wed,  4 Sep 2019 15:02:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6889B0C
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p13so4204173wmh.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUUMgUHkonzpLyqkvoCq4OIZLbQ2JCgh/2takTbj7ak=;
 b=d9y/APbsVwzhoNVrl8UeoHhhvlEjEp625U4s+t8P5g69kFXMw+mwKozuMFi6NTsGF0
 3Oyf8wTKIav5LR5y80NNmL31hUuPY0K/o2GYnzanJsYq2rdSqOPs18kMz26OBr2T8JNu
 XoJpY5AKSSCSxFthvliEzW2xJ67NUStyg1+pBhS0IkOW6Aod+dH/frViR6lzPLV0dK0/
 qZ3Ye5TanJqDOlx3SnVp2wUrnzCa5Hqe9NQKZK4UT6bnJQlmpMTCNT6zegjNd+X5R2e5
 RK/fBZBIkhXorbpXXbz6LByS+jFzSla4QLPUqBanwxkdD/AEc3uqtR93uxyMOeFO0B/b
 WMSA==
X-Gm-Message-State: APjAAAX0Q8b0/xB/KmAh5uYvsO7buhyR+t381P7TUCX3U+JQQPrq0bS8
 eAtKWqqfxqUnLup5tXsS3raLRXH+
X-Google-Smtp-Source: APXvYqyGHM+HmGdnUj0sKaIsu9XAznUyuw2dTBOq+bFdfP7C9kiQDN4wqih0CDOGHVLRqU9emcHd+w==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr4222254wmm.79.1567609361824; 
 Wed, 04 Sep 2019 08:02:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.41
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/amdgpu: reserve the root PD while freeing PASIDs
Date: Wed,  4 Sep 2019 17:02:29 +0200
Message-Id: <20190904150230.13885-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CUUMgUHkonzpLyqkvoCq4OIZLbQ2JCgh/2takTbj7ak=;
 b=uuYaJGr9TdppkHc5U2iUTCUT6l8be1Xjuk/CujWoNPWPLdgteFhbBINHC3OfH5tdBW
 1zaDGsFFhsKjAddaU6WN8OtSeARXwc+h4XqDzxoSXAZ+AxmUWB9sQntWDezUvuPOe8Mc
 C607J6HghUx/xKOyuJM05yv0iYEOFGZiUjsK6oUKdr9WNS9XxaV/eZKTTaha9TzEJV9+
 PJIhXlOiuyOZUSl5NFYlM5RQCrtNVpXf7BlAsxzl9c2G0A5YHouDhaScoq28ludQk484
 I9ZDUWPG4pwwAWXNa6Lmdc/uueoykOU0ZmQauF8cZe+0McXVshAFifgt/N5tqh2Yonyx
 3xkA==
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

RnJlZSB0aGUgcGFzaWQgb25seSB3aGlsZSB0aGUgcm9vdCBQRCBpcyByZXNlcnZlZC4gVGhpcyBw
cmV2ZW50cyB1c2UgYWZ0ZXIKZnJlZSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGluZy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIwICsrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDRjNGMzNDhiMjc1
Mi4uOTUxNjA4ZmMxOTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpA
QCAtMjk2MSwxOCArMjk2MSwyNiBAQCB2b2lkIGFtZGdwdV92bV9maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKIAlzdHJ1Y3QgYW1kZ3B1X2JvX3Zh
X21hcHBpbmcgKm1hcHBpbmcsICp0bXA7CiAJYm9vbCBwcnRfZmluaV9uZWVkZWQgPSAhIWFkZXYt
PmdtYy5nbWNfZnVuY3MtPnNldF9wcnQ7CiAJc3RydWN0IGFtZGdwdV9ibyAqcm9vdDsKLQlpbnQg
aSwgcjsKKwlpbnQgaTsKIAogCWFtZGdwdV9hbWRrZmRfZ3B1dm1fZGVzdHJveV9jYihhZGV2LCB2
bSk7CiAKKwlyb290ID0gYW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5iYXNlLmJvKTsKKwlhbWRncHVf
Ym9fcmVzZXJ2ZShyb290LCB0cnVlKTsKIAlpZiAodm0tPnBhc2lkKSB7CiAJCXVuc2lnbmVkIGxv
bmcgZmxhZ3M7CiAKIAkJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRf
bG9jaywgZmxhZ3MpOwogCQlpZHJfcmVtb3ZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwg
dm0tPnBhc2lkKTsKIAkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5w
YXNpZF9sb2NrLCBmbGFncyk7CisJCXZtLT5wYXNpZCA9IDA7CiAJfQogCisJYW1kZ3B1X3ZtX2Zy
ZWVfcHRzKGFkZXYsIHZtLCBOVUxMKTsKKwlhbWRncHVfYm9fdW5yZXNlcnZlKHJvb3QpOworCWFt
ZGdwdV9ib191bnJlZigmcm9vdCk7CisJV0FSTl9PTih2bS0+cm9vdC5iYXNlLmJvKTsKKwogCWRy
bV9zY2hlZF9lbnRpdHlfZGVzdHJveSgmdm0tPmRpcmVjdCk7CiAJZHJtX3NjaGVkX2VudGl0eV9k
ZXN0cm95KCZ2bS0+ZGVsYXllZCk7CiAKQEAgLTI5OTcsMTYgKzMwMDUsNiBAQCB2b2lkIGFtZGdw
dV92bV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSkKIAkJYW1kZ3B1X3ZtX2ZyZWVfbWFwcGluZyhhZGV2LCB2bSwgbWFwcGluZywgTlVMTCk7CiAJ
fQogCi0Jcm9vdCA9IGFtZGdwdV9ib19yZWYodm0tPnJvb3QuYmFzZS5ibyk7Ci0JciA9IGFtZGdw
dV9ib19yZXNlcnZlKHJvb3QsIHRydWUpOwotCWlmIChyKSB7Ci0JCWRldl9lcnIoYWRldi0+ZGV2
LCAiTGVha2luZyBwYWdlIHRhYmxlcyBiZWNhdXNlIEJPIHJlc2VydmF0aW9uIGZhaWxlZFxuIik7
Ci0JfSBlbHNlIHsKLQkJYW1kZ3B1X3ZtX2ZyZWVfcHRzKGFkZXYsIHZtLCBOVUxMKTsKLQkJYW1k
Z3B1X2JvX3VucmVzZXJ2ZShyb290KTsKLQl9Ci0JYW1kZ3B1X2JvX3VucmVmKCZyb290KTsKLQlX
QVJOX09OKHZtLT5yb290LmJhc2UuYm8pOwogCWRtYV9mZW5jZV9wdXQodm0tPmxhc3RfdXBkYXRl
KTsKIAlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9WTUhVQlM7IGkrKykKIAkJYW1kZ3B1X3Zt
aWRfZnJlZV9yZXNlcnZlZChhZGV2LCB2bSwgaSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
