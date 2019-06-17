Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546849076
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A269E6E071;
	Mon, 17 Jun 2019 19:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C60989D4B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p15so12330782qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jxv5aQ7Rtgnw0oMwLE/E3XfGO2SxsNTRYdlgwDImd4=;
 b=OVUgY7f9b7qZokjLPn2ynWMymbxW5/l4kYCeb25lSHbjlzUjOQ4o7JbKs97v4H7VQF
 PlSAxukPgp/NdW65dgekscbauYMHTurg9kZxhT2zJA+m4ptZEQpQmqe8U/uAFT0A51pa
 O8sosi6JOukCBfeTfT+aEPh0sxVS/Zakj+R8SQKiTz36xMQqbQUS2sHc1nwFR1m1xn3G
 6Co8ehkRYrWfT4Byn9n3qQBU5OPWmDgzEFjP2ssxcds6XwDyaC87HVDyLrE+iP9LdHt+
 9oOXwXIaNMQlVufaUfLfhycwqI5Zn0097Qw2Co+RsfYG/opjC673+7MlXqZVrsV/BdfT
 eIKA==
X-Gm-Message-State: APjAAAXAeUZB+vBDGD5c2SIKT0iScR/yIewA7iJa0dyCDHh98wyxxxLG
 c9I+XU/0k1KkCBegeBw7CtnAy5/qt11piQ==
X-Google-Smtp-Source: APXvYqwfc0ibH61/976QX9tf2EkOSeGTCh57o2zkm81igVYRooO6lmzA7HW11bPjF9hvxtFVXztHZA==
X-Received: by 2002:ac8:6898:: with SMTP id m24mr94822462qtq.362.1560801035432; 
 Mon, 17 Jun 2019 12:50:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 439/459] drm/amd/display: Fix incorrect vba type
Date: Mon, 17 Jun 2019 14:49:28 -0500
Message-Id: <20190617194948.18667-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jxv5aQ7Rtgnw0oMwLE/E3XfGO2SxsNTRYdlgwDImd4=;
 b=tFcdTXGYus7h8ie34+/Ib+tq6aEG5VD56AkzyYLB+u4dsf6bIKsafrre2bjVqNzLf4
 R2ioqkBHJqsuovxGd34ypbeT46b3R/YkZSlhV6NFvZUWf6SqnKNtFJ+Et1jNqtYf2vL1
 c89dLDjyZasNc+n4LHBUcW3Z0rfnLW8myGsza0j6ypVSIiA6/gg6ZI8pZcfUJv6fZlNJ
 JPNpnrYhM49+Inv1WBfugto3XCzlVnDPzN2CqA93+I+RVuuyR6oc1hF9IgQ8hBqZAQ7a
 4Fy+ZjP9nl5ZSh85xWSc10JwCfSrjtAAA1U2MhQCbgxzRaqyIL1yLJhymQT4OHII3URE
 oXFg==
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKU3dhdGhXaWR0aENU
aGlzU3RhdGUgaXMgZXhwZWN0ZWQgdG8gYmUgYW4gdW5zaWduZWQgaW50IGFycmF5LgoKU2lnbmVk
LW9mZi1ieTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgpSZXZpZXdlZC1i
eTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rt
bC9kaXNwbGF5X21vZGVfdmJhLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCmluZGV4IGZhZjMzZTc3ZThkNC4uMDM0N2Y3NGNk
YTNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3Bs
YXlfbW9kZV92YmEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rp
c3BsYXlfbW9kZV92YmEuaApAQCAtNjMzLDcgKzYzMyw3IEBAIHN0cnVjdCB2YmFfdmFyc19zdCB7
CiAJYm9vbCAgICAgICAgICAgTGlua0RTQ0VuYWJsZTsKIAlib29sICAgICAgICAgICBPRE1Db21i
aW5lNFRvMVN1cHBvcnRDaGVja09LW0RDX19WT0xUQUdFX1NUQVRFUyArIDFdOwogCWJvb2wgT0RN
Q29tYmluZUVuYWJsZVRoaXNTdGF0ZVtEQ19fTlVNX0RQUF9fTUFYXTsKLQlkb3VibGUgICAgICAg
ICBTd2F0aFdpZHRoQ1RoaXNTdGF0ZVtEQ19fTlVNX0RQUF9fTUFYXTsKKwl1bnNpZ25lZCBpbnQg
ICBTd2F0aFdpZHRoQ1RoaXNTdGF0ZVtEQ19fTlVNX0RQUF9fTUFYXTsKIAlib29sICAgICAgICAg
ICBWaWV3cG9ydFNpemVTdXBwb3J0UGVyUGxhbmVbRENfX05VTV9EUFBfX01BWF07CiAJZG91Ymxl
ICAgICAgICAgQWxpZ25lZERDQ01ldGFQaXRjaFlbRENfX05VTV9EUFBfX01BWF07CiAJZG91Ymxl
ICAgICAgICAgQWxpZ25lZERDQ01ldGFQaXRjaENbRENfX05VTV9EUFBfX01BWF07Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
