Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A105A10579F
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2019 17:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091B6F4B2;
	Thu, 21 Nov 2019 16:55:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAEF6F4AE;
 Thu, 21 Nov 2019 16:54:04 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iXpiT-0002Xt-Vf; Thu, 21 Nov 2019 16:54:02 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer
 write_frame
Date: Thu, 21 Nov 2019 16:54:01 +0000
Message-Id: <20191121165401.405845-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 16:55:49 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyIHdyaXRlX2ZyYW1lIGlzIGJlaW5nIGluaXRpYWxpemVkIHdpdGggYSB2YWx1ZSB0aGF0IGlz
Cm5ldmVyIHJlYWQgYW5kIGl0IGlzIGJlaW5nIHVwZGF0ZWQgbGF0ZXIgd2l0aCBhIG5ldyB2YWx1
ZS4gVGhlCmluaXRpYWxpemF0aW9uIGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCgpB
ZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKU2lnbmVkLW9mZi1ieTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKaW5kZXggMmE4YTA4YWE2ZWFmLi5jMDJmOWZmZTVjNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTE3MjgsNyArMTcyOCw3IEBAIGludCBwc3BfcmluZ19j
bWRfc3VibWl0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCQkJaW50IGluZGV4KQogewogCXVu
c2lnbmVkIGludCBwc3Bfd3JpdGVfcHRyX3JlZyA9IDA7Ci0Jc3RydWN0IHBzcF9nZnhfcmJfZnJh
bWUgKndyaXRlX2ZyYW1lID0gcHNwLT5rbV9yaW5nLnJpbmdfbWVtOworCXN0cnVjdCBwc3BfZ2Z4
X3JiX2ZyYW1lICp3cml0ZV9mcmFtZTsKIAlzdHJ1Y3QgcHNwX3JpbmcgKnJpbmcgPSAmcHNwLT5r
bV9yaW5nOwogCXN0cnVjdCBwc3BfZ2Z4X3JiX2ZyYW1lICpyaW5nX2J1ZmZlcl9zdGFydCA9IHJp
bmctPnJpbmdfbWVtOwogCXN0cnVjdCBwc3BfZ2Z4X3JiX2ZyYW1lICpyaW5nX2J1ZmZlcl9lbmQg
PSByaW5nX2J1ZmZlcl9zdGFydCArCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
