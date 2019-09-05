Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECFA9B0F
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 09:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DC089D6C;
	Thu,  5 Sep 2019 07:05:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F03894DC;
 Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D2D03175285;
 Thu,  5 Sep 2019 07:05:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 374E13CC8;
 Thu,  5 Sep 2019 07:05:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8021B31EFC; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/radeon: switch to gem vma offset manager
Date: Thu,  5 Sep 2019 09:05:05 +0200
Message-Id: <20190905070509.22407-5-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 05 Sep 2019 07:05:13 +0000 (UTC)
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGFzcyBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLCBzbyB0
dG0gdXNlcyBpdAppbnN0ZWFkIG9mIGl0cyBvd24gZW1iZWRkZWQgc3RydWN0LiAgVGhpcyBtYWtl
cyBzb21lIGdlbSBmdW5jdGlvbnMKKHNwZWNpZmljYWxseSBkcm1fZ2VtX29iamVjdF9sb29rdXAp
IHdvcmsgb24gdHRtIG9iamVjdHMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKaW5kZXggZTJjMTJlNTk3MDRkLi5hNDZiYjMwNjc4
NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCkBAIC03OTQsNyArNzk0LDcgQEAg
aW50IHJhZGVvbl90dG1faW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAlyID0gdHRt
X2JvX2RldmljZV9pbml0KCZyZGV2LT5tbWFuLmJkZXYsCiAJCQkgICAgICAgJnJhZGVvbl9ib19k
cml2ZXIsCiAJCQkgICAgICAgcmRldi0+ZGRldi0+YW5vbl9pbm9kZS0+aV9tYXBwaW5nLAotCQkJ
ICAgICAgIE5VTEwsCisJCQkgICAgICAgcmRldi0+ZGRldi0+dm1hX29mZnNldF9tYW5hZ2VyLAog
CQkJICAgICAgIHJkZXYtPm5lZWRfZG1hMzIpOwogCWlmIChyKSB7CiAJCURSTV9FUlJPUigiZmFp
bGVkIGluaXRpYWxpemluZyBidWZmZXIgb2JqZWN0IGRyaXZlciglZCkuXG4iLCByKTsKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
