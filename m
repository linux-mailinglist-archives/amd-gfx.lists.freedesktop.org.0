Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FE10B4AD
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Nov 2019 18:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171A26E0AC;
	Wed, 27 Nov 2019 17:42:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6C6E4FB;
 Wed, 27 Nov 2019 09:26:30 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 63990E6D573BB9257006;
 Wed, 27 Nov 2019 17:26:26 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 17:26:19 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <rex.zhu@amd.com>, <evan.quan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] drm/amd/powerplay: Remove unneeded variable
Date: Wed, 27 Nov 2019 17:33:37 +0800
Message-ID: <1574847222-51515-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 27 Nov 2019 17:42:39 +0000
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

emhlbmdiaW4gKDUpOgogIGRybS9hbWQvcG93ZXJwbGF5OiBSZW1vdmUgdW5uZWVkZWQgdmFyaWFi
bGUgJ3Jlc3VsdCcgaW4gc211MTBfaHdtZ3IuYwogIGRybS9hbWQvcG93ZXJwbGF5OiBSZW1vdmUg
dW5uZWVkZWQgdmFyaWFibGUgJ3Jlc3VsdCcgaW4gdmVnYTEwX2h3bWdyLmMKICBkcm0vYW1kL3Bv
d2VycGxheTogUmVtb3ZlIHVubmVlZGVkIHZhcmlhYmxlICdyZXQnIGluIHNtdTdfaHdtZ3IuYwog
IGRybS9hbWQvcG93ZXJwbGF5OiBSZW1vdmUgdW5uZWVkZWQgdmFyaWFibGUgJ3Jlc3VsdCcgaW4g
dmVnYTEyX2h3bWdyLmMKICBkcm0vYW1kL3Bvd2VycGxheTogUmVtb3ZlIHVubmVlZGVkIHZhcmlh
YmxlICdyZXQnIGluIGFtZGdwdV9zbXUuYwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyAgICAgICAgIHwgOCArKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYyAgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jICAgfCA0ICstLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIHwgMyArLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jIHwgNCArLS0tCiA1IGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
