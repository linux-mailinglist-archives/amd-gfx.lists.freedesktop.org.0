Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6848FE0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4A789DB8;
	Mon, 17 Jun 2019 19:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930EF89D1D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so6981517qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nslbh/oz6vKgiW9DUUHDBqQWpsfI3knAxnwhduSecTI=;
 b=mJvmutKVm3L6MEZH07T3MVqMZkQvcL+qoEmZHHr/i+LPr75FTAfTFPWu7zCM2JolYx
 saO2cvqtBwWJSK2XLf5cPvcVKhmd2o9lorvJ4z5n9Un39b2Hu8GcqKS2rh+Po2NBTLk6
 E99Ot+qJX9mhPPCYel9up086gCj+7noMDgLiRURR0chsEM5WlHjIIDY7IAQHE53eTJUH
 lPElPkIOUjCC2iU8XeJtleNTtxC0SbDMM+KG7nHSAUnvuGDEs/rbcOvkBnMHO7iO6/zj
 d8mXsMTSSlnP/5btDlRA4vj3vVzl6y6/m8w/KYyP2nAgvg8Dv+c2uCL5p9Sgin55Dv0q
 s/oA==
X-Gm-Message-State: APjAAAVpb6ulCmhOBLgm0v4JwkqVyXN047oWsqd/zb5SKUQIBU1ti8Rw
 +orChY2WSFD8jRNCX8/rV15R900nZ3Q=
X-Google-Smtp-Source: APXvYqwscZ1qOJrjII/60wryhwDyDIkMBBEoI+9I61OSQEF+OEEOjON5qXjXI6296umvhvYb1dHErg==
X-Received: by 2002:a05:620a:1387:: with SMTP id
 k7mr35676970qki.129.1560800761442; 
 Mon, 17 Jun 2019 12:46:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 311/459] drm/amd/powerplay: allow dc request uclk change
Date: Mon, 17 Jun 2019 14:44:12 -0500
Message-Id: <20190617194540.18497-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nslbh/oz6vKgiW9DUUHDBqQWpsfI3knAxnwhduSecTI=;
 b=K/cClnI3g3xEDw2ylK51PbKOxbAdncBre4Y8uwMMduobw0PNXL8JKK0Ryq9VSVMrqL
 zNkc4AyHRgqVNzTwU+dxO03LWQC7Onk6IwuNW3N9kN2UvzfJziq+UkM418ADOyJ0hztp
 FdXN2pW/JzfdE2EdCiEYehy5b9IhTEtrhczwR4NT0Q1IXYaJbTJ4I+ntcIcHR9PzlTDL
 nG45qeTo++McpXu3D3dhbi+ql6L0xEaGR7iixk+sypnrWmx5wVvswksR06wwV+nlIyoz
 gOqeYvnVvJ/+/DrrqQ6XVgX0gvZigtDtYONcix72O1PDzML1UjQr4BkI0aXVaNuqE1Rp
 gJZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKd2hlbiBkYyBzZXQgbW9kZSBv
ciBjb2xvciBmb3JtYXQgaW4gZnJhbWUgYnVmZmVyCmNoYW5nZSwgaXQgbWF5IHJlcXVlc3QgY2xv
Y2sgY2hhbmdlcywgbGlrZSBkaXNwY2xrLApkY2ZjbGssIHVjbGsuIGFmdGVyIHNtdSBnZXQgY2xv
Y2sgcmVxdWVzdHMsIHNtdQp3aWxsIG1ha2UgZGVjaXNpb24uCgpTaWduZWQtb2ZmLWJ5OiBoZXJz
ZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggOTM3MTRl
ZTlmMzJlLi43MzY2ZWYzNmFjNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jCkBAIC0xMjc3LDggKzEyNzcsOSBAQCBzbXVfdjExXzBfZGlzcGxheV9jbG9ja192
b2x0YWdlX3JlcXVlc3Qoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAKIAlpZiAoIXNtdS0+cG1f
ZW5hYmxlZCkKIAkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxl
ZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCkgfHwKLQkgICAgc211X2ZlYXR1cmVf
aXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsKKwkJc211X2ZlYXR1
cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsKIAkJc3dpdGNo
IChjbGtfdHlwZSkgewogCQljYXNlIGFtZF9wcF9kY2VmX2Nsb2NrOgogCQkJY2xrX3NlbGVjdCA9
IFNNVV9EQ0VGQ0xLOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
