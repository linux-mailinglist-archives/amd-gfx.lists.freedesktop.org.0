Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232B48F8D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369D89D39;
	Mon, 17 Jun 2019 19:32:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932089C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so12266534qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqteAbs4qRnBbP4TGkQCF+70WX/Lm+wR0pIk4RPQ4Jw=;
 b=akjrGowccemEbpovTVJppfYiLqR8pG8hY+lm8FmKfk4FlHR1B97bzlf5Wpxa9OeElt
 DAMrSIshGWsNqezH8gQ8IEY5kBemrOqzPwGFmc3+lz/itNZYEM9OwXN8zMAzkWSHs+6K
 1E4/viKPHrV9/Me4ESzllFqPUqsjGa5gKDoJt0y0rkZnzBfpl4oTk8gh4ssL1sAR7hg2
 KAxvXKgO5y+JxnTKio/OdXcvH018O0BjAPbVJuA94ClUzPUkrxStsKAzUHOsXNTF0Tm7
 Zzzmo6eH5K37W2Pk7Q0pEoLJ1wpaL247CYwmSHALdEKVjRjrD0ADPzAbFSEVdBcO1pMe
 nHfQ==
X-Gm-Message-State: APjAAAXibxk1ZDm5ULDzPm49Mq8QQM0k50G9VbR4AOSYAfNOgMcmrX9N
 Fn4HQRgi1mtAH+DE0M0Js95mG5tU2Rs=
X-Google-Smtp-Source: APXvYqzlkjh1nw8J1aliZSGMlI1KfTiLgbZDbccoSzljroa4zAF/BJjvycklEmDLZCT0Mrh+8R3qCw==
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr23195652qvc.65.1560799912164; 
 Mon, 17 Jun 2019 12:31:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 242/459] drm/amd/powerplay: move read sensor of UVD[VCE]_POWER
 to amdgpu_smu file
Date: Mon, 17 Jun 2019 14:30:09 -0500
Message-Id: <20190617193106.18231-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqteAbs4qRnBbP4TGkQCF+70WX/Lm+wR0pIk4RPQ4Jw=;
 b=MuK3yAVVom7p1FFSwq55NDQDfY0lVtA50tIdRtaVC/Tr4oA57WkQRL8D+RWil/9WJk
 hVfbizFBrae5P1a9VRsdee1YOCKfJCW4RRKY1R1bDlCETQvRgKVvR3S5Lim0UKNz327t
 udQK05EDfCTeJULPUCGu35W+S9s7u20nIqAJKaMfLr/KYXLAquMyXdIISdXtR8izEDth
 l4G0VD+PcsMD2OtVMsVWNVWdypZNwK4376bqhD8N5wnPWVEYvnAxVvATQHgwOTKOnh+2
 RIAcoZPOuxAsO7XAVRnvqzYfks2G2QcHLJN95ahLcfHri3DGkokJ/C7G8lZ98OWxQ0/4
 MT0Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KClRoaXMgcGFydCBvZiBjb2Rl
IGlzIGFzaWMgdW5yZWxhdGVkIGFuZCBtb3ZlcyB0byB0b3AgY29kZSBsZXZlbC4KClNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFu
ZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jIHwgOCArKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jIHwgOCAtLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jCmluZGV4IDQ4MmZkYWQxZDVmOS4uY2ZmMTdhMmRkY2EzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0yNTUsNiArMjU1LDE0IEBAIGlu
dCBzbXVfY29tbW9uX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFt
ZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJcmV0ID0gc211X2ZlYXR1cmVfZ2V0X2VuYWJsZWRfbWFz
ayhzbXUsICh1aW50MzJfdCAqKWRhdGEsIDIpOwogCQkqc2l6ZSA9IDg7CiAJCWJyZWFrOworCWNh
c2UgQU1ER1BVX1BQX1NFTlNPUl9VVkRfUE9XRVI6CisJCSoodWludDMyX3QgKilkYXRhID0gc211
X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VVkRfQklUKSA/IDEgOiAw
OworCQkqc2l6ZSA9IDQ7CisJCWJyZWFrOworCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfUE9X
RVI6CisJCSoodWludDMyX3QgKilkYXRhID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNN
VV9GRUFUVVJFX0RQTV9WQ0VfQklUKSA/IDEgOiAwOworCQkqc2l6ZSA9IDQ7CisJCWJyZWFrOwog
CWRlZmF1bHQ6CiAJCXJldCA9IC1FSU5WQUw7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDU1ZDE2NDlkNjExMS4uOTQzNzQ4MjdhODNi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0yOTQ2
LDE0ICsyOTQ2LDYgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCiAJUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVy
X3BwdGFibGU7CiAKIAlzd2l0Y2ggKHNlbnNvcikgewotCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9V
VkRfUE9XRVI6Ci0JCSoodWludDMyX3QgKilkYXRhID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChz
bXUsIFNNVV9GRUFUVVJFX0RQTV9VVkRfQklUKSA/IDEgOiAwOwotCQkqc2l6ZSA9IDQ7Ci0JCWJy
ZWFrOwotCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfUE9XRVI6Ci0JCSoodWludDMyX3QgKilk
YXRhID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9WQ0VfQklU
KSA/IDEgOiAwOwotCQkqc2l6ZSA9IDQ7Ci0JCWJyZWFrOwogCWNhc2UgQU1ER1BVX1BQX1NFTlNP
Ul9NQVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVt
UnBtOwogCQkqc2l6ZSA9IDQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
