Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F57E1DD
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C286E75D;
	Thu,  1 Aug 2019 18:01:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3E76E4A6;
 Thu,  1 Aug 2019 11:01:48 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1ht8q9-0006Mm-Fl; Thu, 01 Aug 2019 11:01:45 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amdgpu: fix unsigned variable instance compared
 to less than zero
Date: Thu,  1 Aug 2019 12:01:45 +0100
Message-Id: <20190801110145.10803-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Aug 2019 18:00:57 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbmx5
IHRoZSBlcnJvciBjaGVjayBvbiB2YXJpYWJsZSBpbnN0YW5jZSBpcyBhbHdheXMgZmFsc2UgYmVj
YXVzZQppdCBpcyBhIHVpbnQzMl90IHR5cGUgYW5kIHRoaXMgaXMgbmV2ZXIgbGVzcyB0aGFuIHpl
cm8uIEZpeCB0aGlzIGJ5Cm1ha2luZyBpdCBhbiBpbnQgdHlwZS4KCkFkZHJlc3Nlcy1Db3Zlcml0
eTogKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQpGaXhlczogN2QwZTYzMjlkZmRjICgi
ZHJtL2FtZGdwdTogdXBkYXRlIG1vcmUgc2RtYSBpbnN0YW5jZXMgaXJxIHN1cHBvcnQiKQpTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IGEzM2JkODY3Mjg3ZS4uOTIyNTdmMmJmMTcxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTk2Miw3ICsxOTYyLDggQEAg
c3RhdGljIGludCBzZG1hX3Y0XzBfcHJvY2Vzc190cmFwX2lycShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIHN0YXRpYyBpbnQgc2RtYV92NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQog
ewotCXVpbnQzMl90IGluc3RhbmNlLCBlcnJfc291cmNlOworCXVpbnQzMl90IGVycl9zb3VyY2U7
CisJaW50IGluc3RhbmNlOwogCiAJaW5zdGFuY2UgPSBzZG1hX3Y0XzBfaXJxX2lkX3RvX3NlcShl
bnRyeS0+Y2xpZW50X2lkKTsKIAlpZiAoaW5zdGFuY2UgPCAwKQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
