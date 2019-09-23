Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C091BBD71
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 22:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EFF88437;
	Mon, 23 Sep 2019 20:58:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4546788284
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 20:58:15 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p10so16960372qkg.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKpRmknQONpYYKYpMty0DNHxUGxDHiadFAUajWDux+c=;
 b=UZAJ5pN9xHdPH5TEKwbr/px+NGXcnz2G+vpTp4x32MHyjvjXdI8XkXPQQl1psnp0kn
 0zbDWXC4FGv9EUH0t+fQW1Sw5PNlpwvzvgeefk7uth3YTy7vmDxE6/KrLSlVa1atxhlI
 BkfoqxhBomiqMiLxM9q17FBa6pIMgliCrXMj4pdeyIklZLsebMARnvQQXNc2ldZU6Yi9
 jlL92MmJrFbvnq1zTDP8Ik6lG9uyyyWBvpwO/9jy83GZcO1vpJCQN3+KsHkFTp2X1Zzo
 sgmzEh5MpRTHPwOgv7pBkjO8AaNlP7bzkyzTRYGm4t5zUNlsn1wlsN3xxWEmtU0sLbYi
 x6fg==
X-Gm-Message-State: APjAAAVzOBvKCUzv/wO//uZB0FDotixa2HXD8bTfJt4tuAT3GlEV2Y/b
 DFioLktxIJcc7fim5NaO7/ZgECpr
X-Google-Smtp-Source: APXvYqyj3nvhi36Xkr1v5u1KNtCRLZXl296Is6DR491BBju2gPtBE1zYSVdkSiWKyz6F4fwXvxgrig==
X-Received: by 2002:a37:b4c7:: with SMTP id d190mr2180428qkf.202.1569272294152; 
 Mon, 23 Sep 2019 13:58:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n17sm6809824qke.103.2019.09.23.13.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 13:58:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
Date: Mon, 23 Sep 2019 15:58:04 -0500
Message-Id: <20190923205804.12300-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKpRmknQONpYYKYpMty0DNHxUGxDHiadFAUajWDux+c=;
 b=W21opYQb1px95QufHfF5j+c+5Rsx3zIDAb3JVAEm5o1WOe40cPLd929XHbl1bIvTZQ
 R0zYyh5KduuSq1JZ1lBVvG7U/dRJcaNhrpDQM7gyB2W1CE7zCjZbtU/fjXPZB/BjOZse
 Axu1H+A6aax48xHKZbdZcGfy3Ymx6DWLwc+6xD1KmXSz9kC50vxb7guLA6Irfq3e49v1
 yYbCIHHIxZ9pNsE/KZhoFcRjhpK0ONISuuIiyovLdX16ZRO9VxSJ2WIiN0gn9tzn988Z
 L8K1eE3YYMh3VGdIm0erie7nudYBbzvxqrW5J9kfF9uB5YXGeHZ21ZdBB9mTONn0YBsD
 /yhQ==
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

SXQncyBhcHBhcmVudGx5IG5lZWRlZCBpbiBzb21lIGNvbmZpZ3VyYXRpb25zLgoKU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKaW5kZXggM2NhNTEzOWYx
MjczLi5kZTE4MjE4NWZlMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCkBAIC0yMyw2ICsyMyw4IEBACiAgKgogICov
CiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgog
I2luY2x1ZGUgImRjLmgiCiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
