Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6F71961
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 15:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBCA6E221;
	Tue, 23 Jul 2019 13:36:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6F6E2B0;
 Tue, 23 Jul 2019 09:05:12 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o13so19087951pgp.12;
 Tue, 23 Jul 2019 02:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0Po2t8vMBWo5yX2pfDsLkHP1u5XK6Mx9PkT5fdjYG8=;
 b=VKVcV8avdEVsU/lEJMjn+u4MMRzyh3f+k0yYVcCH/XNnjyaXdNCRAAPsNMlSHnbK1/
 lEXpOp3ApTLtRYBSF8NlEZF+tzACSLGXRU0cdeMMbW/W9+t1cwpu2m1QvqHEu/Qt++jo
 AbuvFgzgor5TPmrwqxi1Zp6fEHUXtNI846uKjmp3zGNivO/XTf6J58ilfovniZd/K3xs
 jwZqc5ql993971hR0U1Wu8dAA4pTm7uSfQrcdggxf7SD+uOsGlqcOrBSeF5Pk3OClRZl
 HrA8C5jo4lxSQyy6+UsqbWgYUgGDwh0VdcDlnCQBqgASyTkfK4DmWvxCS1AM+85scil7
 /oeQ==
X-Gm-Message-State: APjAAAV0eMCRu4dudwJ0QQphoe19lsq2ZghebpFObZHH+fPOV64xN3fS
 iXvmQV71y4TrtqFiaVuKXUA=
X-Google-Smtp-Source: APXvYqzi1VipkVfIiCMuWUb3kwhiy44hGn3bRykz918gKVbkMtrrfz4oVJGquFgJUXOaZXK2Re9/YA==
X-Received: by 2002:a17:90a:1b48:: with SMTP id
 q66mr77930931pjq.83.1563872711763; 
 Tue, 23 Jul 2019 02:05:11 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id d23sm33574749pjv.18.2019.07.23.02.05.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 02:05:11 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/amdgpu: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 17:04:50 +0800
Message-Id: <20190723090449.27589-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 13:36:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0Po2t8vMBWo5yX2pfDsLkHP1u5XK6Mx9PkT5fdjYG8=;
 b=GM2uf2W7Igd9e55i5i0eZpV6eTP1FWB9O+BRMOE0iuMwen2uXvQUaOHmQLSn8Sqa1f
 YZtRbIoKEIHQN0n8QZ1Q2gjDf2+82vkQkxZcYj7ZQJ3nW2llVA9dDQ/8U+5pS9tfhjq/
 nI24gEItIF+najDQu2Z5a1Jm/O7JcBA10Q+6XCcgVuCawTajiDg5d1Yr5POBhgqWa/4l
 5U7ngGWsjI2gaf5+czBFW8b+8Y0+kh8vRdJgNGWykRJNm42fbmx2tyxft1BG/xME6a1c
 jiDfFyC9YTsz4jP9frqZa9fSwrZH+m4iCyi6OmmCANTA3/S0bceQlWhX8ZtO4afBKVj3
 PGuw==
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
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgfCAyNyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IGYyZThiNDIzOGVmZC4uZGY4MjA5MWEyOWQzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMDk3LDE2ICsxMDk3
LDE0IEBAIGFtZGdwdV9wY2lfc2h1dGRvd24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAKIHN0YXRp
YyBpbnQgYW1kZ3B1X3Btb3BzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpk
cm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
X2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlyZXR1cm4gYW1kZ3B1X2RldmljZV9zdXNw
ZW5kKGRybV9kZXYsIHRydWUsIHRydWUpOwogfQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9f
cGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZk
YXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRh
KGRldik7CiAKIAkvKiBHUFUgY29tZXMgdXAgZW5hYmxlZCBieSB0aGUgYmlvcyBvbiByZXN1bWUg
Ki8KIAlpZiAoYW1kZ3B1X2RldmljZV9pc19weChkcm1fZGV2KSkgewpAQCAtMTEyMCwzMyArMTEx
OCwyOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19mcmVlemUoc3RydWN0IGRldmljZSAqZGV2KQog
ewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCi0Jc3RydWN0IGRy
bV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9k
ZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwogCXJldHVybiBhbWRncHVf
ZGV2aWNlX3N1c3BlbmQoZHJtX2RldiwgZmFsc2UsIHRydWUpOwogfQogCiBzdGF0aWMgaW50IGFt
ZGdwdV9wbW9wc190aGF3KHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAq
cGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKLQotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0g
cGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7CisKIAlyZXR1cm4gYW1kZ3B1X2RldmljZV9yZXN1bWUoZHJtX2Rl
diwgZmFsc2UsIHRydWUpOwogfQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19wb3dlcm9mZihz
dHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2
KGRldik7Ci0KLQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShw
ZGV2KTsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OworCiAJcmV0dXJuIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChkcm1fZGV2LCB0cnVlLCB0cnVlKTsK
IH0KIAogc3RhdGljIGludCBhbWRncHVfcG1vcHNfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7CisJc3RydWN0IGRy
bV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAotCXN0cnVjdCBkcm1f
ZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwogCXJldHVybiBhbWRncHVf
ZGV2aWNlX3Jlc3VtZShkcm1fZGV2LCBmYWxzZSwgdHJ1ZSk7CiB9CiAKQEAgLTEyMDUsOCArMTE5
OSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKIAogc3RhdGljIGludCBhbWRncHVfcG1vcHNfcnVudGltZV9pZGxlKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
LQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVj
dCBkcm1fY3J0YyAqY3J0YzsKIAogCWlmICghYW1kZ3B1X2RldmljZV9pc19weChkcm1fZGV2KSkg
ewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
