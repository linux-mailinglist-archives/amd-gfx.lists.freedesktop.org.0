Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CECB270
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 01:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6D76EA97;
	Thu,  3 Oct 2019 23:44:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658A06EA7F;
 Thu,  3 Oct 2019 21:40:54 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iG8qA-00071M-5a; Thu, 03 Oct 2019 21:40:50 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: remove redundant variable r and redundant
 return statement
Date: Thu,  3 Oct 2019 22:40:49 +0100
Message-Id: <20191003214049.23067-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Oct 2019 23:44:06 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgcmV0dXJuIHN0YXRlbWVudCB0aGF0IGlzIG5vdCByZWFjaGFibGUgYW5kIGEgdmFyaWFibGUg
dGhhdAppcyBub3QgdXNlZC4gIFJlbW92ZSB0aGVtLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlN0
cnVjdHVyYWxseSBkZWFkIGNvZGUiKQpGaXhlczogZGU3YjQ1YmFiZDliICgiZHJtL2FtZGdwdTog
Y2xlYW51cCBjcmVhdGluZyBCT3MgYXQgZml4ZWQgbG9jYXRpb24gKHYyKSIpClNpZ25lZC1vZmYt
Ynk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmlu
ZGV4IDQ4MWU0YzM4MTA4My4uODE0MTU5ZjE1NjMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCkBAIC0xNjM2LDcgKzE2MzYsNiBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
dHRtX2Z3X3Jlc2VydmVfdnJhbV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogc3Rh
dGljIGludCBhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogewogCXVpbnQ2NF90IHZyYW1fc2l6ZSA9IGFkZXYtPmdtYy52aXNpYmxlX3Zy
YW1fc2l6ZTsKLQlpbnQgcjsKIAogCWFkZXYtPmZ3X3ZyYW1fdXNhZ2UudmEgPSBOVUxMOwogCWFk
ZXYtPmZ3X3ZyYW1fdXNhZ2UucmVzZXJ2ZWRfYm8gPSBOVUxMOwpAQCAtMTY1MSw3ICsxNjUwLDYg
QEAgc3RhdGljIGludCBhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCQkJCQkgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCiAJCQkJCSAg
JmFkZXYtPmZ3X3ZyYW1fdXNhZ2UucmVzZXJ2ZWRfYm8sCiAJCQkJCSAgJmFkZXYtPmZ3X3ZyYW1f
dXNhZ2UudmEpOwotCXJldHVybiByOwogfQogCiAvKioKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
