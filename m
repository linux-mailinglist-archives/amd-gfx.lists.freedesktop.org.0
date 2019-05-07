Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1D1590F
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 07:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A978289CBC;
	Tue,  7 May 2019 05:33:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B6089CBA;
 Tue,  7 May 2019 05:33:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15D8720C01;
 Tue,  7 May 2019 05:33:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 27/99] drm/amdgpu: shadow in shadow_list without
 tbo.mem.start cause page fault in sriov TDR
Date: Tue,  7 May 2019 01:31:21 -0400
Message-Id: <20190507053235.29900-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207209;
 bh=bTMDjl5OERlZhmnbj15r+fyRb5JYDrqCCHTDy+GWvlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qWeB0TFRZhc/wNfPlgDfKsQBdQB0YsrXHFlinlS6ULAQmUIX40r3ZK9hizZhpWIW7
 22RMZLxEQgJcCysUIMfz0T4qoEhDsla3J9GRNPUImlZH2PFKzCEiUuHuTRvYpkXTxV
 Wn43PmqkmDgzUxa+E2auwaZN7oG8RxEto2cmCw4w=
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
Cc: Sasha Levin <sashal@kernel.org>, wentalou <Wentao.Lou@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogd2VudGFsb3UgPFdlbnRhby5Mb3VAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGI1
NzVmMTBkYmQ2Zjg0YzJjODc0NGZmMWY0ODZiZmFlMWU0ZjZmMzggXQoKc2hhZG93IHdhcyBhZGRl
ZCBpbnRvIHNoYWRvd19saXN0IGJ5IGFtZGdwdV9ib19jcmVhdGVfc2hhZG93LgptZWFud2hpbGUs
IHNoYWRvdy0+dGJvLm1lbSB3YXMgbm90IGZ1bGx5IGNvbmZpZ3VyZWQuCnRiby5tZW0gd291bGQg
YmUgZnVsbHkgY29uZmlndXJlZCBieSBhbWRncHVfdm1fc2RtYV9tYXBfdGFibGUgdW50aWwgY2Fs
bGluZyBhbWRncHVfdm1fY2xlYXJfYm8uCklmIHNyaW92IFREUiBvY2N1cnJlZCBiZXR3ZWVuIGFt
ZGdwdV9ib19jcmVhdGVfc2hhZG93IGFuZCBhbWRncHVfdm1fc2RtYV9tYXBfdGFibGUsCmFtZGdw
dV9kZXZpY2VfcmVjb3Zlcl92cmFtIHdvdWxkIGRlYWwgd2l0aCBzaGFkb3cgd2l0aG91dCB0Ym8u
bWVtLnN0YXJ0LgoKU2lnbmVkLW9mZi1ieTogV2VudGFvIExvdSA8V2VudGFvLkxvdUBhbWQuY29t
PgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwppbmRleCA3ZmYzYTI4ZmM5MDMuLjUzMzZiMmM5YjYxNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzE1MCw2ICszMTUwLDcgQEAgc3Rh
dGljIGludCBhbWRncHVfZGV2aWNlX3JlY292ZXJfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAogCQkvKiBObyBuZWVkIHRvIHJlY292ZXIgYW4gZXZpY3RlZCBCTyAqLwogCQlpZiAo
c2hhZG93LT50Ym8ubWVtLm1lbV90eXBlICE9IFRUTV9QTF9UVCB8fAorCQkgICAgc2hhZG93LT50
Ym8ubWVtLnN0YXJ0ID09IEFNREdQVV9CT19JTlZBTElEX09GRlNFVCB8fAogCQkgICAgc2hhZG93
LT5wYXJlbnQtPnRiby5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1ZSQU0pCiAJCQljb250aW51ZTsK
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
