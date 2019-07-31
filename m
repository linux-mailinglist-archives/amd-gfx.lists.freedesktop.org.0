Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CF7CB2B
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D858D89CA8;
	Wed, 31 Jul 2019 17:58:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A224989B97
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:35 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id h28so46787494vsl.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rX5/pujrghkwam9HaWqpBCiMB40pHAxrZgNGDklrPDs=;
 b=hYVwKQ0I4lPW+lQ5oJDe82nV0aPQT9GA+qT/MTYHop7NQMl1c8k91IZufJE+un0Bpk
 cfO543NBJCQ2FpTeKRyvoDUBaHOg5DXR1tK3ynOcno4doQoF7YC4vbBh3heRAELhfhzF
 jYv+PE/A/ZKPiKLdo6ZgwOI++myqDG01cCkx256LbFC7U2nLrVjw59BQ0noMcWN00UFt
 CBooeNnuapke9sZDLSXVOWVVNsb8BiBjsr+9h9gSAt1+iXUa7YCwa4o7COEUDhDUBilj
 /cfjVezZQjDpx9uubtoyhiT43J7mJFDOqfZdDMw+JpsEYj+jyhcHfrhQ14uT/vPToo3y
 X8wQ==
X-Gm-Message-State: APjAAAVVDkOor7J/n++ohBmgJeGZxbPW6kzbCv7m2/qdkcbS4nq41pXZ
 L9WC01fFAV8ZtpXyPs6gi0WKrVz4
X-Google-Smtp-Source: APXvYqwnYwlWIOBIFILlmJl0qxo1X0H195wOz80ydIMz8DcI7Fq09gLLqAy++2Ard9kJTfpsw0jHog==
X-Received: by 2002:a67:e419:: with SMTP id d25mr6959634vsf.196.1564595914430; 
 Wed, 31 Jul 2019 10:58:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/26] drm/amdgpu: add ras error count after each query (v2)
Date: Wed, 31 Jul 2019 12:58:01 -0500
Message-Id: <20190731175818.20159-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rX5/pujrghkwam9HaWqpBCiMB40pHAxrZgNGDklrPDs=;
 b=PHMjRgK2iN4yesipRhzSSAFmiEzef2CQQD3huvffBftT8v1dLJvRU4nBHOJkG4Ika9
 2coIKDknDxmAZc9DWzxRDDH+kgMRwNr95zjzDORRywOWbOiJtgXABn83CAcIR492UIMC
 fgqlod21SOha2TRwBWJ4qvENAoyFBI6I8p+mP98p75QI74KS47Nyu+qTNFg5fuuDEGRF
 g7GfXHxeQVlUQiEcSJnzL+C3V4BJoDmk7KlX0Ul0sX8kdX99dXhyzWFzy2f5KzGmhSIz
 EHMEX+2luxcrZ74ZVx0pVhZN1uCNttg/AorWEuez+7vamJlylnge4WZ7KXgo//PSEcja
 Xxug==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKdjE6IGluY3JlYXNlIHJhcyBjZS91
ZSBlcnJvciBjb3VudAp2MjogbG9nIHRoZSBudW1iZXIgb2YgY29ycmVjdGFibGUgYW5kIHVuY29y
cmVjdGFibGUgZXJyb3JzCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IERlbm5pcyBMaSA8ZGVubmlzLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCmluZGV4IDg0NWU3NWYzNWIxOS4uNGY4MWIxZjZkMDlmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC01OTksOSArNTk5LDIwIEBAIGludCBhbWRncHVf
cmFzX2Vycm9yX3F1ZXJ5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWRlZmF1bHQ6CiAJ
CWJyZWFrOwogCX0KKworCW9iai0+ZXJyX2RhdGEudWVfY291bnQgKz0gZXJyX2RhdGEudWVfY291
bnQ7CisJb2JqLT5lcnJfZGF0YS5jZV9jb3VudCArPSBlcnJfZGF0YS5jZV9jb3VudDsKKwogCWlu
Zm8tPnVlX2NvdW50ID0gb2JqLT5lcnJfZGF0YS51ZV9jb3VudDsKIAlpbmZvLT5jZV9jb3VudCA9
IG9iai0+ZXJyX2RhdGEuY2VfY291bnQ7CiAKKwlpZiAoZXJyX2RhdGEuY2VfY291bnQpCisJCWRl
dl9pbmZvKGFkZXYtPmRldiwgIiVsZCBjb3JyZWN0YWJsZSBlcnJvcnMgZGV0ZWN0ZWQgaW4gJXMg
YmxvY2tcbiIsCisJCQkgb2JqLT5lcnJfZGF0YS5jZV9jb3VudCwgcmFzX2Jsb2NrX3N0cihpbmZv
LT5oZWFkLmJsb2NrKSk7CisJaWYgKGVycl9kYXRhLnVlX2NvdW50KQorCQlkZXZfaW5mbyhhZGV2
LT5kZXYsICIlbGQgdW5jb3JyZWN0YWJsZSBlcnJvcnMgZGV0ZWN0ZWQgaW4gJXMgYmxvY2tcbiIs
CisJCQkgb2JqLT5lcnJfZGF0YS51ZV9jb3VudCwgcmFzX2Jsb2NrX3N0cihpbmZvLT5oZWFkLmJs
b2NrKSk7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
