Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B54FC955
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Nov 2019 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130296EB17;
	Thu, 14 Nov 2019 14:56:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8427B892AE;
 Thu, 14 Nov 2019 12:29:17 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7639C670AF010416ED84;
 Thu, 14 Nov 2019 20:29:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 20:29:03 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/display: remove set but not used variable 'bp' in
 bios_parser.c
Date: Thu, 14 Nov 2019 20:36:26 +0800
Message-ID: <1573734987-119703-4-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYzogSW4gZnVuY3Rpb24gYmlv
c19nZXRfYm9hcmRfbGF5b3V0X2luZm86CmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9i
aW9zL2Jpb3NfcGFyc2VyLmM6Mjc0MzoyMjogd2FybmluZzogdmFyaWFibGUgYnAgc2V0IGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkg
Y29tbWl0IDFlZWVkYmNjMjBkNiAoImRybS9hbWQvZGlzcGxheToKZ2V0IGJvYXJkIGxheW91dCBm
b3IgZWRpZCBlbXVsYXRpb24iKSwgYnV0IG5ldmVyIHVzZWQsCnNvIHJlbW92ZSBpdC4KClJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhl
bmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jp
b3MvYmlvc19wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jp
b3NfcGFyc2VyLmMKaW5kZXggODIzODQzYy4uYzM0Nzk3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jCkBAIC0yNzM5LDcgKzI3Mzks
NiBAQCBzdGF0aWMgZW51bSBicF9yZXN1bHQgYmlvc19nZXRfYm9hcmRfbGF5b3V0X2luZm8oCiAJ
c3RydWN0IGJvYXJkX2xheW91dF9pbmZvICpib2FyZF9sYXlvdXRfaW5mbykKIHsKIAl1bnNpZ25l
ZCBpbnQgaTsKLQlzdHJ1Y3QgYmlvc19wYXJzZXIgKmJwOwogCWVudW0gYnBfcmVzdWx0IHJlY29y
ZF9yZXN1bHQ7CgogCWNvbnN0IHVuc2lnbmVkIGludCBzbG90X2luZGV4X3RvX3ZiaW9zX2lkW01B
WF9CT0FSRF9TTE9UU10gPSB7CkBAIC0yNzQ4LDcgKzI3NDcsNiBAQCBzdGF0aWMgZW51bSBicF9y
ZXN1bHQgYmlvc19nZXRfYm9hcmRfbGF5b3V0X2luZm8oCiAJCTAsIDAKIAl9OwoKLQlicCA9IEJQ
X0ZST01fRENCKGRjYik7CiAJaWYgKGJvYXJkX2xheW91dF9pbmZvID09IE5VTEwpIHsKIAkJRENf
TE9HX0RFVEVDVElPTl9FRElEX1BBUlNFUigiSW52YWxpZCBib2FyZF9sYXlvdXRfaW5mb1xuIik7
CiAJCXJldHVybiBCUF9SRVNVTFRfQkFESU5QVVQ7Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
