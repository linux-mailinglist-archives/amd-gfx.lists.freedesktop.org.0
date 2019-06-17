Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8048E2C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9681589733;
	Mon, 17 Jun 2019 19:18:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE358970E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so5773622qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z65fiiV3BqgnoonIa/wf+KRSz26krvmKTfOc4fAZdek=;
 b=oXAsHKUse4S7j8GAICB0CFJcBtNtu7Vplxb6c+/XHjOm/dBuNVYfIKdCsJd2I/4EAE
 vqVkNwAYSOc7RjGJMzAsMPTipQjz/yf6lv7zcC8nT96bhz0SmIOkUdB9RYYuQszoojN9
 sJAOvnw93goWNjW7OinwS34b7hcNyXMSWVbTOVJ8Cy6mhbNcJ75Xvx87gh82SKDY4ZkY
 lmT4ISP8er8vDgPGuIRbV93XNTRH/xSz//M6HNtnYVlHRoCHDW+qOqYL/vxLtvS5ghmQ
 7iHF9RLm9zx0Cju0Te9iK/f6B+FlmPZmV3mZUN5/Z/mIuFKjGlwAh19Zqd57fJhAJFzJ
 5q5w==
X-Gm-Message-State: APjAAAUSToC79LX/7hSKD+PnkpuFebEC6o4+kQgleWwkdb00+0Hb9Mll
 JkTgWPVVyVwW11zrcHcgQHykw4PxxGA=
X-Google-Smtp-Source: APXvYqzmyeEJmjElcyYZMpU0IdtPDwEawSFQEDBt4gduOm+6Aw4SN148qthEioW3zi/lW/ExhutZmg==
X-Received: by 2002:a0c:92ab:: with SMTP id b40mr22589352qvb.129.1560799118862; 
 Mon, 17 Jun 2019 12:18:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 102/459] drm/amdgpu/discovery: fix hwid for nbio
Date: Mon, 17 Jun 2019 14:11:03 -0500
Message-Id: <20190617191700.17899-91-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z65fiiV3BqgnoonIa/wf+KRSz26krvmKTfOc4fAZdek=;
 b=CL8Jcy3crI57+20Hz+ViyyWo+KjFYogbXs7+nzK79HTKr/mKie+iUoFQRgtV6de7S3
 PD13hfN0h3Yrgvqc0fpEG+wklRg9JN7rerlrWmCKoAXwvJMMAWX4iLHlf64gmcXU0okl
 PClDDBvf3117H8sdheL1orMjJ04xXPcoAVqI99Px/iUapDRbfQEm72cgznibLtDAJLjK
 Zulf0onGCyYjCOmMT7Jy9Hja8+Tkk2mdCPZG47r6lQOQtZwtbQ2zbNN5r+UJ+QQUzt3C
 SaB3laCWq+qX4+zltUZ4+OwS/ApNsdakQEq6KrwfGtvWpaxp9kznHK/qDcQ9dqvdua2q
 SxNg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzY292ZXJ5LmMKaW5kZXggYWMwNjVhYjkxYzRiLi5lYzE0ZmQxMzUwZTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKQEAgLTExNyw3ICsx
MTcsNyBAQCBzdGF0aWMgaW50IGh3X2lkX21hcFtNQVhfSFdJUF0gPSB7CiAJW1NETUExX0hXSVBd
CT0gU0RNQTFfSFdJRCwKIAlbTU1IVUJfSFdJUF0JPSBNTUhVQl9IV0lELAogCVtBVEhVQl9IV0lQ
XQk9IEFUSFVCX0hXSUQsCi0JW05CSU9fSFdJUF0JPSBEQkdVX05CSU9fSFdJRCwKKwlbTkJJT19I
V0lQXQk9IE5CSUZfSFdJRCwKIAlbTVAwX0hXSVBdCT0gTVAwX0hXSUQsCiAJW01QMV9IV0lQXQk9
IE1QMV9IV0lELAogCVtVVkRfSFdJUF0JPSBVVkRfSFdJRCwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
