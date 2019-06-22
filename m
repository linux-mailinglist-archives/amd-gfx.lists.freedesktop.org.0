Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC434F636
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1216E040;
	Sat, 22 Jun 2019 14:34:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF64E6E972
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 12:58:47 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2EA12DE6D53BC5843FA8;
 Sat, 22 Jun 2019 20:58:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 22 Jun 2019 20:58:32 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <dan.carpenter@oracle.com>, <julia.lawall@lip6.fr>
Subject: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
Date: Sat, 22 Jun 2019 21:05:27 +0800
Message-ID: <20190622130527.182022-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622104318.GT28859@kadam>
References: <20190622104318.GT28859@kadam>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 22 Jun 2019 14:34:27 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Mao Wenan <maowenan@huawei.com>
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
aWNoIHdpbGwgdXNlIHRoZSByZXR1cm4gdmFsdWUuIFNvIGl0IHJldHVybnMgJ3JldCcgZm9yIGNh
bGxlci4KYW1kZ3B1X2RldmljZV9pbml0KCkKCXIgPSBhbWRncHVfcG11X2luaXQoYWRldik7CgpG
aXhlczogOWM3Yzg1ZjdlYTFmICgiZHJtL2FtZGdwdTogYWRkIHBtdSBjb3VudGVycyIpCgpTaWdu
ZWQtb2ZmLWJ5OiBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Ci0tLQogdjEtPnYyOiBj
aGFuZ2UgdGhlIHN1YmplY3QgZm9yIHRoaXMgcGF0Y2g7IGNoYW5nZSB0aGUgaW5kZW50aW5nIHdo
ZW4gaXQgY2FsbHMgaW5pdF9wbXVfYnlfdHlwZTsgdXNlIHRoZSB2YWx1ZSAncmV0JyBpbgogYW1k
Z3B1X3BtdV9pbml0KCkuCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKaW5kZXggMGU2ZGJhOS4u
MTQ1ZTcyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
dS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwpAQCAtMjUy
LDggKzI1Miw4IEBAIGludCBhbWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAkJLyogaW5pdCBkZiAqLwogCQlyZXQgPSBpbml0X3Bt
dV9ieV90eXBlKGFkZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsCi0JCQkJICAgICAgICJERiIsICJh
bWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLAotCQkJCSAgICAgICBERl9WM182X01BWF9D
T1VOVEVSUyk7CisJCQkJCQkJICAgIkRGIiwgImFtZGdwdV9kZiIsIFBFUkZfVFlQRV9BTURHUFVf
REYsCisJCQkJCQkJICAgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwogCiAJCS8qIG90aGVyIHBtdSB0
eXBlcyBnbyBoZXJlKi8KIAkJYnJlYWs7CkBAIC0yNjEsNyArMjYxLDcgQEAgaW50IGFtZGdwdV9w
bXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJuIDA7CiAJfQogCi0J
cmV0dXJuIDA7CisJcmV0dXJuIHJldDsKIH0KIAogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
