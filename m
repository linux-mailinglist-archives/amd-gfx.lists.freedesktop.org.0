Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82B59E48
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 16:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251CB6E93C;
	Fri, 28 Jun 2019 14:55:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1CA6E935;
 Fri, 28 Jun 2019 14:33:23 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgrwH-000836-12; Fri, 28 Jun 2019 14:33:21 +0000
From: Colin King <colin.king@canonical.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix a missing break in a switch statement
Date: Fri, 28 Jun 2019 15:33:20 +0100
Message-Id: <20190628143320.5182-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 14:55:57 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBmb3IgdGhlIEFNREdQVV9JUlFfU1RBVEVfRElTQUJMRSB0aGVyZSBpcyBhIG1pc3NpbmcgYnJl
YWsKY2F1c2luZyB0aGUgY29kZSB0byBmYWxsIHRocm91Z2ggdG8gdGhlIEFNREdQVV9JUlFfU1RB
VEVfRU5BQkxFIGNhc2UuCkZpeCB0aGlzIGJ5IGFkZGluZyBpbiB0aGUgbWlzc2luZyBicmVhayBz
dGF0ZW1lbnQuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiTWlzc2luZyBicmVhayBpbiBzd2l0Y2gi
KQpGaXhlczogYTY0NGQ4NWE1Y2Q0ICgiZHJtL2FtZGdwdTogYWRkIGdmeCB2MTAgaW1wbGVtZW50
YXRpb24gKHYxMCkiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDI5MzJhZGU3ZGJkMC4uYzE2NTIwMDM2MWIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtNDYwOCw2ICs0NjA4LDcgQEAg
Z2Z4X3YxMF8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJY3BfaW50X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGNwX2ludF9jbnRsLCBDUF9J
TlRfQ05UTF9SSU5HMCwKIAkJCQkJICAgIFRJTUVfU1RBTVBfSU5UX0VOQUJMRSwgMCk7CiAJCVdS
RUczMihjcF9pbnRfY250bF9yZWcsIGNwX2ludF9jbnRsKTsKKwkJYnJlYWs7CiAJY2FzZSBBTURH
UFVfSVJRX1NUQVRFX0VOQUJMRToKIAkJY3BfaW50X2NudGwgPSBSUkVHMzIoY3BfaW50X2NudGxf
cmVnKTsKIAkJY3BfaW50X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGNwX2ludF9jbnRsLCBDUF9JTlRf
Q05UTF9SSU5HMCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
