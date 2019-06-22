Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46B4F638
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 16:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ABB6E056;
	Sat, 22 Jun 2019 14:34:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 930 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jun 2019 03:11:54 UTC
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089486E950
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 03:11:54 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0B1AB4389754AB1163D6;
 Sat, 22 Jun 2019 10:56:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Sat, 22 Jun 2019 10:56:12 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>
Subject: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
Date: Sat, 22 Jun 2019 11:03:14 +0800
Message-ID: <20190622030314.169640-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
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

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcG11
X2luaXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzoyNDk6Njog
d2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1
dC1zZXQtdmFyaWFibGVdCiAgaW50IHJldCA9IDA7CiAgICAgIF4KCkl0IGlzIG5ldmVyIHVzZWQg
c2luY2UgaW50cm9kdWN0aW9uIGluIDljN2M4NWY3ZWExZiAoImRybS9hbWRncHU6IGFkZCBwbXUg
Y291bnRlcnMiKQoKU2lnbmVkLW9mZi1ieTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyB8IDQgKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwppbmRleCAwZTZkYmE5Li4wYmY0ZGQ5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jCkBAIC0yNDYsMTIgKzI0NiwxMCBA
QCBzdGF0aWMgaW50IGluaXRfcG11X2J5X3R5cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAvKiBpbml0IGFtZGdwdV9wbXUgKi8KIGludCBhbWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHJldCA9IDA7Ci0KIAlzd2l0Y2ggKGFkZXYtPmFzaWNf
dHlwZSkgewogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJCS8qIGluaXQgZGYgKi8KLQkJcmV0ID0gaW5p
dF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBzLAorCQlpbml0X3BtdV9ieV90
eXBlKGFkZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsCiAJCQkJICAgICAgICJERiIsICJhbWRncHVf
ZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLAogCQkJCSAgICAgICBERl9WM182X01BWF9DT1VOVEVS
Uyk7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
