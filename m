Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FC46ACA
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 22:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827138982C;
	Fri, 14 Jun 2019 20:37:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F93897F6
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so5258255eds.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMBGg2Z7YsweMeAq1rHmmkQ5dcyUBkoEhk4aK1nNvr4=;
 b=uRoDbSZ36cWXUqOYeyjPPskpwOKXb8ufUjBhI8B8R9yW6H8z71qeKHAfm6hLY8CQb7
 wwbnEIvmJmNuZakccYtxah5uDbftOM3X0UGaKEY1wmu8pSO1FR+oIWnhwxTe82X7WF4f
 wb13sQJ+S4IwIHYlM/m9qhFoFbEKuWBidzYq1qEWUnoZfQNeW9LgL9lGaq7B3o5Hf5ty
 bRShJF8ojdsjl9aPf+0tLEN6uP2o0aDk5HoOW0uBGa1jrC1JbuFSpfgjpf5zE56RhYOZ
 bNsxRCJD/xOT5urhCIoctIPhfjg856EuNN2OWe5jDXiuhxCVHdhkxKF2v+jfBuMfvDXU
 0P5Q==
X-Gm-Message-State: APjAAAV1OP5NiX1xG6shFd4Yt6zap/EMF0ljz7GV+EtJgFvsTbfBYUrX
 7EZZAVcZXeZqyf6i4FuuaQxrxA==
X-Google-Smtp-Source: APXvYqwQq8pHMCZfb0+KXE0nfKpbJZZy2u32WwxdhRAbndAEuECanoaNxnUsYKiEAM0HlhNFjZ3NYg==
X-Received: by 2002:a17:906:e204:: with SMTP id
 gf4mr42260208ejb.302.1560544640471; 
 Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 51/59] drm/radeon: Fill out gem_object->resv
Date: Fri, 14 Jun 2019 22:36:07 +0200
Message-Id: <20190614203615.12639-52-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AMBGg2Z7YsweMeAq1rHmmkQ5dcyUBkoEhk4aK1nNvr4=;
 b=QSZdnbLuF6xsWaMaLHsA8WyfnFEMiFPU+IUmDvCawmrua9lmUu/UP5/28wUQChYlW8
 gd3Slvg2WIxF9rVUS90KdODJxtLeqNW/iqjadrOJ1HyAKLcOcVAYYrV6B0LpOEKDkBfu
 eq8Tsvpw7UYXDcLq1dpca37v34topLfUEOjjU=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhdCB3YXkgd2UgY2FuIGRpdGNoIG91ciBnZW1fcHJpbWVfcmVzX29iaiBpbXBsZW1lbnRhdGlv
bi4gU2luY2UgdHRtCmFic29sdXRlbHkgbmVlZHMgdGhlIHJpZ2h0IHJlc2VydmF0aW9uIG9iamVj
dCBhbGwgdGhlIGJvaWxlcnBsYXRlIGlzCmFscmVhZHkgdGhlcmUgYW5kIHdlIGp1c3QgaGF2ZSB0
byB3aXJlIGl0IHVwIGNvcnJlY3RseS4KCk5vdGUgdGhhdCBnZW0vcHJpbWUgZG9lc24ndCBjYXJl
IHdoZW4gd2UgZG8gdGhpcywgYXMgbG9uZyBhcyB3ZSBkbyBpdApiZWZvcmUgdGhlIGJvIGlzIHJl
Z2lzdGVyZWQgYW5kIHNvbWVvbmUgY2FuIGNhbGwgdGhlIGhhbmRsZTJmZCBpb2N0bApvbiBpdC4K
CkFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVzdiBjb3VsZCBwcm9iYWJseSBiZSBkaXRj
aGVkIGluIGZhdm91cgpvZiBhbHdheXMgcGFzc2luZyBhIG5vbi1OVUxMIHJlc3YgdG8gdHRtX2Jv
X2luaXQoKS4gQXQgbGVhc3QgZm9yIGdlbQpkcml2ZXJzIHRoYXQgd291bGQgYXZvaWQgaGF2aW5n
IHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QKYW5kIHRoZSBvdGhlciBpbiBk
cm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNvbmZ1c2lvbi4KClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2
aWQxLlpob3VAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgfCAyIC0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fcHJpbWUuYyAgfCA3IC0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwppbmRl
eCA0NDAzZTc2ZTFhZTAuLmE0YTc4ZGZkZWYzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZHJ2LmMKQEAgLTE1Miw3ICsxNTIsNiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnJhZGVvbl9n
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJCQkJ
c3RydWN0IHNnX3RhYmxlICpzZyk7CiBpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqKTsKLXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJhZGVvbl9n
ZW1fcHJpbWVfcmVzX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7CiB2b2lkICpyYWRlb25f
Z2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCByYWRlb25f
Z2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIp
OwogCkBAIC01NjYsNyArNTY1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2
ZXIgPSB7CiAJLmdlbV9wcmltZV9leHBvcnQgPSByYWRlb25fZ2VtX3ByaW1lX2V4cG9ydCwKIAku
Z2VtX3ByaW1lX3BpbiA9IHJhZGVvbl9nZW1fcHJpbWVfcGluLAogCS5nZW1fcHJpbWVfdW5waW4g
PSByYWRlb25fZ2VtX3ByaW1lX3VucGluLAotCS5nZW1fcHJpbWVfcmVzX29iaiA9IHJhZGVvbl9n
ZW1fcHJpbWVfcmVzX29iaiwKIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IHJhZGVvbl9nZW1f
cHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcmFkZW9u
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV92bWFwID0gcmFkZW9uX2dl
bV9wcmltZV92bWFwLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwppbmRleCAy
MWY3M2ZjODZmMzguLjdhMmJhZDg0M2Y4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmMKQEAgLTI2Miw2ICsyNjIsNyBAQCBpbnQgcmFkZW9uX2JvX2NyZWF0ZShzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiwKIAlyID0gdHRtX2JvX2luaXQoJnJkZXYtPm1tYW4uYmRldiwg
JmJvLT50Ym8sIHNpemUsIHR5cGUsCiAJCQkmYm8tPnBsYWNlbWVudCwgcGFnZV9hbGlnbiwgIWtl
cm5lbCwgYWNjX3NpemUsCiAJCQlzZywgcmVzdiwgJnJhZGVvbl90dG1fYm9fZGVzdHJveSk7CisJ
Ym8tPmdlbV9iYXNlLnJlc3YgPSBiby0+dGJvLnJlc3Y7CiAJdXBfcmVhZCgmcmRldi0+cG0ubWNs
a19sb2NrKTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlyZXR1cm4gcjsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCmluZGV4IGRlYWZmY2U1MGEyZS4uOGNlM2U4MDQ1ZDQy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMKQEAgLTExNywxMyArMTE3LDYg
QEAgdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQogfQogCiAKLXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJhZGVvbl9nZW1fcHJpbWVfcmVz
X29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKLXsKLQlzdHJ1Y3QgcmFkZW9uX2JvICpi
byA9IGdlbV90b19yYWRlb25fYm8ob2JqKTsKLQotCXJldHVybiBiby0+dGJvLnJlc3Y7Ci19Ci0K
IHN0cnVjdCBkbWFfYnVmICpyYWRlb25fZ2VtX3ByaW1lX2V4cG9ydChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdvYmosCiAJCQkJCWludCBmbGFncykKIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
