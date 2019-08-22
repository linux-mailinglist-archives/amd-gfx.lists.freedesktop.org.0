Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E19A00E
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E25A6EA5F;
	Thu, 22 Aug 2019 19:31:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C466EA5F
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:31:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y26so9042899qto.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OgpA3PBGUC+S6PBjkyp0rz1M/UBpg2+BZxcd4e8x0U=;
 b=Yz3/5DM4K7Em1dLQfcKOE5W8qOcQrMLhkCyHWNm1ThUpJLtgfiHjP8YB7rEBM9OB98
 1qLZ9lCvMDCV0TwMNBD5urZCwDZOudFrQeXqYEFYAOwkzQzQq24Q94MZcuWZxo8toSRi
 JeA97NooKzrLWI8hfVM5irOtqdLVOOxr/0QeG9qtvKPtLwy4jWtf6VRjeHE4woh8S51g
 /ABBTNV9R9N0cc3ARZXjnWp1pw0LNljznslsi/dYMfHjqsV2bb68mKq4uBA/HPSGoWnw
 I7LhfA/F+iX2XZgKVbVKU5lMRgeWQRSs6mafwmh67SvAHDZIjMEntNeRufQwyS4nwwCO
 On8w==
X-Gm-Message-State: APjAAAVrijShNViWWN/y0nodS9fapXevx/T7TqpaDMyH+FKT3sO3si87
 2vG0nLHH04vyfvtYAB7MIfXbLTuI
X-Google-Smtp-Source: APXvYqyysLdeiUAk+iITB/BpKRQHjzwmO1O31kAHM8GVYcltyhYCwK4yAdk4PKKxh0jZ7BDzXIz4Ig==
X-Received: by 2002:ad4:4974:: with SMTP id p20mr915447qvy.29.1566502261757;
 Thu, 22 Aug 2019 12:31:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h1sm337140qkh.101.2019.08.22.12.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 12:31:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu/powerplay/smu7: enable mclk switching if
 monitors are synced
Date: Thu, 22 Aug 2019 14:30:47 -0500
Message-Id: <20190822193050.3107-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822193050.3107-1-alexander.deucher@amd.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OgpA3PBGUC+S6PBjkyp0rz1M/UBpg2+BZxcd4e8x0U=;
 b=ovGxnNNVghKZ70+oUrf7y3AmCRksWWyrPkXeEoW8nqvnAp31wYzCEYUOY4DBbI2hZB
 dOkcvEHEoLOfX6S2iP5ZAAUBNXk6SY9RCjB63Okb9wossP1ceakY/az87eZwQEY5//Qc
 0kEpKUvOLhaksNkzUwqblyBIVlBqoGYdcSa2VDIR4yim0vTSBI3h6f7Sk4BJPvKTdmLE
 ms8LqXugD5CIfmNOH27po92MXDtKTAwBpNez04lmaD1e0n0CQkrNYGrqiwBXsucovbWZ
 AQuiWYjVO87t2x3U3QYQEHzeWbDcZuzfFR4wARfzt5WDUPofdyagTCcMtUWT9g7YXJ9f
 leGw==
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

SWYgREMgaGFzIHN5bmNlZCB0aGUgZGlzcGxheXMsIHdlIGNhbiBlbmFibGUgbWNsayBzd2l0Y2hp
bmcgdG8Kc2F2ZSBwb3dlci4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci9zbXU3X2h3bWdyLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3Ivc211N19od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211N19od21nci5jCmluZGV4IDNjMTA4NGRlNWQ1OS4uMzRmOTVlMGUzZWE0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCkBA
IC0yOTU2LDkgKzI5NTYsMTAgQEAgc3RhdGljIGludCBzbXU3X2FwcGx5X3N0YXRlX2FkanVzdF9y
dWxlcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCWlmIChod21nci0+ZGlzcGxheV9jb25maWct
Pm51bV9kaXNwbGF5ID09IDApCiAJCWRpc2FibGVfbWNsa19zd2l0Y2hpbmcgPSBmYWxzZTsKIAll
bHNlCi0JCWRpc2FibGVfbWNsa19zd2l0Y2hpbmcgPSAoKDEgPCBod21nci0+ZGlzcGxheV9jb25m
aWctPm51bV9kaXNwbGF5KSB8fAotCQkJCQkgIGRpc2FibGVfbWNsa19zd2l0Y2hpbmdfZm9yX2Zy
YW1lX2xvY2sgfHwKLQkJCQkJICBzbXU3X3ZibGFua190b29fc2hvcnQoaHdtZ3IsIGh3bWdyLT5k
aXNwbGF5X2NvbmZpZy0+bWluX3ZibGFua190aW1lKSk7CisJCWRpc2FibGVfbWNsa19zd2l0Y2hp
bmcgPSAoKDEgPCBod21nci0+ZGlzcGxheV9jb25maWctPm51bV9kaXNwbGF5KSAmJgorCQkJCQkg
ICFod21nci0+ZGlzcGxheV9jb25maWctPm11bHRpX21vbml0b3JfaW5fc3luYykgfHwKKwkJCWRp
c2FibGVfbWNsa19zd2l0Y2hpbmdfZm9yX2ZyYW1lX2xvY2sgfHwKKwkJCXNtdTdfdmJsYW5rX3Rv
b19zaG9ydChod21nciwgaHdtZ3ItPmRpc3BsYXlfY29uZmlnLT5taW5fdmJsYW5rX3RpbWUpOwog
CiAJc2NsayA9IHNtdTdfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1swXS5lbmdpbmVfY2xvY2s7CiAJ
bWNsayA9IHNtdTdfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1swXS5tZW1vcnlfY2xvY2s7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
