Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CECC30031
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 18:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95D66E3AC;
	Thu, 30 May 2019 16:31:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1D56E3A2;
 Thu, 30 May 2019 16:12:22 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hWNf9-0001rC-CV; Thu, 30 May 2019 16:12:19 +0000
From: Colin King <colin.king@canonical.com>
To: Anthony Koo <anthony.koo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: remove redundant assignment to status
Date: Thu, 30 May 2019 17:12:19 +0100
Message-Id: <20190530161219.2507-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 May 2019 16:31:06 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSBzdGF0dXMgaXMgaW5pdGlhbGl6ZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIgcmVh
ZAphbmQgc3RhdHVzIGlzIHJlYXNzaWduZWQgc2V2ZXJhbCBzdGF0ZW1lbnRzIGxhdGVyLiBUaGlz
IGluaXRpYWxpemF0aW9uCmlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCgpBZGRyZXNz
ZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rX2RwLmMKaW5kZXggNjVkNmNhZWRiZDgyLi5jZjYxNjZhMWJlNTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2Rw
LmMKQEAgLTIzNjcsNyArMjM2Nyw3IEBAIHN0YXRpYyBib29sIHJldHJpZXZlX2xpbmtfY2FwKHN0
cnVjdCBkY19saW5rICpsaW5rKQogCXVuaW9uIGRvd25fc3RyZWFtX3BvcnRfY291bnQgZG93bl9z
dHJtX3BvcnRfY291bnQ7CiAJdW5pb24gZWRwX2NvbmZpZ3VyYXRpb25fY2FwIGVkcF9jb25maWdf
Y2FwOwogCXVuaW9uIGRwX2Rvd25zdHJlYW1fcG9ydF9wcmVzZW50IGRzX3BvcnQgPSB7IDAgfTsK
LQllbnVtIGRjX3N0YXR1cyBzdGF0dXMgPSBEQ19FUlJPUl9VTkVYUEVDVEVEOworCWVudW0gZGNf
c3RhdHVzIHN0YXR1czsKIAl1aW50MzJfdCByZWFkX2RwY2RfcmV0cnlfY250ID0gMzsKIAlpbnQg
aTsKIAlzdHJ1Y3QgZHBfc2lua19od19md19yZXZpc2lvbiBkcF9od19md19yZXZpc2lvbjsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
