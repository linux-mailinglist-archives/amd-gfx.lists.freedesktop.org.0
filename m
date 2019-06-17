Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C348EFB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2452389B30;
	Mon, 17 Jun 2019 19:28:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566189B20
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so12258012qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yz2FhyZFseDcG9A64fSL0bm7oBYlEl4TQICnSMlgnWg=;
 b=DWHUmjDt3uP7OWRqBtb6Djy3LYi0xwYvarPl/kgfj2ux0vYQCk3LzN0+lK3ILV48u4
 ho5cGifcfQC6wCvywPW9rE3bPFgg7L33mhTCsO0m6SoAnRJa62VpxjmNzhl3XNB/y4bC
 /v3HEt68chXc+VNBuPVniJMhwg+HB2hAyW2tjiM82/dbTUAlAdXUv68JCLd/LR1K9+de
 6emY5Pu5za1umTpx6+uFLfGwN3EH4FPJfZyACwacELBCU52Z3K7aLGFrGvZpeS8EgpOW
 +HFzDF1N4tlvbe+aeznVi11sNP4fe7KuWaacKha32H2qf7uSASO0ecwQSjNrRpyg83cd
 dQOA==
X-Gm-Message-State: APjAAAWzRossXzMSJLpYDmseOPvsuxJcaaEYd7NaIYvXZzIVHp+Eu3Bd
 81fRZUpN+7/9+DQIVZ6ObGK5MmvPEzc=
X-Google-Smtp-Source: APXvYqwDeCbRj/i/ERYO8UeCsvb91mD6DSyDqk0zVEjIWrn29UPmeHGx1Qz/gKdVtsIPGZv9FvTANg==
X-Received: by 2002:ac8:488f:: with SMTP id i15mr71111972qtq.32.1560799716240; 
 Mon, 17 Jun 2019 12:28:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 190/459] drm/amdgpu/gfx10: fix resume failure when enabling
 async gfx ring
Date: Mon, 17 Jun 2019 14:26:55 -0500
Message-Id: <20190617192704.18038-91-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yz2FhyZFseDcG9A64fSL0bm7oBYlEl4TQICnSMlgnWg=;
 b=hHL5muBkW3jLTJciXHWHGuTXeGqqPSUk7ARBH4Gd/x0ihcq5cF6tbxYIjmJdvTubqI
 fD0eLbgn4fC+wfSwXAQ9ZB3wzFavLOIS+1Z/PzRFEhamM5nkpP4s+jFeBsDU9GU4z4Mk
 Vn4BPUPGkMxjkNhpTteboY66PpgQZL5NPJSJ2XrLVQLgg0CBZOqVGf7QckRSJPaSNMY1
 suRDozpzB6ys281xCT7xPAvaERhCEgJGy4NsegcV5P4bEWL63e9amXljCGsr+7DXT01B
 EB6P0Dqv+Gcr25z8yAF6IH15LFykOF9322IlAjq97HtIrZERhw47cpG7BDxmqCeyPwUp
 LuNA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCidhZGV2LT5pbl9zdXNw
ZW5kJyBjb2RlIHBhdGggaXMgbWlzc2luZyBpbiBnZnhfdjEwXzBfZ2Z4X2luaXRfcXVldWUoKQoK
U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMjYgKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDRlN2Y2NGQ5MWQxMi4u
OWQxNjJkMjY5YWNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAt
MjkwMyw3ICsyOTAzLDE5IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2dmeF9pbml0X3F1ZXVlKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJp
bmctPmFkZXY7CiAJc3RydWN0IHYxMF9nZnhfbXFkICptcWQgPSByaW5nLT5tcWRfcHRyOwogCi0J
aWYgKGFkZXYtPmluX2dwdV9yZXNldCkgeworCWlmICghYWRldi0+aW5fZ3B1X3Jlc2V0ICYmICFh
ZGV2LT5pbl9zdXNwZW5kKSB7CisJCW1lbXNldCgodm9pZCAqKW1xZCwgMCwgc2l6ZW9mKCptcWQp
KTsKKwkJbXV0ZXhfbG9jaygmYWRldi0+c3JibV9tdXRleCk7CisJCW52X2dyYm1fc2VsZWN0KGFk
ZXYsIHJpbmctPm1lLCByaW5nLT5waXBlLCByaW5nLT5xdWV1ZSwgMCk7CisJCWdmeF92MTBfMF9n
ZnhfbXFkX2luaXQocmluZyk7CisjaWZkZWYgQlJJTkdfVVBfREVCVUcKKwkJZ2Z4X3YxMF8wX2dm
eF9xdWV1ZV9pbml0X3JlZ2lzdGVyKHJpbmcpOworI2VuZGlmCisJCW52X2dyYm1fc2VsZWN0KGFk
ZXYsIDAsIDAsIDAsIDApOworCQltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOworCQlp
ZiAoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbQU1ER1BVX01BWF9HRlhfUklOR1NdKQorCQkJbWVt
Y3B5KGFkZXYtPmdmeC5tZS5tcWRfYmFja3VwW0FNREdQVV9NQVhfR0ZYX1JJTkdTXSwgbXFkLCBz
aXplb2YoKm1xZCkpOworCX0gZWxzZSBpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0KSB7CiAJCS8qIHJl
c2V0IG1xZCB3aXRoIHRoZSBiYWNrdXAgY29weSAqLwogCQlpZiAoYWRldi0+Z2Z4Lm1lLm1xZF9i
YWNrdXBbQU1ER1BVX01BWF9HRlhfUklOR1NdKQogCQkJbWVtY3B5KG1xZCwgYWRldi0+Z2Z4Lm1l
Lm1xZF9iYWNrdXBbQU1ER1BVX01BWF9HRlhfUklOR1NdLCBzaXplb2YoKm1xZCkpOwpAQCAtMjkx
OCwxNyArMjkzMCw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2dmeF9pbml0X3F1ZXVlKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKIAkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsK
ICNlbmRpZgogCX0gZWxzZSB7Ci0JCW1lbXNldCgodm9pZCAqKW1xZCwgMCwgc2l6ZW9mKCptcWQp
KTsKLQkJbXV0ZXhfbG9jaygmYWRldi0+c3JibV9tdXRleCk7Ci0JCW52X2dyYm1fc2VsZWN0KGFk
ZXYsIHJpbmctPm1lLCByaW5nLT5waXBlLCByaW5nLT5xdWV1ZSwgMCk7Ci0JCWdmeF92MTBfMF9n
ZnhfbXFkX2luaXQocmluZyk7Ci0jaWZkZWYgQlJJTkdfVVBfREVCVUcKLQkJZ2Z4X3YxMF8wX2dm
eF9xdWV1ZV9pbml0X3JlZ2lzdGVyKHJpbmcpOwotI2VuZGlmCi0JCW52X2dyYm1fc2VsZWN0KGFk
ZXYsIDAsIDAsIDAsIDApOwotCQltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOwotCQlp
ZiAoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbQU1ER1BVX01BWF9HRlhfUklOR1NdKQotCQkJbWVt
Y3B5KGFkZXYtPmdmeC5tZS5tcWRfYmFja3VwW0FNREdQVV9NQVhfR0ZYX1JJTkdTXSwgbXFkLCBz
aXplb2YoKm1xZCkpOworCQlhbWRncHVfcmluZ19jbGVhcl9yaW5nKHJpbmcpOwogCX0KIAogCXJl
dHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
