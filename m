Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF2AC1BE5
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 09:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298F96E398;
	Mon, 30 Sep 2019 07:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 986 seconds by postgrey-1.36 at gabe;
 Sun, 29 Sep 2019 12:49:58 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7C89E69;
 Sun, 29 Sep 2019 12:49:58 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E1906D8485D84484684B;
 Sun, 29 Sep 2019 20:33:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sun, 29 Sep 2019
 20:33:22 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH V2] drm/amdgpu: remove set but not used variable 'pipe'
Date: Sun, 29 Sep 2019 20:40:16 +0800
Message-ID: <1569760816-60192-1-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 30 Sep 2019 07:03:26 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmM6IEluIGZ1bmN0aW9uCuKAmGFtZGdwdV9nZnhf
Z3JhcGhpY3NfcXVldWVfYWNxdWlyZeKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5jOjIzNDoxNjogd2FybmluZzoKdmFyaWFibGUg4oCYcGlwZeKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgc28g
Y2FuIGJlIHJlbW92ZWQuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5j
b20+ClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmMKaW5kZXggZjliZWYzMS4uYzEwMzVhMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwpAQCAtMjMxLDEyICsyMzEsMTAgQEAgdm9pZCBhbWRn
cHVfZ2Z4X2NvbXB1dGVfcXVldWVfYWNxdWlyZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAogdm9pZCBhbWRncHVfZ2Z4X2dyYXBoaWNzX3F1ZXVlX2FjcXVpcmUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiB7Ci0JaW50IGksIHF1ZXVlLCBwaXBlLCBtZTsKKwlpbnQgaSwgcXVldWUs
IG1lOwogCiAJZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfR0ZYX1FVRVVFUzsgKytpKSB7CiAJ
CXF1ZXVlID0gaSAlIGFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3BpcGU7Ci0JCXBpcGUgPSAo
aSAvIGFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3BpcGUpCi0JCQklIGFkZXYtPmdmeC5tZS5u
dW1fcGlwZV9wZXJfbWU7CiAJCW1lID0gKGkgLyBhZGV2LT5nZngubWUubnVtX3F1ZXVlX3Blcl9w
aXBlKQogCQkgICAgICAvIGFkZXYtPmdmeC5tZS5udW1fcGlwZV9wZXJfbWU7CiAKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
