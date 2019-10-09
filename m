Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F8D081E
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 09:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080C6E2B6;
	Wed,  9 Oct 2019 07:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B65F6E8DC;
 Wed,  9 Oct 2019 06:18:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 959D1164944C39E07C3B;
 Wed,  9 Oct 2019 14:18:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 14:18:02 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/display: Remove set but not used variable 'value0'
Date: Wed, 9 Oct 2019 14:25:11 +0800
Message-ID: <1570602312-49690-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:16:49 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmM6IEluIGZ1bmN0aW9u
IGRjZTExMF9saW5rX2VuY29kZXJfdXBkYXRlX21zdF9zdHJlYW1fYWxsb2NhdGlvbl90YWJsZToK
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmM6MTIy
OToxMTogd2FybmluZzogdmFyaWFibGUgdmFsdWUwIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBub3QgdXNlZCBzaW5jZSBjb21taXQgNDU2MjIzNmIz
YmMwICgiZHJtL2FtZC9kYzoKQWRkIGRjIGRpc3BsYXkgZHJpdmVyICh2MikiKQoKUmVwb3J0ZWQt
Ynk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2Jp
biA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5jCmluZGV4IDg1MjdjY2UuLmUxOGZl
NjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2xp
bmtfZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X2xpbmtfZW5jb2Rlci5jCkBAIC0xMjI5LDcgKzEyMjksNiBAQCB2b2lkIGRjZTExMF9saW5rX2Vu
Y29kZXJfdXBkYXRlX21zdF9zdHJlYW1fYWxsb2NhdGlvbl90YWJsZSgKIAljb25zdCBzdHJ1Y3Qg
bGlua19tc3Rfc3RyZWFtX2FsbG9jYXRpb25fdGFibGUgKnRhYmxlKQogewogCXN0cnVjdCBkY2Ux
MTBfbGlua19lbmNvZGVyICplbmMxMTAgPSBUT19EQ0UxMTBfTElOS19FTkMoZW5jKTsKLQl1aW50
MzJfdCB2YWx1ZTAgPSAwOwogCXVpbnQzMl90IHZhbHVlMSA9IDA7CiAJdWludDMyX3QgdmFsdWUy
ID0gMDsKIAl1aW50MzJfdCBzbG90cyA9IDA7CkBAIC0xMzMwLDcgKzEzMjksNyBAQCB2b2lkIGRj
ZTExMF9saW5rX2VuY29kZXJfdXBkYXRlX21zdF9zdHJlYW1fYWxsb2NhdGlvbl90YWJsZSgKIAlk
byB7CiAJCXVkZWxheSgxMCk7CgotCQl2YWx1ZTAgPSBSRUdfUkVBRChEUF9NU0VfU0FUX1VQREFU
RSk7CisJCVJFR19SRUFEKERQX01TRV9TQVRfVVBEQVRFKTsKCiAJCVJFR19HRVQoRFBfTVNFX1NB
VF9VUERBVEUsCiAJCQkJRFBfTVNFX1NBVF9VUERBVEUsICZ2YWx1ZTEpOwotLQoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
