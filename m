Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66425CA020
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE9A6E9EA;
	Thu,  3 Oct 2019 14:13:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8836E9EA
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:13:44 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so2500196qkd.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 07:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WD96Dz6sAetb8TgQMTd790XtRnGOs7DG40P2holNgOc=;
 b=NL6T0neWMlfFwa3t2MYDSP2zrO0rq95COP/LamGC48XhPeyOc0BWpN1MdZlByqBIyx
 3jiRDLJrAh/R9+raffOts0AIpfaXp+o6jbumlxwG/IKFsKiHA4ofT9/FVn/zILNpF4Yf
 YafvVrSL+tweqgAXGTwmANlcuRg7o1iXtGQXf6a5nOxTPRsS0SiQjASXiLLU9HrGtbna
 azeMdQSNPfxLxLixMMKhUEmmR/Gp1e5mzibJ/MlIyuKJgT5djUMPJaiG7Iz0ecGw30vd
 H/YfsQFOYzEAj1++NCkMrA6MPpVSjJqWRTtmhKSgoNZl4Ba0Y8gYlk82tYweg81rUl0e
 R9Rg==
X-Gm-Message-State: APjAAAXDS+27sUkA7qHxNhcZXkxPO7NOHozyipX53erOLQJZQ2U/Coyd
 ynWc+Ha/H1brdE8JM+ZprhT5DaQ1
X-Google-Smtp-Source: APXvYqzDnIHgLbTx++za15Xdg0HaIcOqIQWYsXeAJ46YTixqz8Ma/voAaX7wpbv7oQQJFshe1mcuzw==
X-Received: by 2002:a37:b045:: with SMTP id z66mr4172556qke.428.1570112022870; 
 Thu, 03 Oct 2019 07:13:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w34sm1515790qth.84.2019.10.03.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 07:13:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: disable MSI-X on APUs
Date: Thu,  3 Oct 2019 09:13:26 -0500
Message-Id: <20191003141326.7600-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003141326.7600-1-alexander.deucher@amd.com>
References: <20191003141326.7600-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WD96Dz6sAetb8TgQMTd790XtRnGOs7DG40P2holNgOc=;
 b=OvPuIFeYbP1xg0vDx1zKG46Z+JvsaWfuonDmW/WLyr3zNNO9geG8BH5zOEu/vjQ7pW
 HJJNq6/aDiozYXmEiAzYMYVZEAHtEbGknLDhNwLJ/MlwGzmZrF4kXbVC+8xLCtM1iC4s
 rJBWTTG1fYnCTT5amLUmSiFjyQgthHJeByOGBkfivMeo8opqRS32f6al8FdZ4DL3jMHp
 RpOZbYutJ7djHWSPm/wT5gCYTxHyPG6vE/5A9w+c+xwDc8VuvtHiBz/QVwmkWkf0vzIt
 CYqktqnujbCAfVfN0UivKG8QLTYDKbb7bD4LAn8oJxx4LEoBStMkb0Ii23x8XRPE1NO+
 YeNQ==
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
 Tom St Denis <tom.stdenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmF2ZW4gY2xhaW1zIHRvIHN1cHBvcnQgdGhlbSwgYnV0IHNlZW1zIHRvIGhhdmUgcHJvYmxlbXMu
ICBTdGljawp3aXRoIE1TSXMgZm9yIG5vdyBvbiBBUFVzLgoKVGVzdGVkLWJ5OiBUb20gU3QgRGVu
aXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaXJxLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwppbmRleCA5
OGFhMjhlZGJhNmEuLjhmMjIzNmJkN2QwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2lycS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pcnEuYwpAQCAtMjQ4LDcgKzI0OCw4IEBAIGludCBhbWRncHVfaXJxX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXVuc2lnbmVkIGludCBmbGFnczsKIAkJaW50IG52ZWMg
PSBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+cGRldik7CiAKLQkJaWYgKG52ZWMgPD0gMCkgewor
CQkvKiBSYXZlbiBjbGFpbXMgdG8gc3VwcG9ydCBNU0ktWCwgYnV0IHNlZW1zIHRvIGhhdmUgcHJv
YmxlbXMgKi8KKwkJaWYgKChudmVjIDw9IDApIHx8IChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUp
KSB7CiAJCQlmbGFncyA9IFBDSV9JUlFfTVNJOwogCQkJbnZlYyA9IDE7CiAJCX0gZWxzZSB7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
