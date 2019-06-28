Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E659F11
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 17:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45AE6E954;
	Fri, 28 Jun 2019 15:42:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4162C6E947;
 Fri, 28 Jun 2019 15:13:57 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgsZW-00039M-Qd; Fri, 28 Jun 2019 15:13:54 +0000
From: Colin King <colin.king@canonical.com>
To: Kevin Wang <kevin1.wang@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/powerplay: fix out of memory check on
 od8_settings
Date: Fri, 28 Jun 2019 16:13:54 +0100
Message-Id: <20190628151354.14107-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 15:42:36 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBudWxs
IHBvaW50ZXIgY2hlY2sgb24gb2Q4X3NldHRpbmdzIGlzIGN1cnJlbnRseSB0aGUgb3Bwb3NpdGUg
b2Ygd2hhdAppdCBpcyBpbnRlbmRlZCB0byBkby4gRml4IHRoaXMgYnkgYWRkaW5nIGluIHRoZSBt
aXNzaW5nICEgb3BlcmF0b3IuCgpBZGRyZXNzZWQtQ292ZXJpdHk6ICgiUmVzb3VyY2UgbGVhayIp
CkZpeGVzOiAwYzgzZDMyYzU2NWMgKCJkcm0vYW1kL3Bvd2VycGxheTogc2ltcGxpZmllZCBvZF9z
ZXR0aW5ncyBmb3IgZWFjaCBhc2ljIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS92ZWdhMjBfcHB0LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQu
YwppbmRleCAwZjE0ZmUxNGVjZDguLmViOWU2YjNhNTI2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwpAQCAtMTUwMSw4ICsxNTAxLDcgQEAgc3RhdGljIGlu
dCB2ZWdhMjBfc2V0X2RlZmF1bHRfb2Q4X3NldHR0aW5ncyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlvZDhfc2V0dGluZ3MgPSBremFsbG9jKHNpemVvZihz
dHJ1Y3QgdmVnYTIwX29kOF9zZXR0aW5ncyksIEdGUF9LRVJORUwpOwotCi0JaWYgKG9kOF9zZXR0
aW5ncykKKwlpZiAoIW9kOF9zZXR0aW5ncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlzbXUtPm9k
X3NldHRpbmdzID0gKHZvaWQgKilvZDhfc2V0dGluZ3M7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
