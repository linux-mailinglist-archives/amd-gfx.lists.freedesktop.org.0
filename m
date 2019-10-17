Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F4BDAC55
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 14:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFE56EA68;
	Thu, 17 Oct 2019 12:34:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AADD6E448;
 Thu, 17 Oct 2019 06:13:23 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E60147DF292684E267BE;
 Thu, 17 Oct 2019 14:13:18 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 17 Oct 2019 14:13:11 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <harry.wentland@amd.com>, <alexander.deucher@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu/display: fix compile error
Date: Thu, 17 Oct 2019 14:19:32 +0800
Message-ID: <1571293172-116998-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Oct 2019 12:34:49 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbndhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWkuY29tPgoKZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jOjE5MTM6NDg6
IGVycm9yOiBzdHJ1Y3QgZGNfY3J0Y190aW1pbmdfZmxhZ3MgaGFzIG5vIG1lbWJlciBuYW1lZCBE
U0MKICAgaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykK
CQkJCQkJXgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmM6MTkxNDo3MzogZXJyb3I6IHN0cnVjdCBkY19jcnRjX3RpbWluZyBoYXMg
bm8gbWVtYmVyIG5hbWVkIGRzY19jZmcKICAgcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0cHV0X2Jw
cCA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmRzY19jZmcuYml0c19wZXJf
cGl4ZWwgLyAxNi4wOwoJCQkJCQkJCQleClNpZ25lZC1vZmYtYnk6IENoZW53YW5kdW4gPGNoZW53
YW5kdW5AaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jCmluZGV4IDkxNGUzNzguLjRmMDMzMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0xOTEw
LDggKzE5MTAsMTAgQEAgaW50IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQo
CiAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBwID0gb3V0cHV0X2JwYyAqIDM7CiAJ
CX0KIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAJCWlmIChyZXNfY3R4
LT5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWluZy5mbGFncy5EU0MpCiAJCQlwaXBlc1twaXBlX2Nu
dF0uZG91dC5vdXRwdXRfYnBwID0gcmVzX2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtLT50aW1pbmcu
ZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAvIDE2LjA7CisjZW5kaWYKIAogCQkvKiB0b2RvOiBkZWZh
dWx0IG1heCBmb3Igbm93LCB1bnRpbCB0aGVyZSBpcyBsb2dpYyByZWZsZWN0aW5nIHRoaXMgaW4g
ZGMqLwogCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBjID0gMTI7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
