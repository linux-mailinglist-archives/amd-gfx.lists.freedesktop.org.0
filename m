Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A035473200
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24E6E5B7;
	Wed, 24 Jul 2019 14:43:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896896E5B7
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:43:41 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so1395977qto.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGfOwE3XDARP8Gg7Fe6gi5396ISKnuAMhYjX0L/qFfg=;
 b=makzCcSvWeTXCqgLUBp31z61zNZhpesFBLyhjRyR70Kc1y4yCK84vkK0a+QzV3ITjP
 XlR6RYmLWgdlT6+4jVh23pROqK4V/Mrj11/9y4A8SpKtKp5MVibaVO4BQDn4adD4H8Z0
 JLoI9UgvO0Z6iq0djSy9FLtrwTewLYpUeZimlQW/TrvLjy+M6Zte2ex+ZRbmg0eECEua
 sfaeXtoQ8y+p9OgsqinmM8p2v5ZEnLMzkTS7cyWqB6dWtdLFWMawFy+LkzQOPU1oNH1f
 922qlN8xDJ58X9gfaQC4obJrvnMgJ5KZrTrPGTWjFyGkFAd0vewLmuJMKIUiJnuacbVM
 lKNQ==
X-Gm-Message-State: APjAAAWmTPCVPix9LsUdBJawU59aDMWQST27VVfS4xmZDELVKQzOKcCV
 Ldg9EFN+dBNZEgPM5LzcSYGHNaLs
X-Google-Smtp-Source: APXvYqwLj2k3U8YXKbgKsekiEH2cGktQuUUldEJ07ZDUdQ+6uYbGvmDvFPR5NZoO0aR2WrAeBvmrRg==
X-Received: by 2002:a0c:acab:: with SMTP id m40mr60408203qvc.52.1563979420328; 
 Wed, 24 Jul 2019 07:43:40 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a6sm21120223qth.76.2019.07.24.07.43.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:43:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] Revert "drm/amdgpu/powerplay/vega12: call
 PrepareMp1ForUnload in power_off_asic"
Date: Wed, 24 Jul 2019 09:43:31 -0500
Message-Id: <20190724144333.24047-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGfOwE3XDARP8Gg7Fe6gi5396ISKnuAMhYjX0L/qFfg=;
 b=SsQEwiSPToEvAHOt/XJhCayQmQP8PzWmiEEm9xv74qMJVaKVxic3nzG2tVOXeW0PnN
 H1uZslQM5nD8m57t+WXznPnmklhOZ15eaVdcXH5mkb4pFn8Pdb1TEf1EzzXOFtJYhXaF
 IGKJuJD+s/hw3VB7EXhL8hyQCvEpTVSvgf0etWSUqd488f/y67lG7VrlojR2GLYM7bZU
 HNExh/aJU0UWbKhgCUBC+H32g2TbG+osP24UHePmb030HaxRZ3XGji6Vl1T3EunF5iJ6
 Q0uC/keH0rRXFSIj5/AN4LMi4K4SeLMTIJxn9AVVJxNcVeN7vG3bObTEwJS0mTnhPJ/u
 HTKA==
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

VGhpcyByZXZlcnRzIGNvbW1pdCBiYzQzNDY4NDU3NjIzYjNmNzcyZjE0MzgzNDU1ZTJhYmRkYmFk
ZGFmLgoKUmV2ZXJ0IGZvciBub3cgcGVuZGluZyBmdXJ0aGVyIGRpc2N1c3Npb25zIHdpdGggcG93
ZXIgdGVhbS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJf
aHdtZ3IuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMKaW5k
ZXggM2QzNTA0NDExYjYzLi5lZmI2ZDM3NjJmZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jCkBAIC0yNDY4LDExICsyNDY4LDYg
QEAgc3RhdGljIGludCB2ZWdhMTJfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21n
cikKIAkJCSk7CiAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICY9IH4oV2F0ZXJNYXJrc0xvYWRl
ZCk7CiAKLQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPSBzbXVtX3NlbmRfbXNnX3RvX3Nt
Yyhod21nciwKLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwKLQkJCSJb
UHJlcGFyZU1wMUZvclVubG9hZF0gRmFpbGVkISIsCi0JCQlyZXR1cm4gcmVzdWx0KTsKLQogCXJl
dHVybiByZXN1bHQ7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
