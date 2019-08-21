Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8789871D
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28F96EA1C;
	Wed, 21 Aug 2019 22:24:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6A06E9AF
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:18 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x4so5103467qts.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXuZkib7i3DA5niQCAOdv1zOrMZ82FBrKcmAm4i+rTY=;
 b=fHBflnD1xgjGfs+h8KcgVYowW74/CpYR4yvXW1AFsqCgAtsRoXpWd+xI5dqW7DSQp5
 7wLgXfMsrVmvvN7LGQEHe8GwSBreEo3ItD1p39OavwiMv5vmiNneNdK0UA/sRy8qgA3g
 EZ+2FUKuoNcj1N04wpHGdbeZf48Z+BOD+8Vc1j+qR9+Wl7mIlNKJmomJ8gjLyl9A5zwy
 zMYpHZla3dDoF4lUWhOOqyy43FET5bOx52vpsQhiXfdvl8SOnRzrwruVX580GzkR9nCM
 hLbKMavftfLnFW4tJWmE7uiIiTszD4gbHcHVrcWGJcNwaSIcq+ra2PQVPk9/3NgiK2xQ
 ilkA==
X-Gm-Message-State: APjAAAXC75mgs/wMiiYszh50hjlnWew5gL5xx80bj18TNPlD6KrmWXfL
 X1KxQ+qmdrjZIb62vTQ8dTRmH7xt
X-Google-Smtp-Source: APXvYqxGyfgQH4Ql+DBJ6jbaeCu4RsKqnTvGBxEkiSNoffGAH+meYo6Gle9h+6ESbuMERZSuwQmZlw==
X-Received: by 2002:ac8:22ac:: with SMTP id f41mr33619624qta.362.1566426257343; 
 Wed, 21 Aug 2019 15:24:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/37] drm/amdgpu: skip dpm init for renoir
Date: Wed, 21 Aug 2019 17:23:29 -0500
Message-Id: <20190821222359.13578-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXuZkib7i3DA5niQCAOdv1zOrMZ82FBrKcmAm4i+rTY=;
 b=GBbGIN2UFd3vbbKndrm25cQg+R9loVLCKl6Vj7zfEyfbPPTmFa38x27NCiGOaxKwgD
 umw+oZ/l+RCi22U326jDTo9CuMh4CYmcVSkdjOkueQOr7E10wb53ujguvh1LV18dwuxn
 VAleEM0yrsiMXUJDXZaMqv7FtH4ufvlXdTmyp1o7TRr30+JYMz4XUJxm2qhoxDOl0llH
 CXiRp4daT8kvskeGpPK6njwHQoojpdRLb4Iy/iwB/sCCLpd9P5Z66OwSOSMa3SZN4IoB
 D0oYEYwazeCFgF5TF1IdRPdXW9NaMJoJR7ZaVE3hnV2HNtSz0s0AMKuIY+v67+M81osE
 tWYw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClJlbm9pciBEUE0gaXMgbm90IGZ1
bmN0aW9uYWwgc28gZmFyLCB3ZSBza2lwIGl0IGZvciB0aGUgY29tbWVudC4KV2lsbCByZXZlcnQg
dGhpcyBwYXRjaCBvbmNlIFNNVSAxMiBpcyBmdW5jdGlvbmFsLgoKU2lnbmVkLW9mZi1ieTogSHVh
bmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGQ2
YzY2MjE2ZWI5NS4uNWFiM2U3YjhjNjhhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jCkBAIC03NjgsNiArNzY4LDExIEBAIHN0YXRpYyBpbnQgc211X2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpCiAKIAlpZiAoIXNtdS0+cG1fZW5hYmxlZCkKIAkJcmV0dXJuIDA7
CisKKwkvKiBUbyBiZSByZW1vdmVkIGFmdGVyIGRwbSBpcyBlbmFibGVkICovCisJaWYgKGFkZXYt
PmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKKwkJcmV0dXJuIDA7CisKIAltdXRleF9sb2NrKCZz
bXUtPm11dGV4KTsKIAlzbXVfaGFuZGxlX3Rhc2soJmFkZXYtPnNtdSwKIAkJCXNtdS0+c211X2Rw
bS5kcG1fbGV2ZWwsCkBAIC0xMjY5LDYgKzEyNzQsMTAgQEAgc3RhdGljIGludCBzbXVfaHdfaW5p
dCh2b2lkICpoYW5kbGUpCiAJaWYgKCFzbXUtPnBtX2VuYWJsZWQpCiAJCXJldHVybiAwOwogCisJ
LyogVG8gYmUgcmVtb3ZlZCBhZnRlciBkcG0gaXMgZW5hYmxlZCAqLworCWlmIChhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9SRU5PSVIpCisJCXJldHVybiAwOworCiAJcmV0ID0gc211X2ZlYXR1cmVf
aW5pdF9kcG0oc211KTsKIAlpZiAocmV0KQogCQlnb3RvIGZhaWxlZDsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
