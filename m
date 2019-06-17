Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B249014
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C449489F1B;
	Mon, 17 Jun 2019 19:46:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6819D89E50
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12286233qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzPJKWEIiBf9Bo/bu4e5XJTNvyXACM351vVIxrhJ+Qk=;
 b=a+Hems9SAZnHb+9frvUdOhcx4G+5NFigBooXAHVb66hqv7vCyPI7Y7W7Jy2FW7N5u4
 FzntkZReR8gux2EXaaB0+VOv+ZAIDEtcLuqT3jDRoUlXx3E7s32IbXsYDfSvze8H7jBW
 wJ3nk9x+ar+PUL4T5SRupX3mhV0mEjwc+hf+9no6iSt8jSNll2pa7YhkrRkVHSV+GO7M
 TfmFpIx8pl8dPrpZgRk9Y4qHvsqCaFqKIhMQVpuxPPT+34Pz7MM9Q8lzb0iyzA1Fs6OD
 7p4w/yxPF3FznqFbvfH30ne5YaPBBuQYgL5ZN90njiKEvjAwwg+m3bL6IsEIxdoVh70V
 g9dg==
X-Gm-Message-State: APjAAAVj7XH/cFI7WT02pZYLnpi5zbE8NvP7RtR2Mm6mxRztCF8wU8CN
 Ftz1fBZ9Bzm1jwH9t8OMNSdXTII5yM0J+w==
X-Google-Smtp-Source: APXvYqwr5Bk0tb9ojvBrmM3RHVyDq1CVv8Vmk0lUI0cTN7Yb28ZwgTUEZcZDxxcBEveGXpWkxsf1sA==
X-Received: by 2002:a0c:acab:: with SMTP id m40mr6761719qvc.52.1560800814423; 
 Mon, 17 Jun 2019 12:46:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 357/459] drm/amd/display: do not need otg lock if otg is not
 active
Date: Mon, 17 Jun 2019 14:44:58 -0500
Message-Id: <20190617194540.18497-58-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzPJKWEIiBf9Bo/bu4e5XJTNvyXACM351vVIxrhJ+Qk=;
 b=CPtgxY4XoYRTlwPRblbwIuZQvNvOFfQ3kLK3lkMFzorSPFVeZ/14k5UH2Turq9qCkl
 KdofErUSLKumO9pvZGPchF1b3u5oh5Rql8+yNDqRm4R9tkuc1iU40zqLJsUDapP9tUco
 eNNsH6sET8LQq9Oijkgj/vhpfIwYnuAXUzKMgrw5NDeNlK3Y+dJ0pBqGE3sMAmSsMFtC
 uCL/5gQUgyTZQWKq2B/TYkcr1HgYV0K6kYtDvvnuya8fTMm6/UxDSz7fRVMIijPTpGXb
 8WCSEeZxSjpa7UILBmdQYQmi+VijtdCgw4FMIJuL8dth9AZX0fWA6Y6zbCGNKA3jW69/
 mstg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW3RvZG9dIG5lZWQgZmluZCBj
YWxsZXIgYnVnLiB0ZW1wb29hcml5IGZpeAoKU2lnbmVkLW9mZi1ieTogaGVyc2VuIHd1IDxoZXJz
ZW54cy53dUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX29wdGMuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jCmluZGV4IGIzZmM3MTY0OGQxNi4uYTU0NmMyYmM5MTI5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
b3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9v
cHRjLmMKQEAgLTU4NCw2ICs1ODQsMTMgQEAgdWludDMyX3Qgb3B0YzFfZ2V0X3ZibGFua19jb3Vu
dGVyKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICpvcHRjKQogdm9pZCBvcHRjMV9sb2NrKHN0cnVj
dCB0aW1pbmdfZ2VuZXJhdG9yICpvcHRjKQogewogCXN0cnVjdCBvcHRjICpvcHRjMSA9IERDTjEw
VEdfRlJPTV9URyhvcHRjKTsKKwl1aW50MzJfdCByZWd2YWwgPSAwOworCisJcmVndmFsID0gUkVH
X1JFQUQoT1RHX0NPTlRST0wpOworCisJLyogb3RnIGlzIG5vdCBydW5uaW5nLCBkbyBub3QgbmVl
ZCB0byBiZSBsb2NrZWQgKi8KKwlpZiAoKHJlZ3ZhbCAmIDB4MSkgPT0gMHgwKQorCQlyZXR1cm47
CiAKIAlSRUdfU0VUKE9UR19HTE9CQUxfQ09OVFJPTDAsIDAsCiAJCQlPVEdfTUFTVEVSX1VQREFU
RV9MT0NLX1NFTCwgb3B0Yy0+aW5zdCk7CkBAIC01OTEsMTAgKzU5OCwxMiBAQCB2b2lkIG9wdGMx
X2xvY2soc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKm9wdGMpCiAJCQlPVEdfTUFTVEVSX1VQREFU
RV9MT0NLLCAxKTsKIAogCS8qIFNob3VsZCBiZSBmYXN0LCBzdGF0dXMgZG9lcyBub3QgdXBkYXRl
IG9uIG1heGltdXMgKi8KLQlpZiAob3B0Yy0+Y3R4LT5kY2VfZW52aXJvbm1lbnQgIT0gRENFX0VO
Vl9GUEdBX01BWElNVVMpCisJaWYgKG9wdGMtPmN0eC0+ZGNlX2Vudmlyb25tZW50ICE9IERDRV9F
TlZfRlBHQV9NQVhJTVVTKSB7CisKIAkJUkVHX1dBSVQoT1RHX01BU1RFUl9VUERBVEVfTE9DSywK
IAkJCQlVUERBVEVfTE9DS19TVEFUVVMsIDEsCiAJCQkJMSwgMTApOworCX0KIH0KIAogdm9pZCBv
cHRjMV91bmxvY2soc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKm9wdGMpCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
