Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86FDDFFC
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Oct 2019 20:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4489830;
	Sun, 20 Oct 2019 18:21:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 496 seconds by postgrey-1.36 at gabe;
 Sat, 19 Oct 2019 07:32:55 UTC
Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com
 [198.54.122.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321F89D6C;
 Sat, 19 Oct 2019 07:32:55 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 7DB0760046;
 Sat, 19 Oct 2019 03:32:54 -0400 (EDT)
Received: from wambui.zuku.co.ke (unknown [10.20.151.218])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 038DC60033;
 Sat, 19 Oct 2019 07:32:50 +0000 (UTC)
From: Wambui Karuga <wambui@karuga.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: remove assignment for return value
Date: Sat, 19 Oct 2019 10:32:42 +0300
Message-Id: <20191019073242.21652-1-wambui@karuga.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 20 Oct 2019 18:21:20 +0000
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
Cc: David1.Zhou@amd.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVjZXNzYXJ5IGFzc2lnbm1lbnQgZm9yIHJldHVybiB2YWx1ZSBhbmQgaGF2ZSB0
aGUKZnVuY3Rpb24gcmV0dXJuIHRoZSByZXF1aXJlZCB2YWx1ZSBkaXJlY3RseS4KSXNzdWUgZm91
bmQgYnkgY29jY2luZWxsZToKQEAKbG9jYWwgaWRleHByZXNzaW9uIHJldDsKZXhwcmVzc2lvbiBl
OwpAQAoKLXJldCA9CityZXR1cm4KICAgICBlOwotcmV0dXJuIHJldDsKClNpZ25lZC1vZmYtYnk6
IFdhbWJ1aSBLYXJ1Z2EgPHdhbWJ1aUBrYXJ1Z2EueHl6PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vY2lrLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lr
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCmluZGV4IDYyZWFiODJhNjRmOS4uZGFm
ZjlhMmFmM2JlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKQEAgLTIyMSw5ICsyMjEsNyBAQCBpbnQgY2lf
Z2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJZWxzZQogCQlhY3R1YWxfdGVt
cCA9IHRlbXAgJiAweDFmZjsKIAotCWFjdHVhbF90ZW1wID0gYWN0dWFsX3RlbXAgKiAxMDAwOwot
Ci0JcmV0dXJuIGFjdHVhbF90ZW1wOworCXJldHVybiBhY3R1YWxfdGVtcCAqIDEwMDA7CiB9CiAK
IC8qIGdldCB0ZW1wZXJhdHVyZSBpbiBtaWxsaWRlZ3JlZXMgKi8KQEAgLTIzOSw5ICsyMzcsNyBA
QCBpbnQga3ZfZ2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJZWxzZQogCQlh
Y3R1YWxfdGVtcCA9IDA7CiAKLQlhY3R1YWxfdGVtcCA9IGFjdHVhbF90ZW1wICogMTAwMDsKLQot
CXJldHVybiBhY3R1YWxfdGVtcDsKKwlyZXR1cm4gYWN0dWFsX3RlbXAgKiAxMDAwOwogfQogCiAv
KgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
