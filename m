Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E2BCD3D
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F276EA8A;
	Tue, 24 Sep 2019 16:46:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BD86EA8A;
 Tue, 24 Sep 2019 16:46:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 043AE21783;
 Tue, 24 Sep 2019 16:46:21 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 15/70] gpu: drm: radeon: Fix a possible
 null-pointer dereference in radeon_connector_set_property()
Date: Tue, 24 Sep 2019 12:44:54 -0400
Message-Id: <20190924164549.27058-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343582;
 bh=Z1FFPx6rPMa1a37d/+3Howuwq5SBIclNgoWtIm1mxP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfqeW5JLa1G89W8g6/JcGY23xbnPVEL4FEhFnLwSmUK0Qp1+TiHImgfk1tr+edzZu
 P8IPlPWvZs4qWPtrIefZOfkrttvw0x38HHPozl1pxFZOJ0rHqjGnxvC7LIRzdlxGgu
 7lDAkCMnbtQ451G9iko9K3XlHg0gdhDH1XdWWig8=
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
 Jia-Ju Bai <baijiaju1990@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhLUp1IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGYzZWI5YjhmNjdiYzI4NzgzZWRkYzE0MmFkODA1ZWJkYzUzZDYzMzkgXQoKSW4gcmFkZW9u
X2Nvbm5lY3Rvcl9zZXRfcHJvcGVydHkoKSwgdGhlcmUgaXMgYW4gaWYgc3RhdGVtZW50IG9uIGxp
bmUgNzQzCnRvIGNoZWNrIHdoZXRoZXIgY29ubmVjdG9yLT5lbmNvZGVyIGlzIE5VTEw6CiAgICBp
ZiAoY29ubmVjdG9yLT5lbmNvZGVyKQoKV2hlbiBjb25uZWN0b3ItPmVuY29kZXIgaXMgTlVMTCwg
aXQgaXMgdXNlZCBvbiBsaW5lIDc1NToKICAgIGlmIChjb25uZWN0b3ItPmVuY29kZXItPmNydGMp
CgpUaHVzLCBhIHBvc3NpYmxlIG51bGwtcG9pbnRlciBkZXJlZmVyZW5jZSBtYXkgb2NjdXIuCgpU
byBmaXggdGhpcyBidWcsIGNvbm5lY3Rvci0+ZW5jb2RlciBpcyBjaGVja2VkIGJlZm9yZSBiZWlu
ZyB1c2VkLgoKVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBTVENo
ZWNrIHdyaXR0ZW4gYnkgdXMuCgpTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxiYWlqaWFqdTE5
OTBAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggZGUxNzQ1YWRjY2NjYi4u
YzdmMmUwNzNhODJmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
Y29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYwpAQCAtNzUyLDcgKzc1Miw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2Nvbm5lY3Rvcl9zZXRf
cHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0CiAKIAkJcmFk
ZW9uX2VuY29kZXItPm91dHB1dF9jc2MgPSB2YWw7CiAKLQkJaWYgKGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YykgeworCQlpZiAoY29ubmVjdG9yLT5lbmNvZGVyICYmIGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YykgewogCQkJc3RydWN0IGRybV9jcnRjICpjcnRjICA9IGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YzsKIAkJCXN0cnVjdCByYWRlb25fY3J0YyAqcmFkZW9uX2NydGMgPSB0b19yYWRlb25f
Y3J0YyhjcnRjKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
