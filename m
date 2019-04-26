Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC10DA49
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 03:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F57A890FE;
	Mon, 29 Apr 2019 01:04:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF77D89232;
 Fri, 26 Apr 2019 21:48:14 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hK8hX-00005a-Kl; Fri, 26 Apr 2019 21:48:11 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix incorrect null check on pointer
Date: Fri, 26 Apr 2019 22:48:11 +0100
Message-Id: <20190426214811.12310-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Apr 2019 01:04:22 +0000
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
eSBhbiBhbGxvY2F0aW9uIGlzIGJlaW5nIG1hZGUgYnV0IHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUK
Y2hlY2sgaXMgYmVpbmcgcGVyZm9ybWVkIG9uIGFub3RoZXIgcG9pbnRlci4gRml4IHRoaXMgYnkg
Y2hlY2tpbmcKdGhlIGNvcnJlY3QgcG9pbnRlci4gQWxzbyB1c2UgdGhlIG5vcm1hbCBrZXJuZWwg
aWRpb20gZm9yIG51bGwKcG9pbnRlciBjaGVja3MuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiUmVz
b3VyY2UgbGVhayIpCkZpeGVzOiA0M2UzYWM4Mzg5ZWYgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBm
dW5jdGlvbiB0byBjb3B5IERDIHN0cmVhbXMiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2lu
ZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19zdHJlYW0uYwppbmRleCA2MjAwZGYzZWRjZDAuLjk2ZTk3ZDI1ZDYzOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKQEAg
LTE2OCw3ICsxNjgsNyBAQCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpkY19jb3B5X3N0cmVhbShj
b25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0pCiAJc3RydWN0IGRjX3N0cmVhbV9z
dGF0ZSAqbmV3X3N0cmVhbTsKIAogCW5ld19zdHJlYW0gPSBremFsbG9jKHNpemVvZihzdHJ1Y3Qg
ZGNfc3RyZWFtX3N0YXRlKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKHN0cmVhbSA9PSBOVUxMKQorCWlm
ICghbmV3X3N0cmVhbSkKIAkJcmV0dXJuIE5VTEw7CiAKIAltZW1jcHkobmV3X3N0cmVhbSwgc3Ry
ZWFtLCBzaXplb2Yoc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSkpOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
