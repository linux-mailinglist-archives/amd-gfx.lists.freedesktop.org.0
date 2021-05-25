Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA463390129
	for <lists+amd-gfx@lfdr.de>; Tue, 25 May 2021 14:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FB36E0D5;
	Tue, 25 May 2021 12:42:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE586E9B4;
 Tue, 25 May 2021 07:51:54 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq5mG4tsyzQsJl;
 Tue, 25 May 2021 15:48:14 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 15:51:50 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 15:51:50 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/radeon: remove the repeated declaration
Date: Tue, 25 May 2021 15:51:41 +0800
Message-ID: <1621929101-24607-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 May 2021 12:42:35 +0000
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnVuY3Rpb24gJ3IzMDBfbWNfd2FpdF9mb3JfaWRsZScgYW5kICdyNjAwX21jX3dhaXRfZm9yX2lk
bGUnCmFyZSBkZWNsYXJlZCB0d2ljZSwgcmVtb3ZlIHRoZSByZXBlYXRlZCBkZWNsYXJhdGlvbi4K
CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2hh
b2t1biBaaGFuZyA8emhhbmdzaGFva3VuQGhpc2lsaWNvbi5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fYXNpYy5oIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXNpYy5o
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXNpYy5oCmluZGV4IDFjZjJhNWUwZDkx
ZC4uMWUwMGY2Yjk5Zjk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9hc2ljLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXNpYy5oCkBAIC0x
ODcsNyArMTg3LDYgQEAgZXh0ZXJuIGludCBydjM3MF9wY2llX2dhcnRfaW5pdChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7CiBleHRlcm4gdm9pZCBydjM3MF9wY2llX2dhcnRfZmluaShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiBleHRlcm4gaW50IHJ2MzcwX3BjaWVfZ2FydF9lbmFi
bGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogZXh0ZXJuIHZvaWQgcnYzNzBfcGNpZV9n
YXJ0X2Rpc2FibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIGludCByMzAw
X21jX3dhaXRfZm9yX2lkbGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogCiAvKgogICog
cjQyMCxyNDIzLHJ2NDEwCkBAIC00MDQsNyArNDAzLDYgQEAgdm9pZCByNjAwX2hkbWlfdXBkYXRl
X0FDUihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHVpbnQzMl90IGNsb2NrKTsKIHZvaWQg
cjYwMF9oZG1pX2F1ZGlvX3dvcmthcm91bmQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsK
IGludCByNjAwX2hkbWlfYnVmZmVyX3N0YXR1c19jaGFuZ2VkKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2Rlcik7CiB2b2lkIHI2MDBfaGRtaV91cGRhdGVfYXVkaW9fc2V0dGluZ3Moc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyKTsKLWludCByNjAwX21jX3dhaXRfZm9yX2lkbGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwogdTMyIHI2MDBfZ2V0X3hjbGsoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogdWludDY0X3QgcjYwMF9nZXRfZ3B1X2Nsb2NrX2NvdW50ZXIoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwogaW50IHJ2Nnh4X2dldF90ZW1wKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
