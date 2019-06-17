Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A3848F2D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAF689B8F;
	Mon, 17 Jun 2019 19:31:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C989B8E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:19 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so12255936qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUbFviJiyLYq4PeYQpfYiyFzZ4L1RgrI7EdLA4R4R5s=;
 b=hFih56PKGFTrTqkCx4j6uVgYnhhy6WNg3Ms+bmM0Dz4onAoZsZyyhIkxbYGc9wtiLs
 lmUNUQvT+QADgMzQg+xdTXc3m8CyXB7lHtkPwK94qFPwXh4ePrCZGc4wQNR8jxs1IdgI
 7FTAF+VxM0QgmbmmPX6mz5kVuMDatvTD23xUCs9ShKbPlEe4x0dss0Y3s38O4R9erFCP
 cOzn95LlM3nI7Ebv5mR1t2rG9eLIFsjIylZ2kA7HK7DjWJKfpaGwWrvGTIdXD5DJ0E7Y
 fjYEGzZ5wfyA1fhB+OzujjFFkVBjCzSKzY3Vur8G2CsmOOrxu93zPY0XPZ5pyOSVaITy
 aHmA==
X-Gm-Message-State: APjAAAXDCqkuoW7tUzMbUh08KYaDgwjTbLQnLbNsfj2j4urzgL+AFUuJ
 ol3Y+FA1pB3hCqIXAU0G+ee335vvfHc=
X-Google-Smtp-Source: APXvYqxynRodImmvKdIXPu8BZeg4XeTFBWGsqHWt8IVm+kGTmerYYiqeEPOXWaNZiokPWRyEoFx/rg==
X-Received: by 2002:a0c:81f6:: with SMTP id 51mr23155432qve.213.1560799878545; 
 Mon, 17 Jun 2019 12:31:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 205/459] drm/amdgpu/sdma5: incorrect variable type for gpu
 address
Date: Mon, 17 Jun 2019 14:29:32 -0500
Message-Id: <20190617193106.18231-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUbFviJiyLYq4PeYQpfYiyFzZ4L1RgrI7EdLA4R4R5s=;
 b=R31ZrE2I+ggnVkxO+NgJ4L7Dj71JY5iPvLPF8EDQxk8xPmzWeE1Tfhsy53RE+tU6NP
 9Mezmzd98Ad9fE7gUKkVX9zC+H7SM4Pqtyw3Prc3eEBmKVsusPZ1DUHGgJSEHnnZei8V
 +adWvoJeYaf3DmVp+vN0X5gvhHrZsqDN+hRcEmmhDDsiVQmTnFtxbWousz1AcWVF/AOd
 g6UyQzzfZ25MEuXf85NqKXn5rglOk5zs8Ebe07kOQTcn9rJlwDKAyLMw0MovRebgX6Yh
 EImgjvOJZdiyPWrLIqrp+oTeg8Z0+M4+GlBASQHsutFDz2WTJYlV5H7EOreTEfVkDMHI
 HiSA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkluY29ycmVjdCBwcm9ncmFtbWlu
ZyB3aXRoIDY0Yml0IGdwdSBhZGRyZXNzIGFzc2lnbm1lbnQgZm9yCjMyYml0IHZhcmlhYmxlLgoK
U2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAu
YwppbmRleCAzMmI0OGM5Y2EwNTEuLjM3NDdjM2YxZjBjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NV8wLmMKQEAgLTU2NSw3ICs1NjUsOCBAQCBzdGF0aWMgaW50IHNkbWFfdjVf
MF9nZnhfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXUzMiBkb29yYmVsbDsK
IAl1MzIgZG9vcmJlbGxfb2Zmc2V0OwogCXUzMiB0ZW1wOwotCXUzMiB3cHRyX2dwdV9hZGRyLCB3
cHRyX3BvbGxfY250bDsKKwl1MzIgd3B0cl9wb2xsX2NudGw7CisJdTY0IHdwdHJfZ3B1X2FkZHI7
CiAJaW50IGksIHI7CiAKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2Vz
OyBpKyspIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
