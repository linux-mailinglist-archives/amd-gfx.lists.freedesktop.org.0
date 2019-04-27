Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80578B25F
	for <lists+amd-gfx@lfdr.de>; Sat, 27 Apr 2019 03:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3508925B;
	Sat, 27 Apr 2019 01:41:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882189255;
 Sat, 27 Apr 2019 01:41:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E00B9216F4;
 Sat, 27 Apr 2019 01:41:39 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id
Date: Fri, 26 Apr 2019 21:40:26 -0400
Message-Id: <20190427014051.7522-29-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427014051.7522-1-sashal@kernel.org>
References: <20190427014051.7522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329300;
 bh=JxVyDbs1KQjFjI/HpepkRNJOAcXAFR42+Pf2RJTh3wM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GAQCahoS7MGCLmORWYdk7tazb4wS344q1IElF+em1SsBU+jLnurWkPxY1W3sWCZSE
 OBrbn0bvF/ZyFz8ArRFBxDsa+iCgkye6AQ1Vk5HJcwnWYO5M4anzzhf9G5aE0EPAEf
 L+mhWt5t7nRFOHsLwtJ6O02HZgbKcghPDXMIv0x4=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZTdhZDg4NTUzYWExZDQ4ZTk1MGNhOWE0OTM0ZDI0NmMxYmVlNGJlNCBdCgpQaWNh
c3NvIGlzIGEgbmV3IHJhdmVuIHZhcmlhbnQuCgpSZXZpZXdlZC1ieTogS2VudCBSdXNzZWxsIDxr
ZW50LnJ1c3NlbGxAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggNWFiYTUwZjYzYWM2Li4wNmQxOWJiODljZmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTI3NSw2ICsyNzUsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRfZGV2aWNlc1tdID0gewog
CXsgMHg5ODc2LCAmY2Fycml6b19kZXZpY2VfaW5mbyB9LAkvKiBDYXJyaXpvICovCiAJeyAweDk4
NzcsICZjYXJyaXpvX2RldmljZV9pbmZvIH0sCS8qIENhcnJpem8gKi8KIAl7IDB4MTVERCwgJnJh
dmVuX2RldmljZV9pbmZvIH0sCQkvKiBSYXZlbiAqLworCXsgMHgxNUQ4LCAmcmF2ZW5fZGV2aWNl
X2luZm8gfSwJCS8qIFJhdmVuICovCiAjZW5kaWYKIAl7IDB4NjdBMCwgJmhhd2FpaV9kZXZpY2Vf
aW5mbyB9LAkvKiBIYXdhaWkgKi8KIAl7IDB4NjdBMSwgJmhhd2FpaV9kZXZpY2VfaW5mbyB9LAkv
KiBIYXdhaWkgKi8KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
