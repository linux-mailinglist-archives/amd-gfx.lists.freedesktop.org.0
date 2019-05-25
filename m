Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDAC2A708
	for <lists+amd-gfx@lfdr.de>; Sat, 25 May 2019 22:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922B76E170;
	Sat, 25 May 2019 20:47:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642B26E15E;
 Sat, 25 May 2019 14:35:07 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 00D48BE49C145C661C87;
 Sat, 25 May 2019 22:35:03 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 22:34:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Tony.Cheng@amd.com>
Subject: [PATCH -next] drm/amd/display: Remove set but not used variable
 'pixel_width'
Date: Sat, 25 May 2019 22:34:33 +0800
Message-ID: <20190525143433.20000-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 25 May 2019 20:47:47 +0000
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
Cc: amd-gfx@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9kcHAuYzogSW4gZnVu
Y3Rpb24gZHBwX2dldF9vcHRpbWFsX251bWJlcl9vZl90YXBzOgpkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jOjEzNzoxMTogd2FybmluZzog
dmFyaWFibGUgcGl4ZWxfd2lkdGggc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KCkl0IGlzIG5ldmVyIHVzZWQgYW5kIGNhbiBiZSByZW1vdmUuCgpTaWduZWQtb2Zm
LWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jIHwgNyAtLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfZHBwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfZHBwLmMKaW5kZXggNmY0YjI0NzU2MzIzLi5kOTYzZDM2MTY5NmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9k
cHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfZHBw
LmMKQEAgLTEzNCwxMyArMTM0LDYgQEAgc3RhdGljIGJvb2wgZHBwX2dldF9vcHRpbWFsX251bWJl
cl9vZl90YXBzKAogCQlzdHJ1Y3Qgc2NhbGVyX2RhdGEgKnNjbF9kYXRhLAogCQljb25zdCBzdHJ1
Y3Qgc2NhbGluZ190YXBzICppbl90YXBzKQogewotCXVpbnQzMl90IHBpeGVsX3dpZHRoOwotCi0J
aWYgKHNjbF9kYXRhLT52aWV3cG9ydC53aWR0aCA+IHNjbF9kYXRhLT5yZWNvdXQud2lkdGgpCi0J
CXBpeGVsX3dpZHRoID0gc2NsX2RhdGEtPnJlY291dC53aWR0aDsKLQllbHNlCi0JCXBpeGVsX3dp
ZHRoID0gc2NsX2RhdGEtPnZpZXdwb3J0LndpZHRoOwotCiAJLyogU29tZSBBU0lDcyBkb2VzIG5v
dCBzdXBwb3J0ICBGUDE2IHNjYWxpbmcsIHNvIHdlIHJlamVjdCBtb2RlcyByZXF1aXJlIHRoaXMq
LwogCWlmIChzY2xfZGF0YS0+Zm9ybWF0ID09IFBJWEVMX0ZPUk1BVF9GUDE2ICYmCiAJCWRwcC0+
Y2Fwcy0+ZHNjbF9kYXRhX3Byb2NfZm9ybWF0ID09IERTQ0xfREFUQV9QUkNFU1NJTkdfRklYRURf
Rk9STUFUICYmCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
