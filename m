Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E28D99844
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 17:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090276EB39;
	Thu, 22 Aug 2019 15:36:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E4E6E9F3
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 15:36:54 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id q4so8215981qtp.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OgpA3PBGUC+S6PBjkyp0rz1M/UBpg2+BZxcd4e8x0U=;
 b=CR87xHetpmtx2g7Vrhk31xfwHyLgJwyDqsu6OCWVzJP0pQ1yC0U08FcYqLQnXg9L2F
 sgwWisCV3dBYcnfFuTp0M6BBNU1yQMRxWx795o3XBv9WVCDVsG+cx/BCOSVtw5IM2hQf
 63BC+7vEAtuExvZ5xynamTZHbS4HtQiRdLQAg0T4Z2gMgQpk16+2DWiOelWC85rpjBUN
 fOuOTjg7a/i0ZwkXpdo7oXhr2WvsM9K7mX1GH9wuQ0mC5NrRg99mlJ/zPZUjq8GHqHjf
 z3DA1r3M3k+c+ZAD4/fEbnOewUOuljN/PazLoHxDalxGbMXv7ZfxtkHqbVHr2igLRJD3
 PL6g==
X-Gm-Message-State: APjAAAUDbIn3UV5cNBc+1e5Rtcqm1weAOgsmCDJ8frqCDQUst/HI06bU
 R8wg8IFOoX3hplu1w7qjF+zmX4Xz
X-Google-Smtp-Source: APXvYqzUAxd5XkYIrbyoYtpJ2hZOj8/lqiDLY+ZTii9IzD7uMRjVmzdWC7uZb5rucE26fWH+468k7w==
X-Received: by 2002:ac8:60d3:: with SMTP id i19mr152625qtm.191.1566488213634; 
 Thu, 22 Aug 2019 08:36:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id x3sm7958qkl.71.2019.08.22.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 08:36:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/powerplay/smu7: enable mclk switching if
 monitors are synced
Date: Thu, 22 Aug 2019 10:36:43 -0500
Message-Id: <20190822153645.3296-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822153645.3296-1-alexander.deucher@amd.com>
References: <20190822153645.3296-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OgpA3PBGUC+S6PBjkyp0rz1M/UBpg2+BZxcd4e8x0U=;
 b=RYVeRyJ1sZgFqcHEWmZcvaVpx7SrQy2sFvVFGyNhsvJcxhsre8+SrffCSxtWuVxl77
 q3ZcVgvafKv3B6zLYdVJawgojLVUkKPbznlIYeEcxLZiNV1hndlsuz0elw+wRT+SpYdQ
 XxDtiVh/l4fZKxOypymSqLKSMJCBdmxUKiSkBdWAuLcdF63d3PQXRKWDyQgFaZMV0Ixx
 Eoletg4UfLFSieKhx0x5eKBcGGDW6XqxI0ThpYm2H8YGxd9+6sUHEBYq9Xr0GzFMAoZO
 Bg6tnH9ff6WZHAI6zeN+GC5QBrlDCWSjzUNoQjHIyo6Yt8Mw0afa8JANqY3Rtc7LowPz
 rEJg==
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
