Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651387B800
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 04:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5389E5B;
	Wed, 31 Jul 2019 02:30:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9F489E5B
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 02:30:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y26so65075151qto.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 19:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knaEVf3rDpBMb0ooaHAbSsoE9zqvU/HPG5AqPsRz+xw=;
 b=dSMH8x3XjrGqR4qoqS7eLqBGu5XFfzCOhaYdXU5XUNjL5nvo0rKSEiBiyd1MCOie25
 YmqhFpKzYUH2FHY4tQuqAXT+jzL6zyCPF6VxSPk2YL3h/dqP+0w6Q/8Zvsh+54RTOC7n
 OkDwd5UeaX7WV4r0hoj7+WrFcEQg1T1I//bLRnEvqqOrZgskBQ5WwRTAgBVuyW0EYrSZ
 3eUeH9CS8y53jnIa8wzIpCPGRf3piYredwBZjlcs67p8yIYtdtCoF1ah6gag+S594vVB
 IYHLWfctatJg3cYbwegijgLoELO+2kM+FnRaIHRL9sZ09AGSgDXLkWyRD6zPfdc05BK4
 lP9Q==
X-Gm-Message-State: APjAAAULTZA3SGjTG+1zs6PM/SyypU0lA0zeZv/JNe5/IMoA20CC/vBj
 GLvzwtq4EU7Cn3ktJwOX8FI8czZ2
X-Google-Smtp-Source: APXvYqwUTbKxXlcZ20fDpF3vdCuon7ZtDDgKRyGoyBkkoJrDT5X/O8kI0zpR7syAOJvm/gVMSsB2qw==
X-Received: by 2002:a0c:fe6b:: with SMTP id b11mr43147447qvv.64.1564540252509; 
 Tue, 30 Jul 2019 19:30:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id k38sm37346067qtk.10.2019.07.30.19.30.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 19:30:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: return success if set_mp1_state is not
 set
Date: Tue, 30 Jul 2019 21:30:44 -0500
Message-Id: <20190731023044.6828-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knaEVf3rDpBMb0ooaHAbSsoE9zqvU/HPG5AqPsRz+xw=;
 b=YbSnsPMCS3RDxK0bms8KXJu01uoT1zdsZYs8bHcGkqZ4bAQfNw9RZDrlfqmXTrXO4Y
 RWNbYP8LpIGJAf+EDcel80DeChDOxILsPauIcfPXvJcDU6XIQ2uDGKaUaMX5MBXDeho4
 xyYxDsWhqEuSsSZjSLRmjNXxFEC/5imfGnvd9axnNar0Q7f0hZfxNHR7eT3I+uNChSb6
 2NfgpAttImCH9fy7HJnTdCRfudr3Uoil8dtI3EdfazYXsSOMdivbWW7MlRoPZVHgEn1V
 XQfdZdIuT58syqzs67UJAqqnZ/leHgkuyjtkXQ3LbCehiA396ONP9uRHyugwD7sSxbkj
 Wxrw==
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

U29tZSBhc2ljcyAoQVBVcykgZG9uJ3QgaGF2ZSB0aGlzIGNhbGxiYWNrIHNvIHdlIHdhbnQgdG8g
cmV0dXJuCnN1Y2Nlc3MuICBBdm9pZHMgc3B1cmlvdXMgZXJyb3IgbWVzc2FnZXMgb24gQVBVcy4K
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgfCA4ICsr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXku
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwppbmRleCA4
OGEyZWY3NWI3ZTEuLjJlM2Q5ZWY2MjViZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwpAQCAtOTMxLDEyICs5MzEsMTAgQEAgc3RhdGljIGludCBw
cF9kcG1fc2V0X21wMV9zdGF0ZSh2b2lkICpoYW5kbGUsIGVudW0gcHBfbXAxX3N0YXRlIG1wMV9z
dGF0ZSkKIAlpZiAoIWh3bWdyIHx8ICFod21nci0+cG1fZW4pCiAJCXJldHVybiAtRUlOVkFMOwog
Ci0JaWYgKGh3bWdyLT5od21ncl9mdW5jLT5zZXRfbXAxX3N0YXRlID09IE5VTEwpIHsKLQkJcHJf
aW5mb19yYXRlbGltaXRlZCgiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsK
LQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQorCWlmIChod21nci0+aHdtZ3JfZnVuYy0+c2V0X21wMV9z
dGF0ZSkKKwkJcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5zZXRfbXAxX3N0YXRlKGh3bWdyLCBt
cDFfc3RhdGUpOwogCi0JcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5zZXRfbXAxX3N0YXRlKGh3
bWdyLCBtcDFfc3RhdGUpOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHBwX2RwbV9zd2l0
Y2hfcG93ZXJfcHJvZmlsZSh2b2lkICpoYW5kbGUsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
