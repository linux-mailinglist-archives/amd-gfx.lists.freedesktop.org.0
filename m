Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6A5B5AE
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jul 2019 09:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75289F89;
	Mon,  1 Jul 2019 07:23:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3639C6E99D;
 Sat, 29 Jun 2019 12:27:54 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hhCSM-0005rH-VE; Sat, 29 Jun 2019 12:27:51 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: don't release dc->current_state if it
 is null
Date: Sat, 29 Jun 2019 13:27:50 +0100
Message-Id: <20190629122750.12219-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:23:28 +0000
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
eSBmdW5jdGlvbiBjb25zdHJ1Y3QgY2FsbHMgZGVzdHJ1Y3QgaWYgdGhlIGFsbG9jYXRpb24gb2YK
ZGMtPmN1cnJlbnRfc3RhdGUgZmFpbHMsIGhvd2V2ZXIsIHRoZSBkZXN0cnVjdCBmdW5jdGlvbiB3
aWxsCmF0dGVtcHQgZGVyZWZlcmVuY2UgZGMtPmN1cnJlbnRfc3RhdGUgd2hlbiBjYWxsaW5nIGRj
X3JlbGVhc2Vfc3RhdGUuCkF2b2lkIHRoaXMgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGJ5IGNo
ZWNraW5nIGlmIHRoZSBwb2ludGVyIGlzCm5vdCBudWxsIGJlZm9yZSBjYWxsaW5nIGRjX3JlbGVh
c2Vfc3RhdGUuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYWZ0ZXIgbnVsbCBj
aGVjayIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDYg
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDE4Yzc3NWE5NTBj
Yy4uMGUxZjEzMmFlMzEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
LmMKQEAgLTYwOCw4ICs2MDgsMTAgQEAgY29uc3Qgc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgKmRj
X2xpbmtfZ2V0X2xpbmtfY2FwKAogCiBzdGF0aWMgdm9pZCBkZXN0cnVjdChzdHJ1Y3QgZGMgKmRj
KQogewotCWRjX3JlbGVhc2Vfc3RhdGUoZGMtPmN1cnJlbnRfc3RhdGUpOwotCWRjLT5jdXJyZW50
X3N0YXRlID0gTlVMTDsKKwlpZiAoZGMtPmN1cnJlbnRfc3RhdGUpIHsKKwkJZGNfcmVsZWFzZV9z
dGF0ZShkYy0+Y3VycmVudF9zdGF0ZSk7CisJCWRjLT5jdXJyZW50X3N0YXRlID0gTlVMTDsKKwl9
CiAKIAlkZXN0cm95X2xpbmtzKGRjKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
