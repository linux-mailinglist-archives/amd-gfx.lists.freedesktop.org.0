Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D935A62E7
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 09:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7872B896AF;
	Tue,  3 Sep 2019 07:43:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B118975F
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 06:18:08 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 92518136F1EDB68BA3F9;
 Tue,  3 Sep 2019 14:18:05 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Sep 2019 14:17:59 +0800
From: zhong jiang <zhongjiang@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: remove the redundant null check
Date: Tue, 3 Sep 2019 14:15:05 +0800
Message-ID: <1567491305-18320-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Sep 2019 07:43:23 +0000
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
Cc: David1.Zhou@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 zhongjiang@huawei.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZGVidWdmc19yZW1vdmUgYW5kIGtmcmVlIGhhcyB0YWtlbiB0aGUgbnVsbCBjaGVjayBpbiBhY2Nv
dW50LgpoZW5jZSBpdCBpcyB1bm5lY2Vzc2FyeSB0byBjaGVjayBpdC4gSnVzdCByZW1vdmUgdGhl
IGNvbmRpdGlvbi4KTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiB6aG9uZyBq
aWFuZyA8emhvbmdqaWFuZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RlYnVnZnMuYwppbmRleCA1NjUyY2M3Li5jYjk0NjI3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTEwNzcsOCArMTA3Nyw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RlYnVnZnNfaWJfcHJlZW1wdCh2b2lkICpkYXRhLCB1NjQgdmFsKQogCiAJ
dHRtX2JvX3VubG9ja19kZWxheWVkX3dvcmtxdWV1ZSgmYWRldi0+bW1hbi5iZGV2LCByZXNjaGVk
KTsKIAotCWlmIChmZW5jZXMpCi0JCWtmcmVlKGZlbmNlcyk7CisJa2ZyZWUoZmVuY2VzKTsKIAog
CXJldHVybiAwOwogfQpAQCAtMTEwMyw4ICsxMTAyLDcgQEAgaW50IGFtZGdwdV9kZWJ1Z2ZzX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIHZvaWQgYW1kZ3B1X2RlYnVnZnNfcHJl
ZW1wdF9jbGVhbnVwKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCWlmIChhZGV2LT5k
ZWJ1Z2ZzX3ByZWVtcHQpCi0JCWRlYnVnZnNfcmVtb3ZlKGFkZXYtPmRlYnVnZnNfcHJlZW1wdCk7
CisJZGVidWdmc19yZW1vdmUoYWRldi0+ZGVidWdmc19wcmVlbXB0KTsKIH0KIAogI2Vsc2UKLS0g
CjEuNy4xMi40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
