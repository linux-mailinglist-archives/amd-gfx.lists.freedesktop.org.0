Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C46502DF
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 09:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899C789AA2;
	Mon, 24 Jun 2019 07:15:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FC2897B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 03:38:48 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 61310B675E14D312AA48;
 Mon, 24 Jun 2019 11:38:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Jun 2019 11:38:34 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <dan.carpenter@oracle.com>, <julia.lawall@lip6.fr>
Subject: [PATCH -next v3] drm/amdgpu: return 'ret' immediately if failed in
 amdgpu_pmu_init
Date: Mon, 24 Jun 2019 11:45:32 +0800
Message-ID: <20190624034532.135201-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <alpine.DEB.2.21.1906230809400.4961@hadrien>
References: <alpine.DEB.2.21.1906230809400.4961@hadrien>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 Jun 2019 07:15:51 +0000
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
Cc: jonathan.kim@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Mao Wenan <maowenan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgb25lIHdhcm5pbmc6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
bXUuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X3BtdV9pbml04oCZOgpkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG11LmM6MjQ5OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogIGludCByZXQg
PSAwOwogICAgICBeCmFtZGdwdV9wbXVfaW5pdCgpIGlzIGNhbGxlZCBieSBhbWRncHVfZGV2aWNl
X2luaXQoKSBpbiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMsCndo
aWNoIHdpbGwgdXNlIHRoZSByZXR1cm4gdmFsdWUuIFNvIGl0IHNob3VsZCByZXR1cm4gJ3JldCcg
aW1tZWRpYXRlbHkgaWYgaW5pdF9wbXVfYnlfdHlwZSgpIGZhaWxlZC4KYW1kZ3B1X2RldmljZV9p
bml0KCkKCXIgPSBhbWRncHVfcG11X2luaXQoYWRldik7CgpUaGlzIHBhdGNoIGlzIGFsc28gdG8g
dXBkYXRlIHRoZSBpbmRlbnRpbmcgb24gdGhlIGFyZ3VtZW50cyBzbyB0aGV5IGxpbmUgdXAgd2l0
aCB0aGUgJygnLgoKRml4ZXM6IDljN2M4NWY3ZWExZiAoImRybS9hbWRncHU6IGFkZCBwbXUgY291
bnRlcnMiKQoKU2lnbmVkLW9mZi1ieTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWkuY29tPgot
LS0KIHYxLT52MjogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlzIHBhdGNoOyBjaGFuZ2UgdGhl
IGluZGVudGluZyB3aGVuIGl0IGNhbGxzIGluaXRfcG11X2J5X3R5cGU7IHVzZSB0aGUgdmFsdWUg
J3JldCcgaW4KIGFtZGdwdV9wbXVfaW5pdCgpLgogdjItPnYzOiBjaGFuZ2UgdGhlIHN1YmplY3Qg
Zm9yIHRoaXMgcGF0Y2g7IHJldHVybiAncmV0JyBpbW1lZGlhdGVseSBpZiBmYWlsZWQgdG8gY2Fs
bCBpbml0X3BtdV9ieV90eXBlKCkuIAoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbXUuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG11LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKaW5kZXgg
MGU2ZGJhOS4uYjcwMjMyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUu
YwpAQCAtMjUyLDggKzI1MiwxMSBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJCS8qIGluaXQgZGYgKi8KIAkJcmV0
ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAotCQkJCSAgICAg
ICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9ERiwKLQkJCQkgICAgICAgREZf
VjNfNl9NQVhfQ09VTlRFUlMpOworCQkJCQkJCSAgICJERiIsICJhbWRncHVfZGYiLAorCQkJCQkJ
CSAgIFBFUkZfVFlQRV9BTURHUFVfREYsCisJCQkJCQkJICAgREZfVjNfNl9NQVhfQ09VTlRFUlMp
OworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKIAogCQkvKiBvdGhlciBwbXUgdHlwZXMgZ28g
aGVyZSovCiAJCWJyZWFrOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
