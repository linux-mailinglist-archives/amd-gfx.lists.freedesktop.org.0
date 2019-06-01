Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39E329FF
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFADC89BFF;
	Mon,  3 Jun 2019 07:46:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C50989B30;
 Sat,  1 Jun 2019 07:14:05 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 92328B4C434BBCF60B04;
 Sat,  1 Jun 2019 15:13:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Sat, 1 Jun 2019 15:13:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <hanghong.ma@amd.com>, <Jun.Lei@amd.com>, <Wenjing.Liu@amd.com>,
 <Krunoslav.Kovac@amd.com>, <nicholas.kazlauskas@amd.com>,
 <David.Francis@amd.com>, <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH -next] drm/amd/display: Use kmemdup in dc_copy_stream()
Date: Sat, 1 Jun 2019 07:22:08 +0000
Message-ID: <20190601072208.193673-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:46:53 +0000
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
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIGttZW1kdXAgcmF0aGVyIHRoYW4gZHVwbGljYXRpbmcgaXRzIGltcGxlbWVudGF0aW9uLgoK
RGV0ZWN0ZWQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19zdHJlYW0uYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfc3RyZWFtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19zdHJlYW0uYwppbmRleCBhMDAyZTY5MDgxNGYuLmIxNjZjNzMyYjUzMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKQEAgLTE2Nywx
MiArMTY3LDExIEBAIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKmRjX2NvcHlfc3RyZWFtKGNvbnN0
IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSkKIHsKIAlzdHJ1Y3QgZGNfc3RyZWFtX3N0
YXRlICpuZXdfc3RyZWFtOwogCi0JbmV3X3N0cmVhbSA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBk
Y19zdHJlYW1fc3RhdGUpLCBHRlBfS0VSTkVMKTsKKwluZXdfc3RyZWFtID0ga21lbWR1cChzdHJl
YW0sIHNpemVvZihzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlKSwKKwkJCSAgICAgR0ZQX0tFUk5FTCk7
CiAJaWYgKCFuZXdfc3RyZWFtKQogCQlyZXR1cm4gTlVMTDsKIAotCW1lbWNweShuZXdfc3RyZWFt
LCBzdHJlYW0sIHNpemVvZihzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlKSk7Ci0KIAlpZiAobmV3X3N0
cmVhbS0+c2luaykKIAkJZGNfc2lua19yZXRhaW4obmV3X3N0cmVhbS0+c2luayk7CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
