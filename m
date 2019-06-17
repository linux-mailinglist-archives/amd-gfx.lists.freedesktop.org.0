Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F148F6F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEA489C8F;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8759289C88
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so12187032qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPodIoP0/fajxHu0+kHYg5y/cZ/AHA78MKI9MSXLIsA=;
 b=ENKLBh0GOqQhDIeXUA5BdqVB82h5D7szuDLtZbOYcbwZC4lG9w9pUXzpT0fWevStBk
 4iG1/71jY2yGTiy0BO3fSQOcXP2t9HYn0MU9W2GJm+BQmn77mfWCRd2pck61yxFA1P4w
 5QySV/CAGD5lpNIODTueP2TR84bK1cmvCf+uyukZ6S7ZJqrEAec/aZEyxE0bvFB1DqBo
 N06XD/hzI7PfPlOq41sV7Sokt/B+cH02IVNkD/vF+BNcQ6EDwTP2tdoTKGlcex8/Vfum
 5FZnhdf3wsoDfCTaJCk2UxQCs2EZjahru0ihcj8bSiqxWL9hGMuNDhonf5lPrhblZVfF
 wblA==
X-Gm-Message-State: APjAAAXR+2jHXAo8aS+6sYkI/v3cFeLsVTVm67J7q0gCp1Hdb4uo37Zv
 TM+bc0Hap9Mxz8ks83DDXRRSItDXaHU=
X-Google-Smtp-Source: APXvYqxor7RQ7QTmFkFWFuWBDyVVR02sUeoDAqCEvSwmkyTz3A+KMzywMJC5Tf4jNjJWFYNuYooQkw==
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr82183808qta.169.1560799927156; 
 Mon, 17 Jun 2019 12:32:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 259/459] drm/amd/powerplay/smu11: enable ds socclk by default
Date: Mon, 17 Jun 2019 14:30:26 -0500
Message-Id: <20190617193106.18231-60-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPodIoP0/fajxHu0+kHYg5y/cZ/AHA78MKI9MSXLIsA=;
 b=CCn9V9EGds+Zj+XfHtPqKkj2kaNg6M01+8JAS1r7Ojblcg4J7bW+HPu1fLcv+lvfTT
 YuJdwZWIrOpA7yny1wMdZ+agApLhmciJUKFNJ18pwHraQOec3HPKG01ASAAFdkjUuYGM
 ebRNTTAX7zLtAuRjU0KpMWHFC9sD+2DCeIrCbootN7DSJL9ZJlq20Psuzqm3A78JvgpO
 VhL0n4jGF/djnd38w+PJUTpJzzrzrXQ9E9SngoKtcNo1qWStUiSrImXgYhcuprgygGh8
 pv0xgspWV+qlNu2jzp2g+XYTS3a0OXZEG2HMVe8V0g8LIndrDfZPpP5Z2AsRbT2yDXZr
 l6iw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKU2lnbmVkLW9mZi1ieTogVGFvIFpo
b3UgPHRhby56aG91MUBhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDVmNjk3ZWQzNzk2Yi4uZjFmOTIwMjM0ZGJkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0yOTksNiAr
Mjk5LDcgQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9MSU5LX0JJVCkKIAkJCQl8
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWF9VTFZfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfUlNNVV9TTU5fQ0dfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfU09D
Q0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1BQVF9CSVQpCiAJCQkJfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9URENfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZY
X0VEQ19CSVQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
