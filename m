Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76774F5F
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 15:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E3A6E75A;
	Thu, 25 Jul 2019 13:27:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E925B6E75A
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 13:27:47 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so50263340edr.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 06:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfTfGwiIDonLTkvvou+0H7gyrR31y8O3wuySLzwsFms=;
 b=kuj//XMrIGc6+XZ2pW5uZePP5CETEqB5RMGSRcFI4AGOi8IQFTWD4wVt3bKgE+XDJ4
 34NZc4g1DWq2RPG+82KyIqsZGzAIc4db7iiUwF2+o77C046sFogUS1uTz0jQqY8meHdU
 emtw2EqGl4iaDieM9gV+pFwM3cJJz2dakJKczbdAyPV/kJGln+n+mOuB8BYaSBWoGRkY
 BxSYrChvRvkVcDPN0izbwxeW0jBk4rlJWPVTDnNGPL6wrWTfLBLsEdOaxCndf70BPgzR
 hrtUOdUSu1OE1qQ422W5A4l4pEyH5mlhP2MzuO93UjMmXV4KGKA1R57G3MtXT+yldtpu
 dJzQ==
X-Gm-Message-State: APjAAAX4L5l44MbiJh0IR9FLN8YDoJo1gulfHQmiFuqSGVJmxJKKnLn4
 cgYsWDc22ACypuPvUTZ0QlU=
X-Google-Smtp-Source: APXvYqz1yMF3GYmMpgatihwRQqqc+hVtAp7NLasJ91subo2SKELP+HiJfWH4id5REIs40aZCL/5gqQ==
X-Received: by 2002:a50:ad45:: with SMTP id z5mr76074349edc.21.1564061266522; 
 Thu, 25 Jul 2019 06:27:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l1sm13091167edr.17.2019.07.25.06.27.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:27:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/radeon: Fill out gem_object->resv
Date: Thu, 25 Jul 2019 15:26:52 +0200
Message-Id: <20190725132655.11951-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
References: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qfTfGwiIDonLTkvvou+0H7gyrR31y8O3wuySLzwsFms=;
 b=EBFvo3wxD2YuZbHsa+neDQBx95fJBXENFHYVjaxpk9UcHs5bj5d+tI8l0yZP6ZE9Iz
 9xe//bvEuQ+zmrzAeN2W7PZ0HHrRy8ZJIZtW+wf2F2YyJrFfJPZSCKaPo/MQjrj7H5/i
 GcKxsHGbApfX+kbZlwugadXD7Jm7xxLDKem/Q=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 kraxel@redhat.com, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
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
cm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNvbmZ1c2lvbi4KCkFja2VkLWJ5OiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJEYXZp
ZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZpZDEuWmhvdUBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyAgICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jIHwgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jICB8IDcgLS0tLS0tLQogMyBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IDQ0MDNlNzZlMWFlMC4uYTRhNzhkZmRlZjM3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwpAQCAtMTUyLDcgKzE1Miw2IEBAIHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqcmFkZW9uX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKIAkJCQkJCQlzdHJ1Y3Qgc2dfdGFibGUgKnNnKTsKIGludCByYWRlb25f
Z2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7CiB2b2lkIHJhZGVvbl9n
ZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwotc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqcmFkZW9uX2dlbV9wcmltZV9yZXNfb2JqKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqKTsKIHZvaWQgKnJhZGVvbl9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaik7CiB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCB2b2lkICp2YWRkcik7CiAKQEAgLTU2Niw3ICs1NjUsNiBAQCBzdGF0aWMgc3Ry
dWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsKIAkuZ2VtX3ByaW1lX2V4cG9ydCA9IHJhZGVv
bl9nZW1fcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfcGluID0gcmFkZW9uX2dlbV9wcmltZV9w
aW4sCiAJLmdlbV9wcmltZV91bnBpbiA9IHJhZGVvbl9nZW1fcHJpbWVfdW5waW4sCi0JLmdlbV9w
cmltZV9yZXNfb2JqID0gcmFkZW9uX2dlbV9wcmltZV9yZXNfb2JqLAogCS5nZW1fcHJpbWVfZ2V0
X3NnX3RhYmxlID0gcmFkZW9uX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9p
bXBvcnRfc2dfdGFibGUgPSByYWRlb25fZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKIAkuZ2Vt
X3ByaW1lX3ZtYXAgPSByYWRlb25fZ2VtX3ByaW1lX3ZtYXAsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX29iamVjdC5jCmluZGV4IDIxZjczZmM4NmYzOC4uN2EyYmFkODQzZjhhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwpAQCAtMjYyLDYgKzI2Miw3IEBAIGludCBy
YWRlb25fYm9fY3JlYXRlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCXIgPSB0dG1fYm9f
aW5pdCgmcmRldi0+bW1hbi5iZGV2LCAmYm8tPnRibywgc2l6ZSwgdHlwZSwKIAkJCSZiby0+cGxh
Y2VtZW50LCBwYWdlX2FsaWduLCAha2VybmVsLCBhY2Nfc2l6ZSwKIAkJCXNnLCByZXN2LCAmcmFk
ZW9uX3R0bV9ib19kZXN0cm95KTsKKwliby0+Z2VtX2Jhc2UucmVzdiA9IGJvLT50Ym8ucmVzdjsK
IAl1cF9yZWFkKCZyZGV2LT5wbS5tY2xrX2xvY2spOwogCWlmICh1bmxpa2VseShyICE9IDApKSB7
CiAJCXJldHVybiByOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
cHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMKaW5kZXggZGVh
ZmZjZTUwYTJlLi44Y2UzZTgwNDVkNDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3ByaW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJp
bWUuYwpAQCAtMTE3LDEzICsxMTcsNiBAQCB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdW5waW4oc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiB9CiAKIAotc3RydWN0IHJlc2VydmF0aW9uX29iamVj
dCAqcmFkZW9uX2dlbV9wcmltZV9yZXNfb2JqKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQot
ewotCXN0cnVjdCByYWRlb25fYm8gKmJvID0gZ2VtX3RvX3JhZGVvbl9ibyhvYmopOwotCi0JcmV0
dXJuIGJvLT50Ym8ucmVzdjsKLX0KLQogc3RydWN0IGRtYV9idWYgKnJhZGVvbl9nZW1fcHJpbWVf
ZXhwb3J0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiwKIAkJCQkJaW50IGZsYWdzKQogewot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
