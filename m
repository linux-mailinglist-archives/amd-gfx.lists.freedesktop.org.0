Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F726F6A6
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Sep 2020 09:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF156ECBA;
	Fri, 18 Sep 2020 07:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF956EC90
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 03:17:50 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 91A8980447C78EE05DFC;
 Fri, 18 Sep 2020 11:17:45 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 11:17:35 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <amd-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/amd/display: remove unused variable in dcn30_hwseq.c
Date: Fri, 18 Sep 2020 11:16:10 +0800
Message-ID: <20200918031610.2466524-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:21:35 +0000
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
Cc: alexander.deucher@amd.com, yangyingliang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHRoZSBjb21waWxlIHdhcm5pbmc6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNuMzAvZGNuMzBfaHdzZXEuYzozMjI6Mjc6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mG9wdGPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICBz
dHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YzsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjMwL2RjbjMw
X2h3c2VxLmM6NjQxOjc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGlzX2Rw4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgYm9vbCBpc19kcDsKICAgICAgIF5+
fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1v
ZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwL2RjbjMwX2h3c2VxLmMgfCA1IC0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzAvZGNuMzBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24zMC9kY24zMF9od3NlcS5jCmluZGV4IDIwNDc3M2ZmYzM3Ni4u
Zjg3NWIxZTk4ZGQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMzAvZGNuMzBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMzAvZGNuMzBfaHdzZXEuYwpAQCAtMzE5LDEzICszMTksMTAgQEAgdm9pZCBkY24zMF9lbmFi
bGVfd3JpdGViYWNrKAogewogCXN0cnVjdCBkd2JjICpkd2I7CiAJc3RydWN0IG1jaWZfd2IgKm1j
aWZfd2I7Ci0Jc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKm9wdGM7CiAKIAlkd2IgPSBkYy0+cmVz
X3Bvb2wtPmR3YmNbd2JfaW5mby0+ZHdiX3BpcGVfaW5zdF07CiAJbWNpZl93YiA9IGRjLT5yZXNf
cG9vbC0+bWNpZl93Ylt3Yl9pbmZvLT5kd2JfcGlwZV9pbnN0XTsKIAotCS8qIHNldCB0aGUgT1BU
QyBzb3VyY2UgbXV4ICovCi0Jb3B0YyA9IGRjLT5yZXNfcG9vbC0+dGltaW5nX2dlbmVyYXRvcnNb
ZHdiLT5vdGdfaW5zdF07CiAJRENfTE9HX0RXQigiJXMgZHdiX3BpcGVfaW5zdCA9ICVkLCBtcGNj
X2luc3QgPSAlZCIsXAogCQlfX2Z1bmNfXywgd2JfaW5mby0+ZHdiX3BpcGVfaW5zdCxcCiAJCXdi
X2luZm8tPm1wY2NfaW5zdCk7CkBAIC02MzgsNyArNjM1LDYgQEAgdm9pZCBkY24zMF9zZXRfYXZt
dXRlKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5hYmxlKQogdm9pZCBkY24zMF91
cGRhdGVfaW5mb19mcmFtZShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogewogCWJvb2wgaXNf
aGRtaV90bWRzOwotCWJvb2wgaXNfZHA7CiAKIAlBU1NFUlQocGlwZV9jdHgtPnN0cmVhbSk7CiAK
QEAgLTY0Niw3ICs2NDIsNiBAQCB2b2lkIGRjbjMwX3VwZGF0ZV9pbmZvX2ZyYW1lKHN0cnVjdCBw
aXBlX2N0eCAqcGlwZV9jdHgpCiAJCXJldHVybjsgIC8qIHRoaXMgaXMgbm90IHJvb3QgcGlwZSAq
LwogCiAJaXNfaGRtaV90bWRzID0gZGNfaXNfaGRtaV90bWRzX3NpZ25hbChwaXBlX2N0eC0+c3Ry
ZWFtLT5zaWduYWwpOwotCWlzX2RwID0gZGNfaXNfZHBfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0t
PnNpZ25hbCk7CiAKIAlpZiAoIWlzX2hkbWlfdG1kcykKIAkJcmV0dXJuOwotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
