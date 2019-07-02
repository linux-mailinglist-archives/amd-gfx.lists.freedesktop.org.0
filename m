Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6273B5D777
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6666E06F;
	Tue,  2 Jul 2019 20:29:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570326E06F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:30 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so15491643qkl.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4xgRbyugRICyM4Nh4+rF05pVR0oVecXFODo/fl/GfE=;
 b=qdKOIVgCK492JyAdgwx3+xxAfNpbFUxCyohCz7uJEUrhV2JkSiOtj4k/0qtZQ+UFla
 C6t9WaM2yc1zh4+XA3V3asyJsrTPlhzTWF3jYp9vnY2L+A+3OoDOm23Acdhmn3hwKlEZ
 dR46LfWb61fLkMoPZqaoZCLhOVcOJy4uBsbQfcXRA8LHxF8pA2K2VDxDzPciRgHBRaZf
 xFQlrzKhSFcxTvhX9NMCdCOT9L3zjqWNIa+ln6CPEyChRVUS339wKG/mU9oo1rLayyk5
 yWLYDsZEwG6FDOWgZbRvHKz/TTp1W66Ee3AznT2DFMZ5tCwVSSbwG6CLOZUoQ09ZE4fG
 Totg==
X-Gm-Message-State: APjAAAVg/x2ulz92p9DWkNwrZn7uLm91FNs5GQpI8pXsU1OMaOF0eeH5
 6psrIEVj3OGw+QSPsAudgRyV5c2dFS8=
X-Google-Smtp-Source: APXvYqw2IfNpH9dwt6q2VjRWQCABpXjynK24NZdJCswN4D0+HAQkBDz2dmLLh2WL4osHfoJTfSfaTA==
X-Received: by 2002:ae9:eb8b:: with SMTP id
 b133mr18939030qkg.497.1562099369344; 
 Tue, 02 Jul 2019 13:29:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 38/53] drm/amd/display: add ASICREV defines v2
Date: Tue,  2 Jul 2019 15:28:29 -0500
Message-Id: <20190702202844.17001-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4xgRbyugRICyM4Nh4+rF05pVR0oVecXFODo/fl/GfE=;
 b=vYf0rkD445Qm4FCd25mvoxa50c6GCOTaM0lA9+6SLHzmIt9l/MI37GphIyfWJ617GB
 H2+QRtzm23x0w/aH4oAdsoKxtbFGpAiXO+xStKKFBXxNQNkbI8YkP3+trAGs+eSacsCl
 AO0ANs8bjnr2eJ/nKHeq4Aj9l+mSfesMsQErGj/D5vaDbwjWsWAk2ZemFL6aVgFlXg+t
 lqoBQs0Str2YlHC3te5/m8J8C6ZKiVVtfuIhI9rkQN6uGQFpkX/3GusilNpghbYvKzND
 VkpvA02H61D+q7Qd6CvXWZm+S80mahYd5rMzjNgT5ofInokLoZd2ye6aRxBOb8j2QDFj
 JtGA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpBZGQg
cmV2cyBmb3IgbmF2aTEwIGFuZCAxNC4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogWGlhb2ppZSBZdWFuIDx4
aWFvamllLnl1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNs
dWRlL2RhbF9hc2ljX2lkLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUv
ZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9h
c2ljX2lkLmgKaW5kZXggODg3ZTZhODU5N2M0Li45NGI3ZDVlYzE1NWIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaApAQCAtMTUxLDYg
KzE1MSwxNCBAQAogCiAjZGVmaW5lIEZBTUlMWV9OViAxNDMgLyogRENOIDIqLwogCitlbnVtIHsK
KwlOVl9OQVZJMTBfUF9BMCAgICAgID0gMSwKKwlOVl9OQVZJMTRfTV9BMCAgICAgID0gMjAsCisJ
TlZfVU5LTk9XTiAgICAgICAgICA9IDB4RkYKK307CisKKyNkZWZpbmUgQVNJQ1JFVl9JU19OQVZJ
MTBfUChlQ2hpcFJldikgICAgICAgIChlQ2hpcFJldiA8IE5WX05BVkkxNF9NX0EwKQorI2RlZmlu
ZSBBU0lDUkVWX0lTX05BVkkxNF9NKGVDaGlwUmV2KSAgICAgICAgKChlQ2hpcFJldiA+PSBOVl9O
QVZJMTRfTV9BMCkgJiYgKGVDaGlwUmV2IDwgTlZfVU5LTk9XTikpCiAjZW5kaWYKIAogLyoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
