Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE457CDA80
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 05:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247489450;
	Mon,  7 Oct 2019 03:05:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB46E037;
 Sun,  6 Oct 2019 07:44:28 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1C11CD79D031C936330;
 Sun,  6 Oct 2019 15:44:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Sun, 6 Oct 2019 15:44:14 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <le.ma@amd.com>, <Yong.Zhao@amd.com>, <Trigger.Huang@amd.com>,
 <tao.zhou1@amd.com>, <Hawking.Zhang@amd.com>, <Felix.Kuehling@amd.com>
Subject: [PATCH -next] drm/amdgpu: remove duplicated include from mmhub_v1_0.c
Date: Sun, 6 Oct 2019 07:44:04 +0000
Message-ID: <20191006074404.48416-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 07 Oct 2019 03:05:44 +0000
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

UmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92MV8wLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCmluZGV4IDRjN2U4YzY0YTk0ZS4uNjk2NWUxZTZm
YTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCkBAIC0zMSw3ICsz
MSw2IEBACiAjaW5jbHVkZSAidmVnYTEwX2VudW0uaCIKIAogI2luY2x1ZGUgInNvYzE1X2NvbW1v
bi5oIgotI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKIAogI2RlZmluZSBtbURBR0IwX0NOVExfTUlT
QzJfUlYgMHgwMDhmCiAjZGVmaW5lIG1tREFHQjBfQ05UTF9NSVNDMl9SVl9CQVNFX0lEWCAwCgoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
