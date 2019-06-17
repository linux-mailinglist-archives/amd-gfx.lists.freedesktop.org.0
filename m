Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9D4904F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D344B6E042;
	Mon, 17 Jun 2019 19:50:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB36E03F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:59 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12298527qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zqYP9Kj9MBt8jJ8c0j/JeQvZPRvMUyJSM/67VamQHA=;
 b=bK5tyTOotlw2npvaUcNjMcraWuopTUZ1ZIu7GCjfuiXCSCyzR3PfajdY716ZkTgPvi
 hPodF3mVH8NiQIWtM7xfxzV/5CPSP6E72VOT25WK/QLq7fFtrnYTtqoE6UdRl+Gz1Bht
 MXvaDkdea/oRk2BS6IxCaYdLJT56dDdV2Wper9iVZwkOe8zqA9n5Y3gJAw8OpG69i/Cm
 3P3UkX5DCRCWIBHYZC+PJ2F6i2odxoITFQkWm+fSR+z9vtMAjiKxqFsCHfnx+8vgojn6
 jGMA8ceYGe80RB2367ooTzraAxW+NxLkwcDfUmCXWq8Lbzlb1BoRjHpN++iKMTGw9h2K
 2EpA==
X-Gm-Message-State: APjAAAV3EI+EhvQMrleNlm99Nh+d9TuEFl1rrww8j9hWMzl23VPSVR0n
 XshhPgyyp0VORycHGrdhzbpbEPNN2j+pbA==
X-Google-Smtp-Source: APXvYqzRcwNHsApLaDHVN6VMQ3dVXWFZ8IV2ubXMznjZfl7/lBN88vngd2DiGJU3A0fOULJ8noQZYQ==
X-Received: by 2002:ac8:4601:: with SMTP id p1mr96228156qtn.181.1560800998923; 
 Mon, 17 Jun 2019 12:49:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.49.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 403/459] drm/amd/display: Refactor program watermark.
Date: Mon, 17 Jun 2019 14:48:52 -0500
Message-Id: <20190617194948.18667-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zqYP9Kj9MBt8jJ8c0j/JeQvZPRvMUyJSM/67VamQHA=;
 b=SdhJcejs01XPiKdYvHY+B0KSz6JajAa06mZKqYOtw/kVCEC18iPzIjVWXBAUFarCyN
 lKbnt2I/+IUc6IfKKu4nMCiwLUiMoxnyp7Fn+5L1uTWszH3kGm1n1kF4Q4KYRMdv5Eu3
 87KCknq08A9VndTToWqk/VLsidm9QOBFG9T94h/ZixxybdgaxqYVRaljLGRQ8K/pe5+x
 in8Tzc3HJguv6yYixPpV9ORSYa7sbFW6TU1IUgoJ30yEXrIiscgU1q9TJjUcae2aYO8e
 Mnq+JRHwqdG47zh9MDmEi7nkszSh0qAur3l/OO+qhoJ5MTiphUvzabpBF5h1PYX74ZVU
 xYBg==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKUmVmYWN0b3IgcHJv
Z3JhbW1pbmcgd2F0ZXJtYXJrIGZ1bmN0aW9uOgpEaXZpZGVkIGludG8gdXJnZW50IHdhdGVybWFy
aywgc3R1dHRlciB3YXRlcm1hcmsgYW5kIHBzdGF0ZSB3YXRlcm1hcmsuCgpTaWduZWQtb2ZmLWJ5
OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255
IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8
Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9odWJidWIuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuaCB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmMKaW5kZXggYjNhOTliMTBjZmJkLi5k
NjcwNWI0MGE1N2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9odWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHViYnViLmMKQEAgLTI5NCw3ICsyOTQsNyBAQCBib29sIGh1YmJ1YjJfZ2V0
X2RjY19jb21wcmVzc2lvbl9jYXAoc3RydWN0IGh1YmJ1YiAqaHViYnViLAogCXJldHVybiB0cnVl
OwogfQogCi1zdGF0aWMgdm9pZCBodWJidWIyX3NldHVwX3ZtaWRfcHRiKHN0cnVjdCBodWJidWIg
Kmh1YmJ1YiwKK3ZvaWQgaHViYnViMl9zZXR1cF92bWlkX3B0YihzdHJ1Y3QgaHViYnViICpodWJi
dWIsCiAJCXVpbnQ2NF90IHB0YiwKIAkJdWludDhfdCB2bWlkKQogewpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCmluZGV4IGNkZDE5
ZjU4ODdkNy4uNmNhNGE1YTlmOGM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCkBAIC0xMDIsNCArMTAyLDggQEAgdm9pZCBo
dWJidWIyX2dldF9kY2h1Yl9yZWZfZnJlcShzdHJ1Y3QgaHViYnViICpodWJidWIsCiB2b2lkIGh1
YmJ1YjJfd21fcmVhZF9zdGF0ZShzdHJ1Y3QgaHViYnViICpodWJidWIsCiAJCXN0cnVjdCBkY25f
aHViYnViX3dtICp3bSk7CiAKK3ZvaWQgaHViYnViMl9zZXR1cF92bWlkX3B0YihzdHJ1Y3QgaHVi
YnViICpodWJidWIsCisJCXVpbnQ2NF90IHB0YiwKKwkJdWludDhfdCB2bWlkKTsKKwogI2VuZGlm
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
