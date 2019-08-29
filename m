Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B35A0F97
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 04:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619C891F8;
	Thu, 29 Aug 2019 02:31:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E30B89E32;
 Thu, 29 Aug 2019 00:52:00 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i38fM-00023Z-Rk; Thu, 29 Aug 2019 00:51:56 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amdgpu: fix spelling mistake "jumpimng" ->
 "jumping"
Date: Thu, 29 Aug 2019 01:51:56 +0100
Message-Id: <20190829005156.26354-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 02:31:49 +0000
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
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIERSTV9ERUJVR19EUklWRVIgZGVidWcgbWVzc2FnZS4K
Rml4IGl0LgoKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXBy
b20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKaW5k
ZXggODYxMTBlNjA5NWNjLi44YTMyYjVjOTM3NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwpAQCAtMjU3LDcgKzI1Nyw3IEBAIHN0YXRpYyB1
aW50MzJfdCBfX2NvcnJlY3RfZWVwcm9tX2Rlc3RfYWRkcmVzcyh1aW50MzJfdCBjdXJyX2FkZHJl
c3MpCiAJICogaHR0cHM6Ly93d3cuc3QuY29tL3Jlc291cmNlL2VuL2RhdGFzaGVldC9tMjRtMDIt
ZHIucGRmIHNlYy4gNS4xLjIKIAkgKi8KIAlpZiAoKGN1cnJfYWRkcmVzcyAmIEVFUFJPTV9BRERS
X01TQl9NQVNLKSAhPSAobmV4dF9hZGRyZXNzICYgRUVQUk9NX0FERFJfTVNCX01BU0spKSB7Ci0J
CURSTV9ERUJVR19EUklWRVIoIlJlYWNoZWQgZW5kIG9mIEVFUFJPTSBtZW1vcnkgcGFnZSwganVt
cGltbmcgdG8gbmV4dDogJWx4IiwKKwkJRFJNX0RFQlVHX0RSSVZFUigiUmVhY2hlZCBlbmQgb2Yg
RUVQUk9NIG1lbW9yeSBwYWdlLCBqdW1waW5nIHRvIG5leHQ6ICVseCIsCiAJCQkJKG5leHRfYWRk
cmVzcyAmIEVFUFJPTV9BRERSX01TQl9NQVNLKSk7CiAKIAkJcmV0dXJuICAobmV4dF9hZGRyZXNz
ICYgRUVQUk9NX0FERFJfTVNCX01BU0spOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
