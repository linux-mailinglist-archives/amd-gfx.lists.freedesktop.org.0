Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CE60274
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 10:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC856E44C;
	Fri,  5 Jul 2019 08:42:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67016E356;
 Thu,  4 Jul 2019 14:23:32 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hj2e1-0004gL-NU; Thu, 04 Jul 2019 14:23:29 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu/psp: fix incorrect logic when checking
 asic_type
Date: Thu,  4 Jul 2019 15:23:29 +0100
Message-Id: <20190704142329.22983-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:42:04 +0000
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
eSB0aGUgY2hlY2sgb2YgdGhlIGFzaWNfdHlwZSBpcyBhbHdheXMgcmV0dXJuaW5nIHRydWUgYmVj
YXVzZQpvZiB0aGUgdXNlIG9mIHx8LiAgRml4IHRoaXMgYnkgdXNpbmcgJiYgaW5zdGVhZC4gIEFs
c28gYnJlYWsgb3Zlcmx5CndpZGUgbGluZS4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJDb25zdGFu
dCBleHByZXNzaW9uIHJlc3VsdCIpCkZpeGVzOiBkYWI3MGZmMjRkYjYgKCJkcm0vYW1kZ3B1L3Bz
cDogYWRkIHBzcCBzdXBwb3J0IGZvciBuYXZpMTQiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTFfMC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAu
YwppbmRleCA1MjdkYzM3MTU5OGQuLmU0YWZkMzRlMzAzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YxMV8wLmMKQEAgLTU0MCw3ICs1NDAsOCBAQCBwc3BfdjExXzBfc3JhbV9tYXAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAljYXNlIEFNREdQVV9VQ09ERV9JRF9STENf
RzoKIAkJKnNyYW1fb2Zmc2V0ID0gMHgyMDAwOwotCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENI
SVBfTkFWSTEwIHx8IGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxNCkgeworCQlpZiAoYWRl
di0+YXNpY190eXBlICE9IENISVBfTkFWSTEwICYmCisJCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0g
Q0hJUF9OQVZJMTQpIHsKIAkJCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZT
RVQoR0MsIDAsIG1tUkxDX0dQTV9VQ09ERV9BRERSKTsKIAkJCSpzcmFtX2RhdGFfcmVnX29mZnNl
dCA9IFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tUkxDX0dQTV9VQ09ERV9EQVRBKTsKIAkJfSBl
bHNlIHsKQEAgLTU1MSw3ICs1NTIsOCBAQCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAKIAljYXNlIEFNREdQVV9VQ09ERV9JRF9TRE1BMDoKIAkJKnNyYW1f
b2Zmc2V0ID0gMHgwOwotCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwIHx8IGFk
ZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxNCkgeworCQlpZiAoYWRldi0+YXNpY190eXBlICE9
IENISVBfTkFWSTEwICYmCisJCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTQpIHsK
IAkJCSpzcmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1t
U0RNQTBfVUNPREVfQUREUik7CiAJCQkqc3JhbV9kYXRhX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdf
T0ZGU0VUKFNETUEwLCAwLCBtbVNETUEwX1VDT0RFX0RBVEEpOwogCQl9IGVsc2UgewotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
