Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940D48EC4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4947489950;
	Mon, 17 Jun 2019 19:27:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18C989930
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y57so12254560qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KIPlN1zVZmVx/V6k6ZPBTQQnmTNaR945qKEvl+PbIX8=;
 b=sJRrSsw50gW0IywxkJ+NqzIGG3rx6zf+qo5VMC2klRZamCuNUwS6tdECYi2Ilhx84+
 gUS6HzsUpEy7f4mcSS/TWPmdHSHI2CMUZUBC1a5FMW+KhzfUPZM6iQFwFJkgTGO7Ty+D
 C7jc4wPcdNMNFTwi8GcticrcCgfLYAh8fN2z35dgXLQ8G2Oxjq1qfZ84hNE3qQmvyU5J
 vX5rlwH0cqTOM6W6hZziNVOrF7PchFLzkgqunzP00fQG9IARws9flUOm/jfw6YnXht80
 NQ9OkWhbQcNY01u5HON9UFgChG9x0WVohwjUXygzF2ghjAQKDeBf71uYFLhI+JImM85e
 CGIQ==
X-Gm-Message-State: APjAAAVk3icsrfRdsGLFL8Tb7uFRqQPnKRWUjaH8F/BUr9/FBnkr/mL+
 6oBUTw5FwJOHEiD6/x3JMZqvXhnM6b0=
X-Google-Smtp-Source: APXvYqzl+pPy1vbSx7HwbQViHupaTcKQS195jpQw0gkXAUuW4DwvBLzD5OQQV+5hZw99gCOhISIfKw==
X-Received: by 2002:a05:6214:222:: with SMTP id
 j2mr22605182qvt.121.1560799667806; 
 Mon, 17 Jun 2019 12:27:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 136/459] drm/amdkfd: Delete alloc_format field from map_queue
 struct for gfx10
Date: Mon, 17 Jun 2019 14:26:01 -0500
Message-Id: <20190617192704.18038-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KIPlN1zVZmVx/V6k6ZPBTQQnmTNaR945qKEvl+PbIX8=;
 b=sLYEj/MWpDhd6IGvdHFkxHX17PmXSBmI0jc2rLhifbtNezIdoCFcaJe1Lw+1wqb5zU
 Fr77oulJ/jsR/6iUGkzeJ9RfyV4C3y69X+pMSC7tfa1ZlT97i/ZEJar6vrP1qqiPz55P
 swkzkSBq7/acBigV23zkSQzIFFeHCiD86Z5XPDnflNaGA07fEAhz/ps9olUtYCB2wpc9
 t+XI67azJLamxhTlOHULI6Nxqtl1VdONeFLEW9oTQvgLcp93m8RAnJwx8F1454VWQrLg
 xcGgL+2lvD0+3rdckoPlPNhhvuMIUJwHSDXHw2o1PukJyy2UxKSYpuRlp4GU0za4Mt4I
 vcAA==
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

QWxsb2MgZm9ybWF0IHdhcyBuZXZlciByZWFsbHkgc3VwcG9ydGVkIGJ5IE1FQyBGVy4gRlcgYWx3
YXlzCmRvZXMgb25lIHBlciBwaXBlIGFsbG9jYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92MTAuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9rZXJuZWxfcXVldWVfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2Vy
bmVsX3F1ZXVlX3YxMC5jCmluZGV4IDI2MTUzYzUxNDkzYS4uYWVkMzJhYjcxMDJlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjEwLmMKQEAg
LTE1OSw4ICsxNTksNiBAQCBzdGF0aWMgaW50IHBtX21hcF9xdWV1ZXNfdjEwKHN0cnVjdCBwYWNr
ZXRfbWFuYWdlciAqcG0sIHVpbnQzMl90ICpidWZmZXIsCiAKIAlwYWNrZXQtPmhlYWRlci51MzJB
bGwgPSBwbV9idWlsZF9wbTRfaGVhZGVyKElUX01BUF9RVUVVRVMsCiAJCQkJCXNpemVvZihzdHJ1
Y3QgcG00X21lc19tYXBfcXVldWVzKSk7Ci0JcGFja2V0LT5iaXRmaWVsZHMyLmFsbG9jX2Zvcm1h
dCA9Ci0JCWFsbG9jX2Zvcm1hdF9fbWVzX21hcF9xdWV1ZXNfX29uZV9wZXJfcGlwZV92aTsKIAlw
YWNrZXQtPmJpdGZpZWxkczIubnVtX3F1ZXVlcyA9IDE7CiAJcGFja2V0LT5iaXRmaWVsZHMyLnF1
ZXVlX3NlbCA9CiAJCXF1ZXVlX3NlbF9fbWVzX21hcF9xdWV1ZXNfX21hcF90b19od3NfZGV0ZXJt
aW5lZF9xdWV1ZV9zbG90c192aTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
