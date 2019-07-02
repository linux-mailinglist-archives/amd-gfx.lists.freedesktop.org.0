Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774A5D761
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6C6E056;
	Tue,  2 Jul 2019 20:29:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965EB6E055
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:11 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v22so1906806qkj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4zm1/jy+gGw7tEomEPQc8ODyiTolKpIhhXEtsbwWDM=;
 b=kQx/1EeXxNx+NckCu4IreYB3eFXJueIknYfcwmM3OOGfzs6doOilQ+/V8cYr6zRh0f
 xKUDfhSPM/4NCr20a83PfxrSLk+TLkY6FUaYY5GU03Aj9uCjM7mJbRKrkOKQtRTZuDap
 cHOTHYGTZjTjFntVJOXkC/qE4IjL7lkcV8HpuIAQHNBLZnRsecKEHLjqvewJcRtOgKNM
 2baJ9zSrf+MQUfrXFB1HEYz6wCruXWsLpD4Z8j0Ob21nr2adURYaFTz6/SxTVpNjMmwj
 oYpEzUUnXv5GjH0jo87zKgy9X8/kA4WFrPtPlcQFwLmeyiOEdn4Y/p/kIhZwDronE10z
 Npsg==
X-Gm-Message-State: APjAAAXgZfjfDqWwzvTVujXUcdD8J9OARTIcv9NAiNlYRT5NwpLxyACd
 mFKGC5zbTgqf3jbkt9TRAdlcZrY04xo=
X-Google-Smtp-Source: APXvYqx6JuKCApVDSgSKyI+Ct2yfzGwAEF2Ft3CMCiAFdHu5ODtFGB/lHJyJTnrGCPuImOzyVyhYIA==
X-Received: by 2002:a37:668c:: with SMTP id
 a134mr27842080qkc.477.1562099350627; 
 Tue, 02 Jul 2019 13:29:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/53] drm/amdgpu/gfx10: add clockgating support for navi14
Date: Tue,  2 Jul 2019 15:28:08 -0500
Message-Id: <20190702202844.17001-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4zm1/jy+gGw7tEomEPQc8ODyiTolKpIhhXEtsbwWDM=;
 b=hE635/GDdHP6ouY5/C4ncGW9AVsyNLp3yc0/bde/lttzzrQ7dhRNrYlJi/R+zwG0PI
 4QW/MBM14XWK6p4K0tX0HxTc1boQAAboMZVcpFudMjz8Yfx4+qvm/04TKLN7oCGGNJMO
 GwXjDk3a6nUO1qeMYmhIVPMAE2JJYZdOsdmBpt/J9okFAkTZT9HVMfMbiQ7PtI9ku1kM
 J1kFHTAqHTU68mNNJlPLdbmBd6xuX5r14iCA3EY63mSLo4iVTLd3r9DCgtttRJNjaPHr
 ebxgwyC9p8Ggj5pOt57A8/yLi4b/XrwJU7CNbPjJ9BLnmNLFr3bAo3dqDcvBjuACsOhG
 h1og==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBkZDI0MzQwNmZj
ZjQuLjZmN2E3NTEzN2FjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMK
QEAgLTQwNzgsNiArNDA3OCw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX3NldF9jbG9ja2dhdGlu
Z19zdGF0ZSh2b2lkICpoYW5kbGUsCiAKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNh
c2UgQ0hJUF9OQVZJMTA6CisJY2FzZSBDSElQX05BVkkxNDoKIAkJZ2Z4X3YxMF8wX3VwZGF0ZV9n
ZnhfY2xvY2tfZ2F0aW5nKGFkZXYsCiAJCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUg
PyB0cnVlIDogZmFsc2UpOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
