Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A575D104
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 15:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340189E0D;
	Tue,  2 Jul 2019 13:51:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861098995F;
 Tue,  2 Jul 2019 12:30:59 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hiHw0-0000Fa-Jx; Tue, 02 Jul 2019 12:30:56 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display/dce_mem_input: fix spelling mistake "eanble"
 -> "enable"
Date: Tue,  2 Jul 2019 13:30:56 +0100
Message-Id: <20190702123056.8205-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Jul 2019 13:51:53 +0000
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
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIHZhcmlhYmxlIG5hbWUsIGZpeCB0aGlzIGJ5IHJlbmFt
aW5nCml0IHRvIGVuYWJsZS4KClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfbWVtX2lucHV0LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX21lbV9pbnB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfbWVtX2lucHV0LmMKaW5kZXggYTI0YTJiZGE4NjU2Li4wN2UwY2M1YTI2
ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX21l
bV9pbnB1dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX21l
bV9pbnB1dC5jCkBAIC02MDYsMTEgKzYwNiwxMSBAQCBzdGF0aWMgdm9pZCBkY2VfbWlfYWxsb2Nh
dGVfZG1pZigKIAl9CiAKIAlpZiAoZGNlX21pLT53YS5zaW5nbGVfaGVhZF9yZHJlcV9kbWlmX2xp
bWl0KSB7Ci0JCXVpbnQzMl90IGVhbmJsZSA9ICAodG90YWxfc3RyZWFtX251bSA+IDEpID8gMCA6
CisJCXVpbnQzMl90IGVuYWJsZSA9ICAodG90YWxfc3RyZWFtX251bSA+IDEpID8gMCA6CiAJCQkJ
ZGNlX21pLT53YS5zaW5nbGVfaGVhZF9yZHJlcV9kbWlmX2xpbWl0OwogCiAJCVJFR19VUERBVEUo
TUNfSFVCX1JEUkVRX0RNSUZfTElNSVQsCi0JCQkJRU5BQkxFLCBlYW5ibGUpOworCQkJCUVOQUJM
RSwgZW5hYmxlKTsKIAl9CiB9CiAKQEAgLTYzNiwxMSArNjM2LDExIEBAIHN0YXRpYyB2b2lkIGRj
ZV9taV9mcmVlX2RtaWYoCiAJCQkxMCwgMzUwMCk7CiAKIAlpZiAoZGNlX21pLT53YS5zaW5nbGVf
aGVhZF9yZHJlcV9kbWlmX2xpbWl0KSB7Ci0JCXVpbnQzMl90IGVhbmJsZSA9ICAodG90YWxfc3Ry
ZWFtX251bSA+IDEpID8gMCA6CisJCXVpbnQzMl90IGVuYWJsZSA9ICAodG90YWxfc3RyZWFtX251
bSA+IDEpID8gMCA6CiAJCQkJZGNlX21pLT53YS5zaW5nbGVfaGVhZF9yZHJlcV9kbWlmX2xpbWl0
OwogCiAJCVJFR19VUERBVEUoTUNfSFVCX1JEUkVRX0RNSUZfTElNSVQsCi0JCQkJRU5BQkxFLCBl
YW5ibGUpOworCQkJCUVOQUJMRSwgZW5hYmxlKTsKIAl9CiB9CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
