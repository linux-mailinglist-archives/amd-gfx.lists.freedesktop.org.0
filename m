Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A16B7555
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 10:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DA06F441;
	Thu, 19 Sep 2019 08:41:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3B6F441
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 08:41:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i16so3353687wmd.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 01:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0otO1aJ8H4wBm17PV0JPfHKWW3gFLr0S2I7T1qTHdY=;
 b=WIb5dktvtlAGBV7j1Ffi9v47CQNg6KTGuipKQQUwK1c9xDWlQx3QEuk6Im7FmNlw2k
 g/bUq+6CwY8g/2kMG1ZPPgrUMPjfK+fluok1w+ZaG+6jED+4VwAXEBtHUmPKDB7w9yeq
 DIUyfLLySaSaemjIPr36GJyfgB1WbOPOeCOCab/Ki4CMbM5Oa1z4MFkW1gz2IAJV1Fr4
 muCttsgdVX5o+f1yeheT7MW+OFJ+/NmVHRIt3pofmtGBxz9rEqTDo6Dbl7K1VJiesoKf
 fK98B/vQAkI9n9yY7ekeLjArHOVvxfadN8/ryLbwit8LFB9c1R5tbM+vs6Am6fc36pLd
 YEOw==
X-Gm-Message-State: APjAAAXbAaY/tIaN/go5oMOvVJ+7pgzmdDE9B4c/7UAMB1/W5QLieSZy
 GRrmUYxb1Lln/v9BmyMuSMmeO5YQ
X-Google-Smtp-Source: APXvYqw/nzGqpMgy1NBTto3FP76d9hgxEOQupq53UUg7CJkXDT/yemgMFXfiCYgckDCl0HK9FzRH4A==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr1954746wmk.150.1568882498413; 
 Thu, 19 Sep 2019 01:41:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5f0:e384:6df5:a05b])
 by smtp.gmail.com with ESMTPSA id e30sm15247180wra.48.2019.09.19.01.41.37
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:41:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix potential VM faults
Date: Thu, 19 Sep 2019 10:41:36 +0200
Message-Id: <20190919084136.82658-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0otO1aJ8H4wBm17PV0JPfHKWW3gFLr0S2I7T1qTHdY=;
 b=XuSdVs9AnxcWbfmDZahSqefkmpbJYs8cRCifnv5AhrMOftapblSD304J8h/sn7liWv
 gNGtfjF86IR0FJtcLD3z02jOWU0AMXyhVtc4SCkru4rEU4sFEQP5ceZUvF0o44uSfx+Y
 KPz4UqfYmbf5AQwwibB9oakkkoDOQlO8zZtoitL6sVRP3hNPE7UatZ1phqjm7eKMHU13
 Y7MZQFvQaMKtd7/8kKVy2XYgLcJNeZo5J3wSDeSLkmgKBpTEWY8mcCzcbUswTpGawdDZ
 R//lNqTfA3vMKlfdE62QPPc8d2DePEbsSyJMN57Ag2gkp++ojrM8bwoeHP5CbvNQdT1z
 2Wxw==
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

V2hlbiB3ZSBhbGxvY2F0ZSBuZXcgcGFnZSB0YWJsZXMgdW5kZXIgbWVtb3J5CnByZXNzdXJlIHdl
IHNob3VsZCBub3QgZXZpY3Qgb2xkIG9uZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMKaW5kZXggNzBkNDVkNDg5MDdhLi44ZTQ0ZWNhYWRhMzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKQEAgLTUxNCw3ICs1MTQsOCBAQCBzdGF0
aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
CS5pbnRlcnJ1cHRpYmxlID0gKGJwLT50eXBlICE9IHR0bV9ib190eXBlX2tlcm5lbCksCiAJCS5u
b193YWl0X2dwdSA9IGJwLT5ub193YWl0X2dwdSwKIAkJLnJlc3YgPSBicC0+cmVzdiwKLQkJLmZs
YWdzID0gVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVAorCQkuZmxhZ3MgPSBicC0+dHlwZSAh
PSB0dG1fYm9fdHlwZV9rZXJuZWwgPworCQkJVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVCA6
IDAKIAl9OwogCXN0cnVjdCBhbWRncHVfYm8gKmJvOwogCXVuc2lnbmVkIGxvbmcgcGFnZV9hbGln
biwgc2l6ZSA9IGJwLT5zaXplOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
