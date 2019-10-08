Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C18D0107
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59106E890;
	Tue,  8 Oct 2019 19:15:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A916E890
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:15:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m61so15840283qte.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGQlndKiNVAQI0q1Wv+8rV6j/mvJNaO4m4mH5M9jfEw=;
 b=IKRUW5LafZZJ9xNvGQ+jheh7+9ZS1vDI5QZSkg7sCu/hgFT0NWJh9UoMXBXD+CqPu5
 NJg+xf+ZkDsQFjVi4M8dFVWu9BPr7a7W+AcusqUW+GY25r5nzb784I4zDKPToVtLvovK
 wmWr7u1L7eAHopyZ8fyn0ZfkOOpe1qeCdzPdxd2ugAu2ulDzxJ3E9+Kf28ubr0IyD9gu
 9+t6Zd8yOXhlMD5Av1+6GAeXqORpxa6ra+ZQWvxWWgYf/b7jxGuUtT7Sc3WaAB5LGAcW
 UNH9DQB7u8qm6Fzy+sOyOU2KPkXhEmG2jje3qi2w6Yh/uXRyDEZ0dtQ7R/S9J+uCGjSf
 S+YQ==
X-Gm-Message-State: APjAAAXDuaS0wQEp89kIKl7+I0L7VeJQ3tXIlLCAZ37HfhN2Tc6G1W6U
 r2CTaW7dFF5flDLqdfrtb2BcgIcx
X-Google-Smtp-Source: APXvYqxGJqhMOkWCa19maVbLAh8fbLIeBtsGYVLJgE1LEFV5ei3ao1cFAk0w4RVOBg9fZJ7xZkzvRA==
X-Received: by 2002:ac8:50c:: with SMTP id u12mr37327988qtg.322.1570562101299; 
 Tue, 08 Oct 2019 12:15:01 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id q49sm13503504qta.60.2019.10.08.12.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:15:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display/dcn2.1: drop unused function
Date: Tue,  8 Oct 2019 14:14:54 -0500
Message-Id: <20191008191454.5257-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGQlndKiNVAQI0q1Wv+8rV6j/mvJNaO4m4mH5M9jfEw=;
 b=rsV7i8rU6Gm9FAQImfIVErhN6sn5s0vYrZtBKKlR+ygJa8sNHm99QWCDtv9Hes4acf
 4Nzb/dy0/TywY6JxfYn6/eyeUuslBxIjSDYKxUkzRe/huaDxWKbbRo6RWmJzNfLbyiXr
 Q4JUe6p2vc8gpbPCyK7fxHBhhN3hMDxWTFCkMnVlVtyMUkfeM8Lyc0aD50PY6jFzAnzb
 bonHjxuvGoOYkCSWSpnFvHiNhlnsxVqz+pBD7UNWNgikm7nI+DMmBUEOoPL9IIcGurhR
 cSI2wgpVPkC1tIiPmNgdYK7iKAGScofnGIDNebaYOyWOh4DnjxaFpd0/xKuTxBBeznuv
 i1Rw==
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

SXQncyB0aGUgc2FtZSBhcyB0aGUgZGNuMi4wIGZ1bmN0aW9uIHdoaWNoIGl0IGFscmVhZHkgdXNl
cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UuYyB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNl
LmMKaW5kZXggZDJmYzYxNDkwMDUyLi45YTY3MDE2OThmYWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCkBAIC0xMzUy
LDE0ICsxMzUyLDYgQEAgc3RhdGljIHN0cnVjdCBwcF9zbXVfZnVuY3MgKmRjbjIxX3BwX3NtdV9j
cmVhdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCkKIAlyZXR1cm4gcHBfc211OwogfQogCi1zdGF0
aWMgdm9pZCBkY24yMV9wcF9zbXVfZGVzdHJveShzdHJ1Y3QgcHBfc211X2Z1bmNzICoqcHBfc211
KQotewotCWlmIChwcF9zbXUgJiYgKnBwX3NtdSkgewotCQlrZnJlZSgqcHBfc211KTsKLQkJKnBw
X3NtdSA9IE5VTEw7Ci0JfQotfQotCiBzdGF0aWMgc3RydWN0IGF1ZGlvICpkY24yMV9jcmVhdGVf
YXVkaW8oCiAJCXN0cnVjdCBkY19jb250ZXh0ICpjdHgsIHVuc2lnbmVkIGludCBpbnN0KQogewot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
