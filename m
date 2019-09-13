Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C44B2542
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 20:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3946B6F435;
	Fri, 13 Sep 2019 18:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA416EEC0;
 Fri, 13 Sep 2019 08:02:52 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1i8gXY-0004uO-Ub; Fri, 13 Sep 2019 08:02:49 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: rename variable eanble -> enable
Date: Fri, 13 Sep 2019 09:02:48 +0100
Message-Id: <20190913080248.28695-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Sep 2019 18:38:34 +0000
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
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiB0aGUgdmFyaWFibGUgbmFtZSBlYW5ibGUsCnJlbmFtZSBp
dCB0byBlbmFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X21lbV9pbnB1dC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9tZW1faW5wdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX21lbV9pbnB1dC5jCmluZGV4IDE0ODhmZmRkZjRlMy4uNTk0NDUyNGZhYWI5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5w
dXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5w
dXQuYwpAQCAtNjA2LDExICs2MDYsMTEgQEAgc3RhdGljIHZvaWQgZGNlX21pX2FsbG9jYXRlX2Rt
aWYoCiAJfQogCiAJaWYgKGRjZV9taS0+d2Euc2luZ2xlX2hlYWRfcmRyZXFfZG1pZl9saW1pdCkg
ewotCQl1aW50MzJfdCBlYW5ibGUgPSAgKHRvdGFsX3N0cmVhbV9udW0gPiAxKSA/IDAgOgorCQl1
aW50MzJfdCBlbmFibGUgPSAgKHRvdGFsX3N0cmVhbV9udW0gPiAxKSA/IDAgOgogCQkJCWRjZV9t
aS0+d2Euc2luZ2xlX2hlYWRfcmRyZXFfZG1pZl9saW1pdDsKIAogCQlSRUdfVVBEQVRFKE1DX0hV
Ql9SRFJFUV9ETUlGX0xJTUlULAotCQkJCUVOQUJMRSwgZWFuYmxlKTsKKwkJCQlFTkFCTEUsIGVu
YWJsZSk7CiAJfQogfQogCkBAIC02MzYsMTEgKzYzNiwxMSBAQCBzdGF0aWMgdm9pZCBkY2VfbWlf
ZnJlZV9kbWlmKAogCQkJMTAsIDM1MDApOwogCiAJaWYgKGRjZV9taS0+d2Euc2luZ2xlX2hlYWRf
cmRyZXFfZG1pZl9saW1pdCkgewotCQl1aW50MzJfdCBlYW5ibGUgPSAgKHRvdGFsX3N0cmVhbV9u
dW0gPiAxKSA/IDAgOgorCQl1aW50MzJfdCBlbmFibGUgPSAgKHRvdGFsX3N0cmVhbV9udW0gPiAx
KSA/IDAgOgogCQkJCWRjZV9taS0+d2Euc2luZ2xlX2hlYWRfcmRyZXFfZG1pZl9saW1pdDsKIAog
CQlSRUdfVVBEQVRFKE1DX0hVQl9SRFJFUV9ETUlGX0xJTUlULAotCQkJCUVOQUJMRSwgZWFuYmxl
KTsKKwkJCQlFTkFCTEUsIGVuYWJsZSk7CiAJfQogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
