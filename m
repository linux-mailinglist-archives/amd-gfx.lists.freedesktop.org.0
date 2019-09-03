Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC0A7533
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706CB898CC;
	Tue,  3 Sep 2019 20:47:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03E0898ED;
 Tue,  3 Sep 2019 20:47:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6511A30044CE;
 Tue,  3 Sep 2019 20:47:41 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21FBE1001956;
 Tue,  3 Sep 2019 20:47:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/27] drm/dp_mst: Get rid of list clear in
 destroy_connector_work
Date: Tue,  3 Sep 2019 16:45:40 -0400
Message-Id: <20190903204645.25487-3-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 20:47:41 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyB0byBiZSBzb21lIGxlZnRvdmVyIGRldHJpdHVzIGZyb20gYmVmb3JlIHRoZSBw
b3J0L21zdGIga3JlZgpjbGVhbnVwIGFuZCBkb2Vzbid0IGRvIGFueXRoaW5nIGFueW1vcmUsIHNv
IGdldCByaWQgb2YgaXQuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzog
SW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBh
bWQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXgg
MzZkYjY2YTBkZGIxLi4zMDU0ZWM2MjI1MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwpAQCAtMzc2MCw4ICszNzYwLDYgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lf
Y29ubmVjdG9yX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQlsaXN0X2RlbCgmcG9y
dC0+bmV4dCk7CiAJCW11dGV4X3VubG9jaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9sb2NrKTsK
IAotCQlJTklUX0xJU1RfSEVBRCgmcG9ydC0+bmV4dCk7Ci0KIAkJbWdyLT5jYnMtPmRlc3Ryb3lf
Y29ubmVjdG9yKG1nciwgcG9ydC0+Y29ubmVjdG9yKTsKIAogCQlkcm1fZHBfcG9ydF90ZWFyZG93
bl9wZHQocG9ydCwgcG9ydC0+cGR0KTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
