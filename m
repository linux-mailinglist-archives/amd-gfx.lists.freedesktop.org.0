Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432ED6363D
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 14:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33CE89701;
	Tue,  9 Jul 2019 12:55:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7D89FCA;
 Tue,  9 Jul 2019 09:11:16 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 63CBFAB9524C5EBB45FF;
 Tue,  9 Jul 2019 17:11:10 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Tue, 9 Jul 2019
 17:11:01 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Philip.Yang@amd.com>, <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amdgpu: Fix build without CONFIG_HMM_MIRROR
Date: Tue, 9 Jul 2019 17:10:48 +0800
Message-ID: <20190709091048.35260-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 09 Jul 2019 12:55:07 +0000
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

SWYgQ09ORklHX0hNTV9NSVJST1IgaXMgbm90IHNldCwgYnVpbGRpbmcgbWF5IGZhaWxzOgoKSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oOjcy
OjAsCiAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmM6NDA6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oOjY5
OjIwOiBlcnJvcjogZmllbGQgbWlycm9yIGhhcyBpbmNvbXBsZXRlIHR5cGUKICBzdHJ1Y3QgaG1t
X21pcnJvciBtaXJyb3I7CgpGaXhlczogNzU5MGY2ZDIxMWVjICgiZHJtL2FtZGdwdTogUHJlcGFy
ZSBmb3IgaG1tX3JhbmdlX3JlZ2lzdGVyIEFQSSBjaGFuZ2UiKQpTaWduZWQtb2ZmLWJ5OiBZdWVI
YWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21uLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaAppbmRleCAyODFmZDlmLi5iMTRm
MTc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaApAQCAtNjUsOCArNjUs
MTAgQEAgc3RydWN0IGFtZGdwdV9tbiB7CiAJc3RydWN0IHJ3X3NlbWFwaG9yZQlsb2NrOwogCXN0
cnVjdCByYl9yb290X2NhY2hlZAlvYmplY3RzOwogCisjaWYgZGVmaW5lZChDT05GSUdfSE1NX01J
UlJPUikKIAkvKiBITU0gbWlycm9yICovCiAJc3RydWN0IGhtbV9taXJyb3IJbWlycm9yOworI2Vu
ZGlmCiB9OwogCiAjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
