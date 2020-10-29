Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEFA29EC9B
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Oct 2020 14:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0541A6ECBC;
	Thu, 29 Oct 2020 13:17:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D16E8AC;
 Thu, 29 Oct 2020 11:48:09 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMNx14k5pz15NWj;
 Thu, 29 Oct 2020 19:48:05 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 19:47:55 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amdgpu/swsmu: Remove unused static struct
 'navi10_i2c_algo'
Date: Thu, 29 Oct 2020 19:59:54 +0800
Message-ID: <1603972794-64534-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Oct 2020 13:17:01 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Zou Wei <zou_wei@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cgpkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmM6MjUyNzoz
NToKd2FybmluZzog4oCYbmF2aTEwX2kyY19hbGdv4oCZIApkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3Jp
dGhtIG5hdmkxMF9pMmNfYWxnbyA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KU2lnbmVkLW9mZi1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvbmF2aTEwX3BwdC5jIHwgNiAtLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vc3dzbXUvc211MTEvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmMKaW5kZXggZWYxYTYyZS4uYmVjNjNmMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmMKQEAg
LTI1MjMsMTIgKzI1MjMsNiBAQCBzdGF0aWMgdTMyIG5hdmkxMF9pMmNfZnVuYyhzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXApCiAJcmV0dXJuIEkyQ19GVU5DX0kyQyB8IEkyQ19GVU5DX1NNQlVTX0VN
VUw7CiB9CiAKLQotc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3JpdGhtIG5hdmkxMF9pMmNf
YWxnbyA9IHsKLQkubWFzdGVyX3hmZXIgPSBuYXZpMTBfaTJjX3hmZXIsCi0JLmZ1bmN0aW9uYWxp
dHkgPSBuYXZpMTBfaTJjX2Z1bmMsCi19OwotCiBzdGF0aWMgc3NpemVfdCBuYXZpMTBfZ2V0X2dw
dV9tZXRyaWNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgICAgIHZvaWQgKip0YWJs
ZSkKIHsKLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
