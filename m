Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95116989CB
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 05:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353736EA5B;
	Thu, 22 Aug 2019 03:25:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11536EA5B
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 03:25:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r21so3906073qke.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 20:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJyCoJsY/ibsggHvftm85s11qzH8NgLEGY8mVUn59sI=;
 b=Xh7ncr48XuMehFSe7UbbGYDZ4khMZVAVGBCHlTop8o/lV9VXW5oJCJRYhREQW9Tak6
 lhTT5zliz+hpEdrZbOw8Rd6ZEYiOokHHAHBXPJNuWn6K5wRGt/TnO/451VJsUqBri12X
 VcobiIf/IrunJvC9AA4L3wCAAhVtd2oFymTpZByQx0MG91IgM45K4ZRATA46Dl+NwQqi
 OYmhbul1dQzS3B18pH3c1WHup8USiRlh54Pm/ukMBx8JDxLsScndJk8OQdzuJ9VglWlv
 cv4NiNcdDVUYW7bQrrY04YlMpeHRUfdbdK037YBhZSIlGhQ7rw6HXnZWGgxE1BKrPBp+
 R4ig==
X-Gm-Message-State: APjAAAVVi+k5x1sas94N0Ved1Xx+50wzizckIUuZdM5gK1mIS7gFNu3K
 tiusMZV/3mmBZkJGvzYT7fq5Zdyi
X-Google-Smtp-Source: APXvYqwJ8YOGAcm+h0/7YYeDNUxna4aEbcFJaGRkpS819Rg3cG/uJ/rXZJmCnOvwqqsEinBFuEKuuQ==
X-Received: by 2002:ae9:dd82:: with SMTP id
 r124mr33828684qkf.134.1566444337520; 
 Wed, 21 Aug 2019 20:25:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h4sm10088659qtq.82.2019.08.21.20.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 20:25:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: silence a warning in
 smu_v11_0_setup_pptable
Date: Wed, 21 Aug 2019 22:25:27 -0500
Message-Id: <20190822032527.1376-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJyCoJsY/ibsggHvftm85s11qzH8NgLEGY8mVUn59sI=;
 b=B+rKg2zLJ704KcP5kewH5DEZC6jWwlZwTIMLyfkqiSB5LN9Pgl1yUC3m2+m1WgOvmb
 rB5GG4jl0V9VQoXGcjd2xHAUSbrKzZpbc5mk0utK+/Y9ckhZEJmD81Jp3wgbA3kxADkO
 Uu2tbTIq+5LJ0hpM2Ab3o6PvO2xg+c8sEhku8BIpxbDJXSdeQip6255Nx9vHedk/O7VN
 KxNVIOVYf8pzKcMsu8jx80VGt3WoB0OhdVD9jMRR1VuL3ZQgtaCZRIE5IiJ3V9+6LsJT
 15jLAzxUjeB3NFwxozgfPntvhkjFRr74905HNGijRhLYpCwrb3KHs3Xo2A5jfq5JmMUf
 reOg==
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

SSB0aGluayBnY2MgaXMgY29uZnVzZWQgYXMgSSBkb24ndCBzZWUgaG93IHNpemUgY291bGQgYmUg
dXNlZAp1bml0aWFsaXplZCwgYnV0IGdvIGFoZWFkIGFuZCBzaWxlbmNlIHRoZSB3YXJuaW5nLgoK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA1ZmYwYWQ0MzljZGMuLjk3NTBjNDE5
NDgwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTM1
OSw3ICszNTksNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211KQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2
OwogCWNvbnN0IHN0cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVyX3YxXzAgKmhkcjsKIAlpbnQgcmV0
LCBpbmRleDsKLQl1aW50MzJfdCBzaXplOworCXVpbnQzMl90IHNpemUgPSAwOwogCXVpbnQxNl90
IGF0b21fdGFibGVfc2l6ZTsKIAl1aW50OF90IGZyZXYsIGNyZXY7CiAJdm9pZCAqdGFibGU7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
