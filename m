Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EC199A3
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 10:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ED189A77;
	Fri, 10 May 2019 08:24:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914D89728;
 Fri, 10 May 2019 07:07:38 +0000 (UTC)
Received: from cpc129250-craw9-2-0-cust139.know.cable.virginm.net
 ([82.43.126.140] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hOzd0-0003za-Oz; Fri, 10 May 2019 07:07:34 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: fix spelling mistake "retrived" ->
 "retrieved"
Date: Fri, 10 May 2019 08:07:34 +0100
Message-Id: <20190510070734.20625-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 May 2019 08:24:02 +0000
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
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIERSTV9FUlJPUiBlcnJvciBtZXNzYWdlLiBGaXggdGhp
cy4KClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjNfNi5jCmluZGV4IDdkMzc1ZjhkY2NlNi4uYTVjMzU1ODg2OWZiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCkBAIC0xOTQsNyArMTk0LDcgQEAgc3RhdGlj
IHZvaWQgZGZfdjNfNl9wbWNfZ2V0X2N0cmxfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJCXJldHVybjsKIAogCWlmICgoKmxvX2Jhc2VfYWRkciA9PSAwKSB8fCAoKmhpX2Jh
c2VfYWRkciA9PSAwKSkgewotCQlEUk1fRVJST1IoIkRGIFBNQyBhZGRyZXNzaW5nIG5vdCByZXRy
aXZlZCEgTG86ICV4LCBIaTogJXgiLAorCQlEUk1fRVJST1IoIkRGIFBNQyBhZGRyZXNzaW5nIG5v
dCByZXRyaWV2ZWQhIExvOiAleCwgSGk6ICV4IiwKIAkJCQkqbG9fYmFzZV9hZGRyLCAqaGlfYmFz
ZV9hZGRyKTsKIAkJcmV0dXJuOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
