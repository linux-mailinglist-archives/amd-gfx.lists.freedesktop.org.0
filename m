Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC7A7567
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCFC89C1C;
	Tue,  3 Sep 2019 20:48:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609589BFB;
 Tue,  3 Sep 2019 20:48:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C1DD10C6973;
 Tue,  3 Sep 2019 20:48:34 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F19861001B11;
 Tue,  3 Sep 2019 20:48:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 17/27] drm/dp_mst: Rename drm_dp_add_port and
 drm_dp_update_port
Date: Tue,  3 Sep 2019 16:45:55 -0400
Message-Id: <20190903204645.25487-18-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 03 Sep 2019 20:48:34 +0000 (UTC)
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

VGhlIG5hbWVzIGZvciB0aGVzZSBmdW5jdGlvbnMgYXJlIHJhdGhlciBjb25mdXNpbmcuIGRybV9k
cF9hZGRfcG9ydCgpCnNvdW5kcyBsaWtlIGEgZnVuY3Rpb24gdGhhdCB3b3VsZCBzaW1wbHkgY3Jl
YXRlIGEgcG9ydCBhbmQgYWRkIGl0IHRvIGEKdG9wb2xvZ3ksIGFuZCBkbyBub3RoaW5nIG1vcmUu
IFNpbWlsYXJseSwgZHJtX2RwX3VwZGF0ZV9wb3J0KCkgd291bGQgYmUKYXNzdW1lZCB0byBiZSB0
aGUgZnVuY3Rpb24gdGhhdCBzaG91bGQgYmUgdXNlZCB0byB1cGRhdGUgcG9ydAppbmZvcm1hdGlv
biBhZnRlciBpbml0aWFsIGNyZWF0aW9uLgoKV2hpbGUgdGhvc2UgYXNzdW1wdGlvbnMgYXJlIGN1
cnJlbnRseSBjb3JyZWN0IGluIGhvdyB0aGVzZSBmdW5jdGlvbnMgYXJlCnVzZWQsIGEgcXVpY2sg
Z2xhbmNlIGF0IGRybV9kcF9hZGRfcG9ydCgpIHJldmVhbHMgdGhhdCBkcm1fZHBfYWRkX3BvcnQo
KQpjYW4gYWxzbyB1cGRhdGUgdGhlIGluZm9ybWF0aW9uIG9uIGEgcG9ydCwgYW5kIHNlZW1zIGV4
cGxpY2l0bHkgZGVzaWduZWQKdG8gZG8gc28uIFRoaXMgY2FuIGJlIGV4cGxhaW5lZCBwcmV0dHkg
c2ltcGx5IGJ5IHRoZSBmYWN0IHRoYXQgdGhlcmUncwptb3JlIHNpdHVhdGlvbnMgdGhhdCB3b3Vs
ZCBpbnZvbHZlIHVwZGF0aW5nIHRoZSBwb3J0IGluZm9ybWF0aW9uIGJhc2VkCm9uIGEgbGluayBh
ZGRyZXNzIHJlc3BvbnNlIGFzIG9wcG9zZWQgdG8gYSBjb25uZWN0aW9uIHN0YXR1cwpub3RpZmlj
YXRpb24gdGhhbiB0aGUgZHJpdmVyJ3MgaW5pdGlhbCB0b3BvbG9neSBwcm9iZS4gQ2FzZSBpbiBw
b2ludDoKcmVwcm9iaW5nIGxpbmsgYWRkcmVzc2VzIGFmdGVyIHN1c3BlbmQvcmVzdW1lLgoKU2lu
Y2Ugd2UncmUgYWJvdXQgdG8gc3RhcnQgdXNpbmcgZHJtX2RwX2FkZF9wb3J0KCkgZGlmZmVyZW50
bHkgZm9yCnN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZywgbGV0J3MgcmVuYW1lIGJvdGggZnVuY3Rp
b25zIHRvIGNsYXJpZnkgd2hhdAp0aGV5IGFjdHVhbGx5IGRvLgoKQ2M6IEp1c3RvbiBMaSA8anVz
dG9uLmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJy
eSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDE3ICsrKysr
KysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA5OTQ0ZWYyY2U4
ODUuLmNmYWY5ZWI3YWNlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBA
IC0xOTAwLDkgKzE5MDAsMTAgQEAgdm9pZCBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJl
Z2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiB9CiBFWFBPUlRfU1lNQk9M
KGRybV9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIpOwogCi1zdGF0aWMgdm9pZCBk
cm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAotCQkJICAgIHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCQkgICAgc3RydWN0IGRybV9kcF9saW5rX2FkZHJfcmVw
bHlfcG9ydCAqcG9ydF9tc2cpCitzdGF0aWMgdm9pZAorZHJtX2RwX21zdF9oYW5kbGVfbGlua19h
ZGRyZXNzX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAorCQkJCSAgICBzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCSAgICBzdHJ1Y3QgZHJtX2RwX2xpbmtfYWRkcl9yZXBs
eV9wb3J0ICpwb3J0X21zZykKIHsKIAlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciA9IG1zdGItPm1ncjsKIAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwpAQCAtMjAxMSw4
ICsyMDEyLDkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0
X2JyYW5jaCAqbXN0YiwKIAlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQpOwogfQog
Ci1zdGF0aWMgdm9pZCBkcm1fZHBfdXBkYXRlX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNo
ICptc3RiLAotCQkJICAgICAgIHN0cnVjdCBkcm1fZHBfY29ubmVjdGlvbl9zdGF0dXNfbm90aWZ5
ICpjb25uX3N0YXQpCitzdGF0aWMgdm9pZAorZHJtX2RwX21zdF9oYW5kbGVfY29ubl9zdGF0KHN0
cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKKwkJCSAgICBzdHJ1Y3QgZHJtX2RwX2Nvbm5l
Y3Rpb25fc3RhdHVzX25vdGlmeSAqY29ubl9zdGF0KQogewogCXN0cnVjdCBkcm1fZHBfbXN0X3Bv
cnQgKnBvcnQ7CiAJaW50IG9sZF9kZHBzOwpAQCAtMjQ2NCw3ICsyNDY2LDggQEAgc3RhdGljIHZv
aWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
ciAqbWdyLAogCWRybV9kcF9jaGVja19tc3RiX2d1aWQobXN0YiwgcmVwbHktPmd1aWQpOwogCiAJ
Zm9yIChpID0gMDsgaSA8IHJlcGx5LT5ucG9ydHM7IGkrKykKLQkJZHJtX2RwX2FkZF9wb3J0KG1z
dGIsIG1nci0+ZGV2LCAmcmVwbHktPnBvcnRzW2ldKTsKKwkJZHJtX2RwX21zdF9oYW5kbGVfbGlu
a19hZGRyZXNzX3BvcnQobXN0YiwgbWdyLT5kZXYsCisJCQkJCQkgICAgJnJlcGx5LT5wb3J0c1tp
XSk7CiAKIAlkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50KG1nci0+ZGV2KTsKIApAQCAtMzMy
NCw3ICszMzI3LDcgQEAgc3RhdGljIGludCBkcm1fZHBfbXN0X2hhbmRsZV91cF9yZXEoc3RydWN0
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiAJfQogCiAJaWYgKG1zZy5yZXFfdHlwZSA9
PSBEUF9DT05ORUNUSU9OX1NUQVRVU19OT1RJRlkpIHsKLQkJZHJtX2RwX3VwZGF0ZV9wb3J0KG1z
dGIsICZtc2cudS5jb25uX3N0YXQpOworCQlkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQobXN0
YiwgJm1zZy51LmNvbm5fc3RhdCk7CiAKIAkJRFJNX0RFQlVHX0tNUygiR290IENTTjogcG46ICVk
IGxkcHM6JWQgZGRwczogJWQgbWNzOiAlZCBpcDogJWQgcGR0OiAlZFxuIiwKIAkJCSAgICAgIG1z
Zy51LmNvbm5fc3RhdC5wb3J0X251bWJlciwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
