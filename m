Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86534B7133
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 03:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F686F4AC;
	Thu, 19 Sep 2019 01:48:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2019 19:59:39 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4398F6FDB4
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 19:59:39 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MdeSn-1hbcGC3xB3-00ZgA4; Wed, 18 Sep 2019 21:54:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: hide an unused variable
Date: Wed, 18 Sep 2019 21:53:58 +0200
Message-Id: <20190918195418.2042610-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:e6RffvOmDj1nBJMeY+rrjixyu4FDdjpSMSkcA7dDa86QdgX8VAy
 vXJqdQHJ2VyuGNpIZmusNm/tmO6LSPOHGvbK29dNEXgwRjzOWBgH3zzgBys0a78d4gFJvgo
 po/+E1JWRhHgORmC1rtGZTv2ShsBdo79xTDlO7Eo10j0iqPbRuIQyj+h2JOyNBiQ1YeSiXh
 LEyb/3BeWh7FWoIm+goxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QB4wfGPhc3w=:KZqfzxI8UfdkX7/YdusuJ5
 wnd+PwIR0DjnoWMuVi9unpFE0yUR/iPZ7ixsHkbdQS/Cf+st3jqWDcT1xpT5tvj4uNm4fCoMS
 lvRlzyL9qYIV9YcSiGkI1A62yvslGxapPmCb6DebJsVM3QoIV7/c4uQfoVa2HRSkpxhI8emun
 Zs0+4DSxEstdF3/HWBgCIdWhosLR5Wmot5Fg5Qp/Ak/UgrmJZntd4Hkk0UDqvjohrhi+Yy/Nl
 u9Uz3OPp3FiA/oN5T+eOf+LzQgTN1Sq6UJgh3JS3VpVHYgalueevwlvRsxuOp723jGmQLnFgH
 yXU0qB5Do3vrp56SOXvGQ5EJ9WpJ987DSYI0DegwFqfFaB9xjhoPoQRkFMen1xcG2l+LGuJep
 t0upBs4518OtPqF50nV0Rl8SYgP5bYbOBBcPcP0jb2PamyEn5jIR58dz++vlZC0o0prIrum5U
 gsF8ObueVeMUQoFQUYrjg3xSjSXxbrB1XPxHJRU+vlirHUYPMS7uingELGuuP28AOMrB6Z1s0
 8f8P7thmWnwL4J1+M/TT7Dqkf4BOkjvosOnPVDC9tC6Hgq7Z2nyDuSFRriL0izuCkByYWrNH+
 aNycunNFbPvRMLb/9QZ5Ubkf18FMkVH3a4BXT6y9R4/iucW6HuRcBxKXQFqUkrfPizEEPLbLI
 TgqiNcahSsacktBYmMWFA0/eueCTZZFUFZSs6LKJ1rTRMIGvqcj8+qVbvYm2TGbCtzcRz10Io
 uWtztnD69k39z007dQ/fHVL23De+blWoRz8ZPxsu0Qgedh7GBPM8DSrPrhlY/bLhsANyv5Bzz
 OH9Q1/FTsmCWPyNhRqaSaO95WZFfqAF556TFkxaNAk3iyRP18l9OuIQEATy9rScW3eoV8Phwa
 xJTJFni0usOMmmJ9BOGQ==
X-Mailman-Approved-At: Thu, 19 Sep 2019 01:48:25 +0000
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
Cc: Mario Kleiner <mario.kleiner.de@gmail.com>,
 Dingchen Zhang <dingchen.zhang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Harry Wentland <Harry.Wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aG91dCBDT05GSUdfREVCVUdfRlMsIHdlIGdldCBhIHdhcm5pbmcgZm9yIGFuIHVudXNlZAp2
YXJpYWJsZToKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jOjYwMjA6MzM6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUgJ3NvdXJjZScgWy1X
ZXJyb3IsLVd1bnVzZWQtdmFyaWFibGVdCgpIaWRlIHRoZSB2YXJpYWJsZSBpbiBhbiAjaWZkZWYg
bGlrZSBpdHMgb25seSB1c2Vycy4KCkZpeGVzOiAxNGIyNTg0NjM2YzYgKCJkcm0vYW1kL2Rpc3Bs
YXk6IGFkZCBmdW5jdGlvbmFsaXR5IHRvIGdyYWIgRFBSWCBDUkMgZW50cmllcy4iKQpTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZTFiMDliYjQzMmJkLi43NDI1MmY1N2JhZmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwpAQCAtNjAxNyw3ICs2MDE3LDkgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2VuYWJsZV9jcnRj
X2ludGVycnVwdHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGM7CiAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZSwgKm5ld19jcnRjX3N0
YXRlOwogCWludCBpOworI2lmZGVmIENPTkZJR19ERUJVR19GUwogCWVudW0gYW1kZ3B1X2RtX3Bp
cGVfY3JjX3NvdXJjZSBzb3VyY2U7CisjZW5kaWYKIAogCWZvcl9lYWNoX29sZG5ld19jcnRjX2lu
X3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwKIAkJCQkgICAgICBuZXdfY3J0Y19z
dGF0ZSwgaSkgewotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
