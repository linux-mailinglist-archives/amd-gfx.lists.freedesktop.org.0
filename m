Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A936A03B
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A9589F2A;
	Tue, 16 Jul 2019 01:27:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798489F24
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h18so17754572qtm.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jd35kbXBwjUd8vOKBbQOqSfTCuRqRF5Jq6ql5XhYPz0=;
 b=lwqxxbEZ8Fl+ELWhbXWD1eKqkL8cTTtbsGqD1+mfoDg0pp45rrbn7dLCpZyJSAd9Sn
 HnPfoDP9H+0EdlNu/36sDqiyroHjuHAcp1OZLzAL5yl7D1p7Fi2awIN/LFroMjrztVGC
 9Vo1PT0r5KzUgoGRNwCOorbPYsiSP4xATbkrelSUX2EfBKMVGctiCob7fp0ddBJ/+yrP
 gePYW2L7jTBea7j3xzgebkG2aWQRyxNyXFZnpikyQypFig54lIT78RrSD/rj0oOppJqD
 gXEtEMOu9aV8s/j5FFJO405RH4WAlWUJVYNcjt+7yi/kVBc0y/Q0qFgslnOu0PKIctZq
 0mjA==
X-Gm-Message-State: APjAAAWuuyu9qip5O/IsNxZaLCJor3mdeU64BJ5KzQSdPgC4TZoDR2To
 XD7Vmv53EpRQuxyQcyzA6Z1Miy8B
X-Google-Smtp-Source: APXvYqykRNJ2/ofTt2evQpyaMmoKxedP6rG3U7gF5z6kEcRVFKLaJH2DgbfhnwvSYD/9K1OAxRNWyw==
X-Received: by 2002:ac8:1106:: with SMTP id c6mr19077330qtj.332.1563240472555; 
 Mon, 15 Jul 2019 18:27:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 094/102] drm/amdgpu: limit sdma instances to 2 for Arcturus in
 BU phase
Date: Mon, 15 Jul 2019 20:27:33 -0500
Message-Id: <20190716012741.32036-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jd35kbXBwjUd8vOKBbQOqSfTCuRqRF5Jq6ql5XhYPz0=;
 b=eQ6vH9jkHknJ0jlUzQh8qPl/EVn33A2xi4PchDJ9goSZDy/bDlNqF0jRvbw9qlvxZX
 L1kil8rULUlmGoc97pXbYVIQkKpRV9lmnGfw69D1y04rz2rgXl2/Sg8u+widBZmr3KPd
 YX0Z74edUcLRiQnwEp32NNolbLqs1tQE3wIhVFXuvEUbcN0okj/7+btpgyXnhMKIPkBb
 iK30ec3WBYsfdGtqT6EGYvMvK4ygKmurqDjvcS+wudgOsRKSNenn7H2FIi0I8rjli8QK
 B6liOrWhpamUhCCHLOxKL0O/JhuYHx75z4oPETHR5FYancNTnSFf1ibabqp5jONtGs0F
 UV/A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBbm90aGVyIDYgc2RtYSBpbnN0YW5jZXMgZG8g
bm90IHdvcmsgYXQgcHJlc2VudC4gRGlzYWJsZSB0aGVtIHRvIHVuYmxvY2sgS0ZECmZvciBzaWxp
Y29uIGJyaW5ndXAgYXMgYSB3b3JrYXJvdW5kCgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCAxNjZiMTk5OWRjYmYuLmM2OGJiY2Y1
MjYwMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTE1OTksNyAr
MTU5OSw3IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQog
CWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikKIAkJYWRldi0+c2RtYS5udW1faW5z
dGFuY2VzID0gMTsKIAllbHNlIGlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykK
LQkJYWRldi0+c2RtYS5udW1faW5zdGFuY2VzID0gODsKKwkJYWRldi0+c2RtYS5udW1faW5zdGFu
Y2VzID0gMjsKIAllbHNlCiAJCWFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyA9IDI7CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
