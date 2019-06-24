Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1350D9E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4089B8F;
	Mon, 24 Jun 2019 14:12:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9189A57
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 11:16:31 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 722C6F7675D79B1559C7;
 Mon, 24 Jun 2019 19:16:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Jun 2019 19:16:22 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <dan.carpenter@oracle.com>, <julia.lawall@lip6.fr>
Subject: [PATCH -next v4] drm/amdgpu: return 'ret' immediately if failed in
 amdgpu_pmu_init
Date: Mon, 24 Jun 2019 19:23:18 +0800
Message-ID: <20190624112318.149299-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624094850.GQ18776@kadam>
References: <20190624094850.GQ18776@kadam>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:12:23 +0000
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
bml0KCkKCXIgPSBhbWRncHVfcG11X2luaXQoYWRldik7CgpGaXhlczogOWM3Yzg1ZjdlYTFmICgi
ZHJtL2FtZGdwdTogYWRkIHBtdSBjb3VudGVycyIpCgpTaWduZWQtb2ZmLWJ5OiBNYW8gV2VuYW4g
PG1hb3dlbmFuQGh1YXdlaS5jb20+Ci0tLQogdjEtPnYyOiBjaGFuZ2UgdGhlIHN1YmplY3QgZm9y
IHRoaXMgcGF0Y2g7IGNoYW5nZSB0aGUgaW5kZW50aW5nIHdoZW4gaXQgY2FsbHMgaW5pdF9wbXVf
YnlfdHlwZTsgdXNlIHRoZSB2YWx1ZSAncmV0JyBpbgogYW1kZ3B1X3BtdV9pbml0KCkuCiB2Mi0+
djM6IGNoYW5nZSB0aGUgc3ViamVjdCBmb3IgdGhpcyBwYXRjaDsgcmV0dXJuICdyZXQnIGltbWVk
aWF0ZWx5IGlmIGZhaWxlZCB0byBjYWxsIGluaXRfcG11X2J5X3R5cGUoKS4gCiB2My0+djQ6IGRl
bGV0ZSB0aGUgaW5kZW50aW5nIGZvciBpbml0X3BtdV9ieV90eXBlKCkgYXJndW1lbnRzLiBUaGUg
b3JpZ2luYWwgaW5kZW50aW5nIGlzIGNvcnJlY3QuCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtdS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwppbmRleCAwZTZkYmE5ZjYwZjAu
LmM5OGNmNzdhMzdmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwpA
QCAtMjU0LDYgKzI1NCw4IEBAIGludCBhbWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJCXJldCA9IGluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZfdjNfNl9hdHRyX2dy
b3VwcywKIAkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9kZiIsIFBFUkZfVFlQRV9BTURHUFVfREYs
CiAJCQkJICAgICAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTsKKwkJaWYgKHJldCkKKwkJCXJldHVy
biByZXQ7CiAKIAkJLyogb3RoZXIgcG11IHR5cGVzIGdvIGhlcmUqLwogCQlicmVhazsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
