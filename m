Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159721BF191
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Apr 2020 09:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59916EB7F;
	Thu, 30 Apr 2020 07:33:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657596EA84;
 Thu, 30 Apr 2020 03:33:45 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A6D77E5503C4AB093305;
 Thu, 30 Apr 2020 11:33:38 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 11:33:28 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/display: remove set but not used variable
 'pixel_width'
Date: Thu, 30 Apr 2020 11:40:32 +0800
Message-ID: <20200430034034.106824-3-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200430034034.106824-1-zhengbin13@huawei.com>
References: <20200430034034.106824-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:33:10 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jOjEzNzoxMTogd2FybmluZzog
dmFyaWFibGUg4oCYcGl4ZWxfd2lkdGjigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IDcwY2NhYjYwNDA0OSAo
ImRybS9hbWRncHUvZGlzcGxheToKQWRkIGNvcmUgZGMgc3VwcG9ydCBmb3IgRENOIiksIGJ1dCBu
ZXZlciB1c2VkLCBzbyByZW1vdmUgaXQuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2Np
QGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFpoZW5nIEJpbiA8emhlbmdiaW4xM0BodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9kcHAu
YyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jCmluZGV4IDBlNjgy
YjVhYTNlYi4uN2Y4NDU2Yjk5ODhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfZHBwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jCkBAIC0xMzQsMTMgKzEzNCw2IEBAIGJvb2wgZHBwMV9n
ZXRfb3B0aW1hbF9udW1iZXJfb2ZfdGFwcygKIAkJc3RydWN0IHNjYWxlcl9kYXRhICpzY2xfZGF0
YSwKIAkJY29uc3Qgc3RydWN0IHNjYWxpbmdfdGFwcyAqaW5fdGFwcykKIHsKLQl1aW50MzJfdCBw
aXhlbF93aWR0aDsKLQotCWlmIChzY2xfZGF0YS0+dmlld3BvcnQud2lkdGggPiBzY2xfZGF0YS0+
cmVjb3V0LndpZHRoKQotCQlwaXhlbF93aWR0aCA9IHNjbF9kYXRhLT5yZWNvdXQud2lkdGg7Ci0J
ZWxzZQotCQlwaXhlbF93aWR0aCA9IHNjbF9kYXRhLT52aWV3cG9ydC53aWR0aDsKLQogCS8qIFNv
bWUgQVNJQ3MgZG9lcyBub3Qgc3VwcG9ydCAgRlAxNiBzY2FsaW5nLCBzbyB3ZSByZWplY3QgbW9k
ZXMgcmVxdWlyZSB0aGlzKi8KIAlpZiAoc2NsX2RhdGEtPmZvcm1hdCA9PSBQSVhFTF9GT1JNQVRf
RlAxNiAmJgogCQlkcHAtPmNhcHMtPmRzY2xfZGF0YV9wcm9jX2Zvcm1hdCA9PSBEU0NMX0RBVEFf
UFJDRVNTSU5HX0ZJWEVEX0ZPUk1BVCAmJgotLQoyLjI2LjAuMTA2Lmc5ZmFkZWRkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
