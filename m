Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADA69DFC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3017489DC9;
	Mon, 15 Jul 2019 21:24:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4676D89DC1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:53 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r6so13078323qtt.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DL3jVWbnd7M7Mh3Vp9ioRl0RQyvQmNJxB5DTEAKmtAA=;
 b=V4fg7IE3TXYeXUagPkeT0R2h0NNND/oBh+kXXWDTyKQfQ4NYjjhXONMr9EbYEP7esn
 xbMLj3mHgLu+/hEOglJNJdspQ5iAUiHe5ElnZFmLfyjxr2vrTzzalpinLP5ACic2ftHH
 VyeM2fzOzsDxv0BsXXvKTcZdU8lBxUCIbd0bVRDxwqCQ8gxAo5811aNGnuOmi5/o/QFI
 7RNPaXComl5uxdLgSeJ3nQd5g3kahxrcvb/55lqFmF+deO86YJ8jKlSyDe7CChSvL9lu
 PIuKqgyfXjJBimQjuVjtiu9IntDYli7P52FbvxRG/574OYrHfy8h3i5TY8oXKxK2qjby
 JLKw==
X-Gm-Message-State: APjAAAUHnP1HhejbxJJj60K+r2dLY4iCbMpfayg8DQU2qXEyTNdPNpwD
 KaZ8Xay04vGz3Q6EzNJ/nfWOlQlv
X-Google-Smtp-Source: APXvYqxj/8rTZYGY75pwSh/WWEP0w0oCtLOuL65KJmehewQUi/oCkQT1657/K68ReJ/0z4z8wuXy3A==
X-Received: by 2002:ac8:26e3:: with SMTP id 32mr19853477qtp.79.1563225892248; 
 Mon, 15 Jul 2019 14:24:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 009/102] drm/amdgpu: add one more mmhub instance for Arcturus
 (v2)
Date: Mon, 15 Jul 2019 16:23:04 -0500
Message-Id: <20190715212437.31793-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DL3jVWbnd7M7Mh3Vp9ioRl0RQyvQmNJxB5DTEAKmtAA=;
 b=sX+Bou5V7uhKBcnLLXpp02PePv9YdHjTq5osyVR1nwZDMZT6NA50CvI44Y5z5e8tb6
 WVMMU1pZh1/KkvZX+vh7voYbC3HHyI43BWRG50boAve8lQZfSNGP6PDjE6Sw1G1MK8X9
 hOpwRkPmh77mxVXSsjp+5bh4V4NbakDp1trbGSwbZo5kvL8aPJzCqofGYyefj1Huor2R
 Zsb/WcMj6lcYt8CPrIfGVgKwfeguk60ggqQ5IINJy9ws9Zgm3w0IK9rUugibNbPGMuFJ
 /174ZmKaeQhzJrDs/4/aSFruyPekzqBkd25cPKc1R8m4sIz0RC+6ne4b2YQV7HCPFo5G
 Bxow==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+Cgp2Mjogc2V0IG1taHViIG51bSB1bmRlciBDSElQ
X0FSQ1RVUlVTIHN3aXRjaCBjYXNlIGFuZCBhZGQgb25lIG1vcmUgbW1odWIgaWRfbWdyCgpTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhh
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5oIHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgIHwgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKaW5kZXggOGU3OGI4
MWQwYTA1Li40MmRhZjg4NzdjM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5oCkBAIC0xMDAsOSArMTAwLDEwIEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsKICNk
ZWZpbmUgQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfQUxXQVlTCTIKIAogLyogbWF4IG51bWJlciBvZiBW
TUhVQiAqLwotI2RlZmluZSBBTURHUFVfTUFYX1ZNSFVCUwkJCTIKKyNkZWZpbmUgQU1ER1BVX01B
WF9WTUhVQlMJCQkzCiAjZGVmaW5lIEFNREdQVV9HRlhIVUJfMAkJCQkwCiAjZGVmaW5lIEFNREdQ
VV9NTUhVQl8wCQkJCTEKKyNkZWZpbmUgQU1ER1BVX01NSFVCXzEJCQkJMgogCiAvKiBoYXJkY29k
ZSB0aGF0IGxpbWl0IGZvciBub3cgKi8KICNkZWZpbmUgQU1ER1BVX1ZBX1JFU0VSVkVEX1NJWkUJ
CQkoMVVMTCA8PCAyMCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDZk
NDIxMjQwNmMxYy4uZmQyMmVhYmE4MGUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTYzNyw3ICs2MzcsOCBAQCBzdGF0aWMgaW50IGdtY192OV8wX2FsbG9jYXRlX3Zt
X2ludl9lbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nOwogCXVuc2lnbmVkIHZtX2ludl9lbmdzW0FNREdQVV9NQVhfVk1IVUJTXSA9Ci0J
CXtHRlhIVUJfRlJFRV9WTV9JTlZfRU5HU19CSVRNQVAsIE1NSFVCX0ZSRUVfVk1fSU5WX0VOR1Nf
QklUTUFQfTsKKwkJe0dGWEhVQl9GUkVFX1ZNX0lOVl9FTkdTX0JJVE1BUCwgTU1IVUJfRlJFRV9W
TV9JTlZfRU5HU19CSVRNQVAsCisJCUdGWEhVQl9GUkVFX1ZNX0lOVl9FTkdTX0JJVE1BUH07CiAJ
dW5zaWduZWQgaTsKIAl1bnNpZ25lZCB2bWh1YiwgaW52X2VuZzsKIApAQCAtMTAwNCw2ICsxMDA1
LDggQEAgc3RhdGljIGludCBnbWNfdjlfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAkJCWFtZGdw
dV92bV9hZGp1c3Rfc2l6ZShhZGV2LCAyNTYgKiAxMDI0LCA5LCAzLCA0OCk7CiAJCWJyZWFrOwog
CWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwkJYWRldi0+bnVtX3ZtaHVicyA9IDM7CisKIAkJLyogS2Vl
cCB0aGUgdm0gc2l6ZSBzYW1lIHdpdGggVmVnYTIwICovCiAJCWFtZGdwdV92bV9hZGp1c3Rfc2l6
ZShhZGV2LCAyNTYgKiAxMDI0LCA5LCAzLCA0OCk7CiAJCWJyZWFrOwpAQCAtMTA4NCw2ICsxMDg3
LDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAkgKi8KIAlh
ZGV2LT52bV9tYW5hZ2VyLmlkX21ncltBTURHUFVfR0ZYSFVCXzBdLm51bV9pZHMgPSBBTURHUFVf
TlVNX09GX1ZNSURTOwogCWFkZXYtPnZtX21hbmFnZXIuaWRfbWdyW0FNREdQVV9NTUhVQl8wXS5u
dW1faWRzID0gQU1ER1BVX05VTV9PRl9WTUlEUzsKKwlhZGV2LT52bV9tYW5hZ2VyLmlkX21ncltB
TURHUFVfTU1IVUJfMV0ubnVtX2lkcyA9IEFNREdQVV9OVU1fT0ZfVk1JRFM7CiAKIAlhbWRncHVf
dm1fbWFuYWdlcl9pbml0KGFkZXYpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
