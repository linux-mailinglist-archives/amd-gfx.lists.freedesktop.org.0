Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22A5101E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C125F89C55;
	Mon, 24 Jun 2019 15:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAC58996F
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v18so12976073ljh.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPP7gB0iiIHptZW7ZQRlgVx6L5sDTx2fseu33v/Q+f8=;
 b=BKqDLkgVWhe2CoQUSOzyT8lMTmO0quOKAVBQt5BAmGG8xhpfAsKur7A228jvlAmG/t
 CNbd9KMvCd4zgaNlS2x9hRRCbEClJbRHmBaVVNyq1LjKfr0vSaS9Vg1IPx6SJ+ybUiQ0
 YDOu6FkTZEG/PhZTZ/MeIYOhuEGqGV5JJpy9CQQ8rVYb8rdwcIEHVVR3Axr2aeVAHBMG
 F0SbVx+P/BN0d+5gsPKxfRpgXuPG5y/Qlib1XTtUOMUDXZPyqx2yP05nVMvqKnTN0x2S
 uRdDMEuffkJ26t4HUSlm7mNqb3yedAn1W8y8bW9s3ZtmUtfYFSzu3+ouMIQMDJV6TX8O
 Ka3g==
X-Gm-Message-State: APjAAAXuZAuVuopfxakJVtE5fvyQNAZ48LF2/alxfUDonQ1KG0Q9c0kj
 NLRiBmJTTvgcm18wnWTQbDoa7ejXeeA=
X-Google-Smtp-Source: APXvYqw7n58mpKNQkGD5k1NWMWxyWP9/5yfK2XQ6sE02dFlr70NyZDf4P8/6Ylgq3hJi/NAAz88s5A==
X-Received: by 2002:a2e:5341:: with SMTP id t1mr5176854ljd.170.1561389353723; 
 Mon, 24 Jun 2019 08:15:53 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.52
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:53 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amd/amdgpu: Fix amdgpu_set_pp_od_clk_voltage error
 check
Date: Mon, 24 Jun 2019 17:15:40 +0200
Message-Id: <20190624151544.13934-2-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624151544.13934-1-ernstp@gmail.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PPP7gB0iiIHptZW7ZQRlgVx6L5sDTx2fseu33v/Q+f8=;
 b=bVVtqEhQovTgMjRo/xIetWFgg06Q492bzvRqv5iB+lObUvotYJvm/udguxl5CSzIkt
 QhkDq0EzUGAVDD1RJp1Y0CsZiV/vajwU9zWqe1V0EddYX9yuaTk7eh5QzFGC6LwkKx3x
 REw3Bds81km8Ye+Q7RpEtGoJ3+k9Ozw930Mxr8G53lvhreY6gp6RDluyYP3BEws51Umh
 9xhMKMgHDZ8X0E3WlxAgw3e8p3Ai9qHL9Gr6JUC4lG3OY6BtxyaClfV2+ziRscMxyFgF
 4exbuM9BBTXP1gMG61aAIP8O2ClWy5hPRcptnoHykKXDKfepPhEhrYVaWsqVqOSKabXj
 To1Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVwb3J0ZWQgYnkgc21hdGNoOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0u
Yzo2OTMgYW1kZ3B1X3NldF9wcF9vZF9jbGtfdm9sdGFnZSgpIGVycm9yOiB1bmluaXRpYWxpemVk
IHN5bWJvbCAncmV0Jy4KClNpZ25lZC1vZmYtYnk6IEVybnN0IFNqw7ZzdHJhbmQgPGVybnN0cEBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCA4
ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggMmY0YjAzYjRlODgy
Li5iNDRhMzkwMDg2ZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBA
IC02ODYsMTIgKzY4NiwxMiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX29kX2Nsa192
b2x0YWdlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJaWYgKHJldCkKIAkJCXJldHVybiAtRUlOVkFM
OwogCX0gZWxzZSB7Ci0JCWlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPm9kbl9lZGl0X2Rw
bV90YWJsZSkKKwkJaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+b2RuX2VkaXRfZHBtX3Rh
YmxlKSB7CiAJCQlyZXQgPSBhbWRncHVfZHBtX29kbl9lZGl0X2RwbV90YWJsZShhZGV2LCB0eXBl
LAogCQkJCQkJcGFyYW1ldGVyLCBwYXJhbWV0ZXJfc2l6ZSk7Ci0KLQkJaWYgKHJldCkKLQkJCXJl
dHVybiAtRUlOVkFMOworCQkJaWYgKHJldCkKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQogCiAJ
CWlmICh0eXBlID09IFBQX09EX0NPTU1JVF9EUE1fVEFCTEUpIHsKIAkJCWlmIChhZGV2LT5wb3dl
cnBsYXkucHBfZnVuY3MtPmRpc3BhdGNoX3Rhc2tzKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
