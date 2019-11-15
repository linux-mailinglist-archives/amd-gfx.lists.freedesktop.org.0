Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B3FE0A4
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Nov 2019 15:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754406E62C;
	Fri, 15 Nov 2019 14:55:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4933A6E2F8;
 Fri, 15 Nov 2019 09:47:57 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iVYCo-0002Zt-Iq; Fri, 15 Nov 2019 09:47:54 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu/powerplay: fix dereference before null check
 of pointer hwmgr
Date: Fri, 15 Nov 2019 09:47:54 +0000
Message-Id: <20191115094754.40920-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Nov 2019 14:55:58 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBhc3Np
Z25tZW50IG9mIGFkZXYgZGVyZWZlcmVuY2VzIHBvaW50ZXIgaHdtZ3IgYmVmb3JlIGh3bWdyIGlz
IG51bGwKY2hlY2tlZCwgaGVuY2UgdGhlcmUgaXMgYSBwb3RlbnRpYWwgbnVsbCBwb2ludGVyIGRl
ZmVyZW5jZSBpc3N1ZS4gRml4CnRoaXMgYnkgYXNzaWduaW5nIGFkZXYgYWZ0ZXIgdGhlIG51bGwg
Y2hlY2suCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYmVmb3JlIG51bGwgY2hl
Y2siKQpGaXhlczogMDg5NmQyZjdiYTRkICgiZHJtL2FtZGdwdS9wb3dlcnBsYXk6IHByb3Blcmx5
IHNldCBQUF9HRlhPRkZfTUFTSyIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3IvaHdtZ3IuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21n
ci5jCmluZGV4IDQ0MzYyNWM4M2VjOS4uZDI5MDljOTFkNjViIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMKQEAgLTgxLDcgKzgxLDcgQEAgc3RhdGljIHZv
aWQgaHdtZ3JfaW5pdF93b3JrbG9hZF9wcm9yaXR5KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAK
IGludCBod21ncl9lYXJseV9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB7Ci0Jc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldjsKIAogCWlmICghaHdtZ3IpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtOTYsNiArOTYs
OCBAQCBpbnQgaHdtZ3JfZWFybHlfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCWh3bWdy
X2luaXRfd29ya2xvYWRfcHJvcml0eShod21ncik7CiAJaHdtZ3ItPmdmeG9mZl9zdGF0ZV9jaGFu
Z2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7CiAKKwlhZGV2ID0gaHdtZ3ItPmFkZXY7CisKIAlzd2l0
Y2ggKGh3bWdyLT5jaGlwX2ZhbWlseSkgewogCWNhc2UgQU1ER1BVX0ZBTUlMWV9DSToKIAkJYWRl
di0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
