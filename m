Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E091A5D771
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8FE6E05F;
	Tue,  2 Jul 2019 20:29:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93F46E05D
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:25 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id x47so20129015qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRnAYypiGVj8Pk9DZT5pM79JuxFNLhgUcQwGY3olWW4=;
 b=h4CZdII+MmJBAz1/6ihCBuUeLeyLICEfnpYtN8joBV1qXMUWCf00WK25jGmbaYvArw
 RInvBElnK0bZHhSXHyc03k5wynIF6hGEcdGhV30k9r8g2T16SyurWkMnyCscTVBFy5lt
 wfb3x/95mPCPHR/IdUAyiAHNSzQiOWYiLdQNZ/SEp5vfE7x9j8Z2EBivDMv3OpAZwJWN
 ZY1aA2aOpyhiQn+9ZfXiXW1xknt+kPL1fSKKk4b0ujX6ghPhoZ0Vwtaj12Z9qIqX7ySj
 ugLI0G7poJLkZLBmMW0l2r7zAHfM+4+JtT/9mX6Qg73Zqf5MUjqRsjPXSC4jrQjzO3+p
 urng==
X-Gm-Message-State: APjAAAW93+BkCW//gLaqyqogrjAII2eDsOjhTR9XDvCNUtF/mzt7Kz27
 s302/pq1aqwhoKBFWMt1KNmckWkEfu0=
X-Google-Smtp-Source: APXvYqy4rgTzv3iFWQutMfc9FDc3y0aUnGD0+C9//jZO0rRKUZ7PNFIpki+D5VZRB54P12IMAlBrww==
X-Received: by 2002:ac8:33f4:: with SMTP id d49mr27447020qtb.23.1562099364749; 
 Tue, 02 Jul 2019 13:29:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 33/53] drm/amdgpu/smu11: add support for navi14
Date: Tue,  2 Jul 2019 15:28:24 -0500
Message-Id: <20190702202844.17001-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRnAYypiGVj8Pk9DZT5pM79JuxFNLhgUcQwGY3olWW4=;
 b=CMKtpw6xowFyzlvy/v4gRvnAT181S5PsPTgH4zyJqlv9CV5tA8Q/wtPbLR9/ZJE/kp
 NUcDik1TkeCmaakBmsUScTJTXsjWo32ubOVFvsJm7HFvG3c4199vPlSW19qTCAYfzHyx
 Qp40dw2iQD71PK8haplbn7+AKwtmklypO00m24vpf0SEZSdfxFcJe4agVp3KUnBL5d7m
 lHXgZCryLdnHSjFQ5duOzgs3PGpWtQtLrsEfdbUxdzUf/Yp7JeM/yRJqXdgq7UhzUcXd
 ZZxhttBdYhG8k0vybLb7rK2ySV7QLsdPfxkDGLXwBGXTwTicGzBkr2SinYvL6GfJfSoL
 vZRA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jICB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmlu
ZGV4IDhhYzEzODUxNTY4MC4uYTZjMjAyN2NiMjdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC01MTUsNiArNTE1LDcgQEAgc3RhdGljIGludCBzbXVf
c2V0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN3aXRjaCAoYWRldi0+YXNp
Y190eXBlKSB7CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2Ug
Q0hJUF9OQVZJMTQ6CiAJCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfT1ZFUkRSSVZFX01B
U0spCiAJCQlzbXUtPm9kX2VuYWJsZWQgPSB0cnVlOwogCQlzbXVfdjExXzBfc2V0X3NtdV9mdW5j
cyhzbXUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBi
YzM5NjkwOGU3YjMuLjdjNzFiNDhjZDIzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKQEAgLTQyLDYgKzQyLDcgQEAKIAogTU9EVUxFX0ZJUk1XQVJFKCJhbWRn
cHUvdmVnYTIwX3NtYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9zbWMu
YmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfc21jLmJpbiIpOwogCiAjZGVm
aW5lIFNNVTExX1ZPTFRBR0VfU0NBTEUgNAogCkBAIC0xNTMsNiArMTU0LDkgQEAgc3RhdGljIGlu
dCBzbXVfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJY2Fz
ZSBDSElQX05BVkkxMDoKIAkJY2hpcF9uYW1lID0gIm5hdmkxMCI7CiAJCWJyZWFrOworCWNhc2Ug
Q0hJUF9OQVZJMTQ6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOworCQlicmVhazsKIAlkZWZhdWx0
OgogCQlCVUcoKTsKIAl9CkBAIC0xNjk4LDYgKzE3MDIsNyBAQCB2b2lkIHNtdV92MTFfMF9zZXRf
c211X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCQl2ZWdhMjBfc2V0X3BwdF9mdW5j
cyhzbXUpOwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6
CiAJCW5hdmkxMF9zZXRfcHB0X2Z1bmNzKHNtdSk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
