Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85AD69E16
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2ED89E5F;
	Mon, 15 Jul 2019 21:25:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857EA89E5F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r6so13079430qtt.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xlv2SJUIm4wkX9kIfeYy0w/XVMu3dRZM//GbmmD3XW8=;
 b=tiIikbOR/c2lbDr5L/oJKLvid21rsVxWGSy852OO1DPZA276hiTN8zmTavI/KBPiaP
 5bel3PeWhW0A4/j2tkdx0UR79+SV0TxYxsYF3tpkha9IcIFnz/BtrH2ZBlOnfn+cBv/e
 L6S4+lqXba3i+4jjwOJhClZuwR89XoG+YM1wgxY4xzrXEhdK3D9zqWynW+aGyGR+bxXr
 D5nm9ZRqVwuaPk5X3c/5efxNwroi/kPpRGuTeNEi59Ds347E7REWk68ctZhbQUtxcQeN
 dyI6w9sCcDGEF1k/N4oQteIs8WuvNZt/bENdgmn6do+Z2bz9sp9DF2U/8A+H13isLQK1
 E+aA==
X-Gm-Message-State: APjAAAXnWPenTBfZgIwL7I+/0HwMkrO/mbmzX5rJylvfxHbfnUuff6VK
 uRcKk30hT1ULiD8gLerUrNn65Lz6
X-Google-Smtp-Source: APXvYqytjYH1dwKDUD5laiYGCuCcaQB78aEsYDtggYNNG1IygEB4Ztug3oMTCk42T5i2YDZnox6nyw==
X-Received: by 2002:a05:6214:601:: with SMTP id
 z1mr3555228qvw.197.1563225918581; 
 Mon, 15 Jul 2019 14:25:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 038/102] drm/amdgpu: add Arcturus chip_name for init sdma
 microcode
Date: Mon, 15 Jul 2019 16:23:33 -0500
Message-Id: <20190715212437.31793-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xlv2SJUIm4wkX9kIfeYy0w/XVMu3dRZM//GbmmD3XW8=;
 b=cy8T1AaRuJsKkxrKWNGQuUj3SnatYVGm/TaUJtWW7iANa/Mjyub+J4D0gFrvJTmHmT
 GNKxHXRqqj1qLtG9UDP3gsxXEMg/CItO3KFgS39wCyzsayyhJLyVpdib6xEwOQOL8Q9s
 CrMKyC0QLr0QFjKpj5UuMrCZfUvjR12masLUmhkq1QUXxRCQRJcGj8nexvCLPQZCS10l
 dHNynC1L/W9Kimu6E5bM9PdJA6wkUTe517QpoiOSHCkiyvEG09ZC8LG2Zr/c2BzgYdY3
 rHQmslEjkdRntazHzVc7Z6UL9ATvozveBvTZ11WPV5IR0raChI7h9GtSM5dDse1QU4Iu
 Fo2g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8w
LmMKaW5kZXggMGNhNDFhOGE3ZTViLi5jZjA2NGNhYTE2MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0zNjYsNiArMzY2LDkgQEAgc3RhdGljIGludCBzZG1hX3Y0
XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWVsc2UKIAkJ
CWNoaXBfbmFtZSA9ICJyYXZlbiI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwkJ
Y2hpcF9uYW1lID0gImFyY3R1cnVzIjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
