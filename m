Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938BD994AC
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 15:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9626EB2D;
	Thu, 22 Aug 2019 13:16:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CE66E3DF;
 Thu, 22 Aug 2019 13:09:52 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i0mqb-0005l8-4W; Thu, 22 Aug 2019 13:09:49 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: remove redundant assignment to variable
 baco_state
Date: Thu, 22 Aug 2019 14:09:48 +0100
Message-Id: <20190822130948.32195-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Aug 2019 13:16:14 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IGJhY29fc3RhdGUgaXMgaW5pdGlhbGl6ZWQgdG8gYSB2YWx1ZSB0aGF0IGlzIG5ldmVyIHJlYWQg
YW5kIGl0IGlzCnJlLWFzc2lnbmVkIGxhdGVyLiBUaGUgaW5pdGlhbGl6YXRpb24gaXMgcmVkdW5k
YW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgVmFs
dWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA4OTc0OWIxZDIwMTkuLmE0
YWJhODU3NjkwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMK
QEAgLTE2NTYsNyArMTY1Niw3IEBAIHN0YXRpYyBib29sIHNtdV92MTFfMF9iYWNvX2lzX3N1cHBv
cnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiBzdGF0aWMgZW51bSBzbXVfYmFjb19zdGF0ZSBz
bXVfdjExXzBfYmFjb19nZXRfc3RhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJc3Ry
dWN0IHNtdV9iYWNvX2NvbnRleHQgKnNtdV9iYWNvID0gJnNtdS0+c211X2JhY287Ci0JZW51bSBz
bXVfYmFjb19zdGF0ZSBiYWNvX3N0YXRlID0gU01VX0JBQ09fU1RBVEVfRVhJVDsKKwllbnVtIHNt
dV9iYWNvX3N0YXRlIGJhY29fc3RhdGU7CiAKIAltdXRleF9sb2NrKCZzbXVfYmFjby0+bXV0ZXgp
OwogCWJhY29fc3RhdGUgPSBzbXVfYmFjby0+c3RhdGU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
