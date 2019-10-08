Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D9D0130
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DA86E895;
	Tue,  8 Oct 2019 19:29:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA7E6E895
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:43 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y144so17897437qkb.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejz+XaQFFHASMJ7gV9kquhwYpydOLnVvRClbn0RnhdY=;
 b=d8SIGF4mNsjNDbSEV0LbOA2z4ZGShRDxB50TL3YXKF38vwNQfmCWnsotX5H+qUADy1
 SfXP0W66us9j3XhHNyk2DrkOMOtCz+ag6vJ36oM5+oU5QQvR1eM8g9gz88qr6EVvXEtK
 FP9yYGCodMc12Bf/x731zceYwvSv2XL3hR6vrMZ4/TtqDmrjWDQ7bEolVdyJDRZ1FRKN
 OfouXP241rxRXFPDYcDnBc2MccfKaw+kEAPPopOv3z5hWH084BIZLFnsOnLCP62ouCfm
 8B3fI3gjqaSILzBV2Z+D1V5G8zKSCrwNL4CsiYWDU6soT1HlkK/9UAIEpNVgs8j4BqEr
 k7xw==
X-Gm-Message-State: APjAAAWdQ2V9idyUEL5Je8BDQ0Ir+FZyr8stHXaHxT6uYzjeC+qRk90C
 3+/6cAFi0pfgKN5LPwFTlLszmMrQ
X-Google-Smtp-Source: APXvYqxUqkJ9cFXSX1LP2vAKeD4q0LMqM6L09MSE4tsfb0iG+9btLLw+Jx/NQidbUkPkOL9mYTPgJA==
X-Received: by 2002:a37:a8ce:: with SMTP id r197mr1924069qke.374.1570562982157; 
 Tue, 08 Oct 2019 12:29:42 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] low latency memory training for navi
Date: Tue,  8 Oct 2019 14:29:26 -0500
Message-Id: <20191008192934.5481-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejz+XaQFFHASMJ7gV9kquhwYpydOLnVvRClbn0RnhdY=;
 b=iK5prNjASgOj3IMrgCnHVqzfw6da/ytsd/UN8jOA/KYv6/jVGBirJ0kU+9QiA0Pmot
 pYBgAecJ+QgL3XLOeMrlhiW9iHhg3MTCX7hrmsKHckMYvpU0rILJzN3BsKBQwqPz93EP
 0oftb5If6FNVTmJ0V7gtfytLVay9/9a80a6c2h3Xw5siha4MWl13yqFvjVmtSYQkst+m
 PH/UrWCYduF/ZmSyG9jqoUe/IDHb8MVxN4F66kLIiYUA0Njffxwlgp+B9XMCgKnVoY2X
 XltnBJEIaSMK2cWDikrbC6yhJGYkpWLjCi/5XvsgBsqZI7hOSKeAe3qSFRfch6U9DtEX
 U1bg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgaW1wcm92ZXMgdGhlIGxhdGVuY3kgZm9yIG1lbW9yeSB0cmFpbmluZwpv
biBuYXZpIHBhcnRzLgoKVGlhbmNpLllpbiAoOCk6CiAgZHJtL2FtZGdwdTogdXBkYXRlIGFtZGdw
dV9kaXNjb3ZlcnkgdG8gaGFuZGxlIHJldmlzaW9uCiAgZHJtL2FtZGdwdTogYWRkIGEgZ2VuZXJp
YyBmYiBhY2Nlc3NpbmcgaGVscGVyIGZ1bmN0aW9uCiAgZHJtL2FtZGdwdTogaW50cm9kdWNlIHBz
cF92MTFfMF9pc19zb3NfYWxpdmUgaW50ZXJmYWNlCiAgZHJtL2FtZGdwdTogdXBkYXRlIGF0b21m
aXJtd2FyZSBoZWFkZXIgd2l0aCBtZW1vcnkgdHJhaW5pbmcgcmVsYXRlZAogICAgbWVtYmVycwog
IGRybS9hbWRncHUvYXRvbWZpcm13YXJlOiBhZGQgbWVtb3J5IHRyYWluaW5nIHJlbGF0ZWQgaGVs
cGVyIGZ1bmN0aW9ucwogIGRybS9hbWRncHU6IGFkZCBwc3AgbWVtb3J5IHRyYWluaW5nIGNhbGxi
YWNrcyBhbmQgbWFjcm8KICBkcm0vYW1kZ3B1OiByZXNlcnZlIHZyYW0gZm9yIG1lbW9yeSB0cmFp
bmluZwogIGRybS9hbWRncHUvcHNwOiBhZGQgcHNwIG1lbW9yeSB0cmFpbmluZyBpbXBsZW1lbnRh
dGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAx
MCArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYyAgfCAgIDUg
KwogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13YXJlLmMgIHwgMTMwICsr
KysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13YXJlLmgg
IHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8
ICA0MiArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMg
fCAgMTcgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuaCB8
ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAgIHwg
ICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyAgICAgICB8ICAx
OCArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oICAgICAgIHwgIDU1
ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgfCAg
OTYgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyAgICAg
ICAgfCAxOTMgKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
YXRvbWZpcm13YXJlLmggICAgfCAgMTUgKysKIDEzIGZpbGVzIGNoYW5nZWQsIDU3MCBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
