Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2BAFC958
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Nov 2019 15:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7556EB85;
	Thu, 14 Nov 2019 14:56:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D013B892AE;
 Thu, 14 Nov 2019 12:29:15 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 572A82C6538396F5B11F;
 Thu, 14 Nov 2019 20:29:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 20:29:04 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/display: remove set but not used variable
 'min_content'
Date: Thu, 14 Nov 2019 20:36:27 +0800
Message-ID: <1573734987-119703-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
References: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Nov 2019 14:56:23 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYzogSW4gZnVuY3Rp
b24gYnVpbGRfZnJlZXN5bmNfaGRyOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9jb2xvci9jb2xvcl9nYW1tYS5jOjgzMDoyMDogd2FybmluZzogdmFyaWFibGUgbWluX2NvbnRl
bnQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5v
dCB1c2VkIHNpbmNlIGNvbW1pdCA1MDU3NWViNWIzMzkgKCJkcm0vYW1kL2Rpc3BsYXk6Ck9ubHkg
dXNlIEVFVEYgd2hlbiBtYXhDTCA+IG1heCBkaXNwbGF5IikKClJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmlu
MTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9j
b2xvci9jb2xvcl9nYW1tYS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3Iv
Y29sb3JfZ2FtbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9y
L2NvbG9yX2dhbW1hLmMKaW5kZXggMWRlNDgwNS4uOWIxMjFiMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCkBA
IC05MzcsNyArOTM3LDYgQEAgc3RhdGljIGJvb2wgYnVpbGRfZnJlZXN5bmNfaGRyKHN0cnVjdCBw
d2xfZmxvYXRfZGF0YV9leCAqcmdiX3JlZ2FtbWEsCiAJc3RydWN0IGZpeGVkMzFfMzIgbWF4X2Rp
c3BsYXk7CiAJc3RydWN0IGZpeGVkMzFfMzIgbWluX2Rpc3BsYXk7CiAJc3RydWN0IGZpeGVkMzFf
MzIgbWF4X2NvbnRlbnQ7Ci0Jc3RydWN0IGZpeGVkMzFfMzIgbWluX2NvbnRlbnQ7CiAJc3RydWN0
IGZpeGVkMzFfMzIgY2xpcCA9IGRjX2ZpeHB0X29uZTsKIAlzdHJ1Y3QgZml4ZWQzMV8zMiBvdXRw
dXQ7CiAJYm9vbCB1c2VfZWV0ZiA9IGZhbHNlOwpAQCAtOTUxLDcgKzk1MCw2IEBAIHN0YXRpYyBi
b29sIGJ1aWxkX2ZyZWVzeW5jX2hkcihzdHJ1Y3QgcHdsX2Zsb2F0X2RhdGFfZXggKnJnYl9yZWdh
bW1hLAogCW1heF9kaXNwbGF5ID0gZGNfZml4cHRfZnJvbV9pbnQoZnNfcGFyYW1zLT5tYXhfZGlz
cGxheSk7CiAJbWluX2Rpc3BsYXkgPSBkY19maXhwdF9mcm9tX2ZyYWN0aW9uKGZzX3BhcmFtcy0+
bWluX2Rpc3BsYXksIDEwMDAwKTsKIAltYXhfY29udGVudCA9IGRjX2ZpeHB0X2Zyb21faW50KGZz
X3BhcmFtcy0+bWF4X2NvbnRlbnQpOwotCW1pbl9jb250ZW50ID0gZGNfZml4cHRfZnJvbV9mcmFj
dGlvbihmc19wYXJhbXMtPm1pbl9jb250ZW50LCAxMDAwMCk7CiAJc2RyX3doaXRlX2xldmVsID0g
ZGNfZml4cHRfZnJvbV9pbnQoZnNfcGFyYW1zLT5zZHJfd2hpdGVfbGV2ZWwpOwoKIAlpZiAoZnNf
cGFyYW1zLT5taW5fZGlzcGxheSA+IDEwMDApIC8vIGNhcCBhdCAwLjEgYXQgdGhlIGJvdHRvbQot
LQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
