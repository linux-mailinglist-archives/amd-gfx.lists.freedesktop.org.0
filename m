Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACD3357E
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 18:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CBE892B4;
	Mon,  3 Jun 2019 16:56:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598D892B2;
 Mon,  3 Jun 2019 16:56:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id 73A8F284AD8
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	nicholas.kazlauskas@amd.com
Subject: [PATCH v4 2/5] drm/amd: fix fb references in async update
Date: Mon,  3 Jun 2019 13:56:07 -0300
Message-Id: <20190603165610.24614-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603165610.24614-1-helen.koike@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
MIME-Version: 1.0
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
Cc: andrey.grodzovsky@amd.com, Mario Kleiner <mario.kleiner.de@gmail.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@google.com>,
 Sean Paul <seanpaul@google.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Helen Koike <helen.koike@collabora.com>, boris.brezillon@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 kernel@collabora.com, harry.wentland@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXN5bmMgdXBkYXRlIGNhbGxiYWNrcyBhcmUgZXhwZWN0ZWQgdG8gc2V0IHRoZSBvbGRfZmIgaW4g
dGhlIG5ld19zdGF0ZQpzbyBwcmVwYXJlL2NsZWFudXAgZnJhbWVidWZmZXJzIGFyZSBiYWxhbmNl
ZC4KCkNhbGxpbmcgZHJtX2F0b21pY19zZXRfZmJfZm9yX3BsYW5lKCkgKHdoaWNoIGdldHMgYSBy
ZWZlcmVuY2Ugb2YgdGhlIG5ldwpmYiBhbmQgcHV0IHRoZSBvbGQgZmIpIGlzIG5vdCByZXF1aXJl
ZCwgYXMgaXQncyB0YWtlbiBjYXJlIGJ5CmRybV9tb2RlX2N1cnNvcl91bml2ZXJzYWwoKSB3aGVu
IGNhbGxpbmcgZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lKCkuCgpTdWdnZXN0ZWQtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1i
eTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoKLS0t
CgpDaGFuZ2VzIGluIHY0OiBOb25lCkNoYW5nZXMgaW4gdjM6IE5vbmUKQ2hhbmdlcyBpbiB2MjoK
LSBhZGRlZCByZXZpZXdlZC1ieSB0YWcKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA0NDNiMTNlYzI2OGQuLjQwNjI0YjJjNjMwZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CkBAIC00MzQ3LDggKzQzNDcsNyBAQCBzdGF0aWMgdm9pZCBkbV9wbGFuZV9hdG9taWNfYXN5bmNf
dXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km9sZF9zdGF0ZSA9CiAJCWRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZShuZXdfc3RhdGUt
PnN0YXRlLCBwbGFuZSk7CiAKLQlpZiAocGxhbmUtPnN0YXRlLT5mYiAhPSBuZXdfc3RhdGUtPmZi
KQotCQlkcm1fYXRvbWljX3NldF9mYl9mb3JfcGxhbmUocGxhbmUtPnN0YXRlLCBuZXdfc3RhdGUt
PmZiKTsKKwlzd2FwKHBsYW5lLT5zdGF0ZS0+ZmIsIG5ld19zdGF0ZS0+ZmIpOwogCiAJcGxhbmUt
PnN0YXRlLT5zcmNfeCA9IG5ld19zdGF0ZS0+c3JjX3g7CiAJcGxhbmUtPnN0YXRlLT5zcmNfeSA9
IG5ld19zdGF0ZS0+c3JjX3k7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
