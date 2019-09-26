Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39693BFB7C
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E69A6EE29;
	Thu, 26 Sep 2019 22:52:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5CD6EE2D;
 Thu, 26 Sep 2019 22:52:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1409A30832C0;
 Thu, 26 Sep 2019 22:52:00 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE1E6600C1;
 Thu, 26 Sep 2019 22:51:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu/dm/mst: Remove unnecessary NULL check
Date: Thu, 26 Sep 2019 18:51:04 -0400
Message-Id: <20190926225122.31455-3-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-1-lyude@redhat.com>
References: <20190926225122.31455-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 26 Sep 2019 22:52:00 +0000 (UTC)
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
 Thomas Lim <Thomas.Lim@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

a2ZyZWUoKSBjaGVja3MgdGhpcyBhdXRvbWF0aWNhbGx5LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
aW5kZXggMTg1YmYwZTJiZGEyLi5hMzk4ZGRkMWYzMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5j
CkBAIC0xNDQsMTAgKzE0NCw4IEBAIGRtX2RwX21zdF9jb25uZWN0b3JfZGVzdHJveShzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICph
bWRncHVfZG1fY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwog
CXN0cnVjdCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1X2VuY29kZXIgPSBhbWRncHVfZG1fY29ubmVj
dG9yLT5tc3RfZW5jb2RlcjsKIAotCWlmIChhbWRncHVfZG1fY29ubmVjdG9yLT5lZGlkKSB7Ci0J
CWtmcmVlKGFtZGdwdV9kbV9jb25uZWN0b3ItPmVkaWQpOwotCQlhbWRncHVfZG1fY29ubmVjdG9y
LT5lZGlkID0gTlVMTDsKLQl9CisJa2ZyZWUoYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZWRpZCk7CisJ
YW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZWRpZCA9IE5VTEw7CiAKIAlkcm1fZW5jb2Rlcl9jbGVhbnVw
KCZhbWRncHVfZW5jb2Rlci0+YmFzZSk7CiAJa2ZyZWUoYW1kZ3B1X2VuY29kZXIpOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
