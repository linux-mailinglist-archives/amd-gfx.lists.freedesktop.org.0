Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD7263EC1
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Sep 2020 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645D6E2E0;
	Thu, 10 Sep 2020 07:29:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064A989FA9;
 Thu, 10 Sep 2020 02:55:46 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 60DAF3647B9752C439E5;
 Thu, 10 Sep 2020 10:55:41 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 10:55:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Yong.Zhao@amd.com>
Subject: [PATCH -next] drm/amdkfd: Fix -Wunused-const-variable warning
Date: Thu, 10 Sep 2020 10:55:32 +0800
Message-ID: <20200910025532.19616-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:29:37 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgS0ZEX1NVUFBPUlRfSU9NTVVfVjIgaXMgbm90IHNldCwgZ2NjIHdhcm5zOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9kZXZpY2UuYzoxMjE6Mzc6IHdhcm5pbmc6
IOKAmHJhdmVuX2RldmljZV9pbmZv4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByYXZl
bl9kZXZpY2VfaW5mbyA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+CgpNb3ZlIGl0IHRvIGlmZGVmIGJsb2NrLgoKU2lnbmVkLW9mZi1ieTog
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YwppbmRleCAwZTcxYTA1NDNmOTguLmNhZTRkZjI1OWUyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtMTE2LDcgKzExNiw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2ZkX2RldmljZV9pbmZvIGNhcnJpem9fZGV2aWNlX2luZm8gPSB7CiAJLm51bV94Z21pX3Nk
bWFfZW5naW5lcyA9IDAsCiAJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gMiwKIH07Ci0j
ZW5kaWYKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gcmF2ZW5fZGV2aWNl
X2luZm8gPSB7CiAJLmFzaWNfZmFtaWx5ID0gQ0hJUF9SQVZFTiwKQEAgLTEzNSw2ICsxMzQsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByYXZlbl9kZXZpY2VfaW5mbyA9
IHsKIAkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwKIAkubnVtX3NkbWFfcXVldWVzX3Blcl9l
bmdpbmUgPSAyLAogfTsKKyNlbmRpZgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2Vf
aW5mbyBoYXdhaWlfZGV2aWNlX2luZm8gPSB7CiAJLmFzaWNfZmFtaWx5ID0gQ0hJUF9IQVdBSUks
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
