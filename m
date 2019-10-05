Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C73CC78C
	for <lists+amd-gfx@lfdr.de>; Sat,  5 Oct 2019 05:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABFD6E1CD;
	Sat,  5 Oct 2019 03:51:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EB26E0C0;
 Sat,  5 Oct 2019 02:37:38 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 026D3496FA1CB73DB3F0;
 Sat,  5 Oct 2019 10:37:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 10:37:24 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] drm/amd/display: some fixes for gcc warning
Date: Sat, 5 Oct 2019 10:44:31 +0800
Message-ID: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 03:51:49 +0000
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

emhlbmdiaW4gKDUpOgogIGRybS9hbWQvZGlzcGxheTogTWFrZSBmdW5jdGlvbiB3YWl0X2Zvcl9h
bHRfbW9kZSBzdGF0aWMKICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2Vk
IHZhcmlhYmxlICdzb3VyY2VfYnBwJwogIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHNldCBidXQg
bm90IHVzZWQgdmFyaWFibGVzCiAgICAnaF9yYXRpb19jaHJvbWEnLCd2X3JhdGlvX2Nocm9tYScK
ICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdwaXhl
bF93aWR0aCcKICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlcyAncHBfc211Jywnb2xkX3BpcGUnCgogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGluay5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgfCAxMiAtLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kcHAuYyAgICAg
ICAgICAgIHwgIDcgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2R3Yl9zY2wuYyAgICAgICAgfCAgNCAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZHNjL3JjX2NhbGMuYyAgICAgICAgICAgICAgICB8ICAzIC0tLQogNSBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjcgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
