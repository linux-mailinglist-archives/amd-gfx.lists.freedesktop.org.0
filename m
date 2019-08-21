Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CB9872D
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382E6EA22;
	Wed, 21 Aug 2019 22:24:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670D889AEA
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:31 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d79so3321637qke.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDxeXF9sQttHmaqhWw8sFhGh116I0LmKFR49d0/XFL0=;
 b=MdtmUv+00GUfmYUy/khk3dWfRr4wYfMKsyZWx3zJTEy9+/ZFRfq6v46XI1OgLA00Rp
 2Ve9Lfmo2VhywmYjGijFpZT0jnJBBY15esg7azfRAIAmu9Wv5gkuIJ88lRz25WN1dO9T
 og/FtXV/uBecQMQzXi+tzzsYPK1JZtVBm0SDckGFQcRHHOfuHPkJmNa0onTf878z52uG
 NmVje6/WBg6LfH/hBeNOtOXHWesOklwWYeKs3Drt/bywrDVuyjivpFSKdeyXnpp/HsTu
 XE/9U1Lr5F65uqS7vaRqlq0N1vXeaytaYJ+rSOdTnwt2j+KqIdSyyQ1V45O2n9VK7y15
 Ga1A==
X-Gm-Message-State: APjAAAXavrFGfvrYQ7i41cyrC/f0wyutLCz4CVzAKpcU6VZnF3UdHF2c
 1TkR2o/h0yuTougfHl3j0WY7SjeE
X-Google-Smtp-Source: APXvYqywbhYfwQ7OUC5nQN/ZUB9tiYB1U126Wo+1kM8B2CDeb04t4Mjwx0Xhyyi2gl+BNLiFc1r4Kw==
X-Received: by 2002:ae9:f409:: with SMTP id y9mr34245364qkl.244.1566426270158; 
 Wed, 21 Aug 2019 15:24:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/37] drm/amdgpu: enable sdma clock gating for rn
Date: Wed, 21 Aug 2019 17:23:43 -0500
Message-Id: <20190821222359.13578-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDxeXF9sQttHmaqhWw8sFhGh116I0LmKFR49d0/XFL0=;
 b=nXc0fAhFPx3DDDFfGNsPODfM5pjGr9yuWL/aUvAAWr0qwBmC5GqFBTHOM0GvXhIdmY
 jICX2hX6mNqD2FFxmV6qKnbBrQ3DESADKwdh6agDToAOv3W3GLD+TYCP8/KriQYLiTRF
 Fci0RAjI1ivrf0ezcQa9T+dmve77hvEs/YkxupukI1Xb+4w+s8GYW6P4G/NyvK2VQZSi
 BGRkp+SzqskTpsO8RSkYZL0xy8SyW06GULjkycnMkkewaLuEBtamzO8/TIOT4KNKZ1h3
 FGbSz+acuWjnzRr7sSjV01kwxE1u4NUStvvpItSySdov9ii0avg56G2twcwdaoe8Ccv0
 z0Zg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgc2RtYSBtaWRk
bGUgZ3JhaW4gYW5kIGxpZ2h0IHNsZWVwIGNsb2NrIGdhdGluZy4KClNpZ25lZC1vZmYtYnk6IFBy
aWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDdhNzEwMGE1ZGMx
YS4uNjc1MWM1ZjU3OTEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTExNjIs
NyArMTE2Miw5IEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFu
ZGxlKQogCQkJCSBBTURfQ0dfU1VQUE9SVF9HRlhfQ0dMUyB8CiAJCQkJIEFNRF9DR19TVVBQT1JU
X0dGWF9DUF9MUyB8CiAJCQkJIEFNRF9DR19TVVBQT1JUX01DX01HQ0cgfAotCQkJCSBBTURfQ0df
U1VQUE9SVF9NQ19MUzsKKwkJCQkgQU1EX0NHX1NVUFBPUlRfTUNfTFMgfAorCQkJCSBBTURfQ0df
U1VQUE9SVF9TRE1BX01HQ0cgfAorCQkJCSBBTURfQ0dfU1VQUE9SVF9TRE1BX0xTOwogCQlhZGV2
LT5wZ19mbGFncyA9IDA7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCAr
IDB4OTE7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
