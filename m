Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9036C46F
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Apr 2021 12:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DAF6E073;
	Tue, 27 Apr 2021 10:54:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5ED6E073
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 10:54:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ja3so12974287ejc.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ANiz6AZy3N4d6nJAuKDT4ap9O8lmxaWOKSBs9o/zAeE=;
 b=I1YhyJ/8da1LT2H2ytPthRITBsc3mXsupnC5BoXwUiIcEbzJRaOWRytiiLlkhbLPML
 id8yOEiLqWEqYYEb9l1p20S6Na9Xx3Aj5GDr8xpOEZp218M3TIJFeiox9/jVvvggSLmZ
 ZmIabWr4hboMc4rW7XImkMQkYJOwg8fXVabObOA3+Pw6sXtcJP3ZokE+BMfwvQpn5F3a
 Ac6cfge/uGERBJ4Bo2whjaf4BjEPquY5xj1eTUXCP6YZjUqsjOKiFs2qP4TXMfjTzEF3
 alC0fx9nf5koN8ajnzvCeYptb91iHlytx7aDOjf8UPrGVyMfhSof2lRFInk5U+HXO9De
 uchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANiz6AZy3N4d6nJAuKDT4ap9O8lmxaWOKSBs9o/zAeE=;
 b=CC1piwOIktrntK/zb/DHlRkZDe0W4GTh3kxJsqOzAlIs/ZnaBb9bWqAObb9Ns5VK9K
 iyA/5+Y5PVHPlDRs0cD1bjAcfjSQpNUcg9Htcm1ZIQ1u2uv7aN7RG4fJ5lXppFzrEqqZ
 oqEcS6sYONWr6d58DcQYeL3AtQVX+pd++7XTQOxIaa/o9SePpedW4lrMcaRv/oqjZA8G
 D1vaaOLX+b8G2CM8kIKNC7VQXnD6AWoyMxYACDB6Cs9D6Q8UFPakwq0KsJrmtwVnbt/s
 o+uTPDBCmtVNC0hWZl6Dt6P6giYwE0EguSV1RdUIgqYCGE2JHMRawToGz84LbdtQM5Q2
 SIwQ==
X-Gm-Message-State: AOAM530S47H/JWL2vBivMrav5fICVweebHruV3E6uLaYdgmEMGljsndI
 pnqEFew3ih3jTeTCQE8i5ZCSjaO6qSk=
X-Google-Smtp-Source: ABdhPJyYcC4jUqFQamV6hidgUQglj2nPIy7xbE/9v+xCwSnnrUzHrSuWenQ8qyWTx8JLFKMCwfT+xA==
X-Received: by 2002:a17:906:3a94:: with SMTP id
 y20mr22332920ejd.35.1619520853945; 
 Tue, 27 Apr 2021 03:54:13 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:cc40:13c1:6c51:27cd])
 by smtp.gmail.com with ESMTPSA id o8sm12995411ejm.18.2021.04.27.03.54.13
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 03:54:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu: move struct amdgpu_vram_reservation into vram
 mgr
Date: Tue, 27 Apr 2021 12:54:10 +0200
Message-Id: <20210427105410.2700-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427105410.2700-1-christian.koenig@amd.com>
References: <20210427105410.2700-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Tm90IHVzZWQgb3V0c2lkZSBvZiB0aGF0IGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5oICAgICAgfCA1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uaAppbmRleCA5ZTM4NDc1ZTBmOGQuLmViODRhNjljNGI3NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaApAQCAtMzcsMTEgKzM3LDYgQEAKIAogI2RlZmlu
ZSBBTURHUFVfUE9JU09OCTB4ZDBiZWQwYmUKIAotc3RydWN0IGFtZGdwdV92cmFtX3Jlc2VydmF0
aW9uIHsKLQlzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Ci0Jc3RydWN0IGRybV9tbV9ub2RlIG1tX25v
ZGU7Ci19OwotCiBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyIHsKIAlzdHJ1Y3QgdHRtX3Jlc291cmNl
X21hbmFnZXIgbWFuYWdlcjsKIAlzdHJ1Y3QgZHJtX21tIG1tOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwppbmRleCA4N2M0MGM0Y2RkNTAuLmE1MmUxN2Vk
M2RmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1f
bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMK
QEAgLTI5LDYgKzI5LDExIEBACiAjaW5jbHVkZSAiYW1kZ3B1X2F0b21maXJtd2FyZS5oIgogI2lu
Y2x1ZGUgImF0b20uaCIKIAorc3RydWN0IGFtZGdwdV92cmFtX3Jlc2VydmF0aW9uIHsKKwlzdHJ1
Y3QgbGlzdF9oZWFkIG5vZGU7CisJc3RydWN0IGRybV9tbV9ub2RlIG1tX25vZGU7Cit9OworCiBz
dGF0aWMgaW5saW5lIHN0cnVjdCBhbWRncHVfdnJhbV9tZ3IgKgogdG9fdnJhbV9tZ3Ioc3RydWN0
IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4pCiB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
