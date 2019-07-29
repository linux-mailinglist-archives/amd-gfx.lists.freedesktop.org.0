Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC879988
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1B6E294;
	Mon, 29 Jul 2019 20:15:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540F789DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:30 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id k9so41842158vso.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Chm+Xi4rtpAlvPyYhMCFtkoWiorKUv4W32b7ciKOSPg=;
 b=DwJHh3s8+OR+gqyc3RMhyuxCGaDUq51Glss0g4felVV4dUqwjGjUnaqRHGB/k7AgNt
 JjFmusEnVLLM9r+3RtsM3crSRSVGYx9MNO8qKCJf9NSoVHqlFUoXjeasojSw83tEdwII
 7SFJC6zMWCoPRcqtPQJkGLv1x7KfT9Top+Mik9JXLpKjELc6LBFVlgxbDOzV09j23FZS
 ZGESiNF3Z1ebQz32WlmXV82Q/PH4tVfrPVdjEsDQl/AsI7wyIUxNFnlUUJQ5qHQAL0Dq
 5MTm9QgSkRpNnAIws5hiwIcTq7bqNS+EgP12lQ3vcOZEyn1AyzIK8I5jdNE6wWpiuZcP
 Jb3A==
X-Gm-Message-State: APjAAAXuCqC+gB7UG+k/JRf/vqfHMkXAZxo44a+y0qtcawaWcy2Rk33O
 L5Q+vCGPzBvewb1DobWjsL88jP0a
X-Google-Smtp-Source: APXvYqwWUjthLA7x/NkJYfAQ/4Ihx4L41fnpaIp89nJar3YvjzXnZyoIhbB+NsPEd0vbC71NwKAPRg==
X-Received: by 2002:a67:d58a:: with SMTP id m10mr72679366vsj.15.1564431329103; 
 Mon, 29 Jul 2019 13:15:29 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/30] drm/amd/powerplay: hold on the arcturus gfx dpm support
 in driver
Date: Mon, 29 Jul 2019 15:14:48 -0500
Message-Id: <20190729201508.16136-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Chm+Xi4rtpAlvPyYhMCFtkoWiorKUv4W32b7ciKOSPg=;
 b=W3/4d0kUV8+3UVkdva2t2thMxrk3D/r3dHddkWZMmOsEu1cUG+utpwXreMzcAM1NB3
 9JN1ikEkaKalVSKuujBIySF0Y8nR0hnr4dXJ5YDyT0b8FIDLPLn0JmonBJZoyop3ZFzM
 MstBT0GcB6YgxhKHLQn/DzxSi7i46D4bjS/3f9OB8dREA1RRKCXAXX3u8InpvLooTHRG
 VJQtamhXFwoR9N0pgSWtej506aDeVHo5YjFXPOli1HzI9iwz+ivoLBVTtM8Gz5tu5eYQ
 UR78bBi0spRQ3kGhcEokdxe+eztqNqG4UMKPtcGQgHcscKegJzXeS2tvhuOda1oJeBV8
 Sl7A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkFzIGZvciBub3csIG9ubHkgIlBy
ZWZldGNoZXIiIGlzIGd1YXJkZWQgdG8gYmUgd29ya2luZyBmcm9tClNNVSBmaXJtd2FyZS4KClNp
Z25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCBiMjg0ZWJjYmU1NDUuLmEwNjQ0ZWYyNjdhOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTMyNCw4
ICszMjQsNyBAQCBhcmN0dXJ1c19nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCiAKIAltZW1zZXQoZmVhdHVyZV9tYXNrLCAwLCBzaXplb2YodWludDMyX3Qp
ICogbnVtKTsKIAotCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZF
QVRVUkVfRFBNX1BSRUZFVENIRVJfQklUKQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBN
X0dGWENMS19CSVQpOworCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNL
KEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklUKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
