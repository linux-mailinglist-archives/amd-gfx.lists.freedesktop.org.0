Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3E29B23
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19D6E0BE;
	Fri, 24 May 2019 15:34:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097936E0C9
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 15:34:21 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x184so6075560vsb.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 08:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O64QUlJZvY6edZzNsDoXZFt70BByWxmPmSeDdp5OTr0=;
 b=LhqaAHgZoFVE8yVzHhZoCiVlBAiC46r5bGoQXo6OwIyo0XfBqJbiX3c+bfINyWJyz1
 gKiOQ9WBhxgmWPoyaz6DXAJ+z+QmZWzALGQRCqQD869BM2oh+r0xvu6Sg2xodfntqQQ2
 fVQOdKyyfDJXixq+5Hrh5GQKsZgNwzthoZdKEnOHEeBpWjnXGpQN2jn+/HyjFPztQG6D
 NLdtT8SMiJuDQEK+l80kld4vj8uoP8rLe2UHthZg/xcSqzu9cmI+BZX3gPnwSZR6aeyQ
 lzkjY+i7IArG/IHFigVDidlljb1L1r0I/r6ouox71AaT2MIYiDEEiwvvqrvFSmwpETjK
 Lgqw==
X-Gm-Message-State: APjAAAVniZvR3Z+CxeOiupKx2mctBs0jplKWXdYDPXgMhi/WDqf8E6Br
 zWzn24PM42QOb3DMbiMf/0955Bh0
X-Google-Smtp-Source: APXvYqxNNmqjh4yg1lJ8CHCe0WrUD/8INNbp4XH+ILRxW8b0DOIhOxVIXQGa0cVk32L9ExOocUCY4g==
X-Received: by 2002:a67:770f:: with SMTP id s15mr42499850vsc.11.1558712059855; 
 Fri, 24 May 2019 08:34:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.228])
 by smtp.gmail.com with ESMTPSA id s65sm2858523vkd.36.2019.05.24.08.34.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 08:34:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Don't load DMCU for Raven 1 (v2)
Date: Fri, 24 May 2019 10:34:10 -0500
Message-Id: <20190524153410.19402-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O64QUlJZvY6edZzNsDoXZFt70BByWxmPmSeDdp5OTr0=;
 b=E299hfcAeoekUCJdVk+6uA7NCrFIRyxeJiZu1+OWckqOx2l1zuZIYwySNzN7QO7Z16
 4Xz5Xl6l851U2C5ntqmueHixTeTPrMtXnfSFbp11PzsYh55fpC1snt3kwOXQtM6IzUpX
 eIhB6EV/89bs3/ei17s+n+oSW+/uXLXQIlQrG6Vdrwq2zFdrRiK0we12ejud6WMFCfU7
 890OrooUPcphWqjfFXi6/6k7zSGA6bCdSqATZbVwWatXNTqbJiR1jhoHKfhNnTPwUX9D
 iw1bxdH9ORStP/3cdT1tS8jrcLFmweexVsg5OD4XQCUimO/dbrw7eAw1FYlbG9n19m3C
 l0nQ==
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
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpbV0hZXQpTb21l
IGVhcmx5IFJhdmVuIGJvYXJkcyBoYWQgYSBiYWQgU0JJT1MgdGhhdCBkb2Vzbid0IHBsYXkgbmlj
ZWx5IHdpdGgKdGhlIERNQ1UgRlcuIFdlIHRob3VnaHQgdGhlIGlzc3VlcyB3ZXJlIGZpeGVkIGJ5
IGlnbm9yaW5nIGVycm9ycyBvbiBETUNVCmxvYWQgYnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJl
IHRoZSBjYXNlLiBXZSd2ZSBzdGlsbCBzZWVuIHJlcG9ydHMgb2YKdXNlcnMgdW5hYmxlIHRvIGJv
b3QgdGhlaXIgc3lzdGVtcyBhdCBhbGwuCgpbSE9XXQpEaXNhYmxlIERNQ1UgbG9hZCBvbiBSYXZl
biAxLiBPbmx5IGxvYWQgaXQgZm9yIFJhdmVuIDIgYW5kIFBpY2Fzc28uCgp2MjogRml4IGlmZGVm
IChBbGV4KQoKU2lnbmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTIgKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA5
OTVmOWRmNjYxNDIuLmJjYjFhOTNjMGI0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5jbHVk
ZSAiZG1fc2VydmljZXNfdHlwZXMuaCIKICNpbmNsdWRlICJkYy5oIgogI2luY2x1ZGUgImRjL2lu
Yy9jb3JlX3R5cGVzLmgiCisjaW5jbHVkZSAiZGFsX2FzaWNfaWQuaCIKIAogI2luY2x1ZGUgInZp
ZC5oIgogI2luY2x1ZGUgImFtZGdwdS5oIgpAQCAtNjQwLDcgKzY0MSw3IEBAIHN0YXRpYyB2b2lk
IGFtZGdwdV9kbV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiBzdGF0aWMgaW50
IGxvYWRfZG1jdV9mdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQljb25zdCBjaGFy
ICpmd19uYW1lX2RtY3U7CisJY29uc3QgY2hhciAqZndfbmFtZV9kbWN1ID0gTlVMTDsKIAlpbnQg
cjsKIAljb25zdCBzdHJ1Y3QgZG1jdV9maXJtd2FyZV9oZWFkZXJfdjFfMCAqaGRyOwogCkBAIC02
NjMsNyArNjY0LDE0IEBAIHN0YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJCXJldHVybiAwOwogCWNhc2UgQ0hJUF9S
QVZFTjoKLQkJZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsKKyNpZiBkZWZpbmVk
KENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDEpCisJCWlmIChBU0lDUkVWX0lTX1BJQ0FTU08oYWRl
di0+ZXh0ZXJuYWxfcmV2X2lkKSkKKwkJCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RN
Q1U7CisJCWVsc2UgaWYgKEFTSUNSRVZfSVNfUkFWRU4yKGFkZXYtPmV4dGVybmFsX3Jldl9pZCkp
CisJCQlmd19uYW1lX2RtY3UgPSBGSVJNV0FSRV9SQVZFTl9ETUNVOworCQllbHNlCisjZW5kaWYK
KwkJCXJldHVybiAwOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlEUk1fRVJST1IoIlVuc3VwcG9y
dGVkIEFTSUMgdHlwZTogMHglWFxuIiwgYWRldi0+YXNpY190eXBlKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
