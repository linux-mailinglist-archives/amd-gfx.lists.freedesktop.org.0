Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D29874B
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFBD6EA2E;
	Wed, 21 Aug 2019 22:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C565E6EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:38 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w18so3376860qki.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkJXz80Ap7jc/dL2iYNSXr2mLBETO6CKpfsEdw0yWnk=;
 b=WGFXV+kNPzf4GXQy0AWpMLmj/7SVwnlDVSJpIuGQXm+whA+PweGFBwlMb5Rkb2wWKy
 xw2Hl066Jhpqw7hzc1a5MZlmBLnTLNw5v+mrZJ3okaejAZmD4GCU/hGg78WfJpHRUnlO
 Bc8MHiK8HpxuXdg3/lxKHOziDnpVpUhn1QanHlIO4UfdwmOM3jMy7jRScahOIno/WYUh
 r49RrTd1PVxSYIlsAFMqCWnxKkwYm8t1cL6zPIlUQDKwEFHz9Q+6es1KI/mYFeer1dSc
 3cSJQC1pmPeLP7mIVwww/g86r4/ZgYPVmz157ckpMK1KS8/3UhDCcONKHq9kwdGrxWVF
 fxog==
X-Gm-Message-State: APjAAAWFSRmGgoR0dKgScClOSicJG8NYKXYfzZArhHF70PZl6x9Ses+g
 1od1nlrzqwoqoTM3bCnY/NrFTh4k
X-Google-Smtp-Source: APXvYqxsyJOzqIcHh/MdhYuR9nKO8RPkqAZBlzLzXRofeHhK9S6xEXjzqnHFqbFOvWlNWpmd+vemvQ==
X-Received: by 2002:a05:620a:138e:: with SMTP id
 k14mr32969456qki.411.1566426277663; 
 Wed, 21 Aug 2019 15:24:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 30/37] drm/amdgpu/sdma4: set sdma clock gating for rn
Date: Wed, 21 Aug 2019 17:23:52 -0500
Message-Id: <20190821222359.13578-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkJXz80Ap7jc/dL2iYNSXr2mLBETO6CKpfsEdw0yWnk=;
 b=ovCyJ0bK6XP3z2JzXN/odrxqngIQNg6EayxAqAVig0R2TF8GSlnGlcMg/rcP4Cs09F
 JgfUc9THtGT6SxMlnIe/iEsOGzFHO4CTQFxThM0GwxGPTd5ImkDB3g64sxpTZng/QpAG
 qSoVbfEJB9/SXVocdwPKU6DAIdJJXT8JnfJY4UBnvqfBNak5H9FTaA8XVkeauA0TaiP1
 5+gK5BqSwNx9lOQ+cmsmkC4hYzgaFHpePGVV2K6Q0EMo+7Y3nmvdVr669yVzcA6Bgi//
 Eedgl+22259elxzu+wzWRtxFF+fQss8Tkoy4lYi1VZYjPzOiw0jk14ggh/HE47VbrIQz
 siqg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpBZGQgc3VwcG9ydCBmb3Ig
U0RNQSBjbG9ja2dhdGluZyBvbiBSTi4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlr
ZS5MaWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMKaW5kZXggMDcxZDZjOWEyNTRlLi45ZmFiN2ZkOTgyYjYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0yMTc4LDYgKzIxNzgsNyBAQCBz
dGF0aWMgaW50IHNkbWFfdjRfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAog
CWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2FzZSBDSElQX1JBVkVOOgogCWNhc2UgQ0hJUF9BUkNUVVJV
UzoKKwljYXNlIENISVBfUkVOT0lSOgogCQlzZG1hX3Y0XzBfdXBkYXRlX21lZGl1bV9ncmFpbl9j
bG9ja19nYXRpbmcoYWRldiwKIAkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUg
OiBmYWxzZSk7CiAJCXNkbWFfdjRfMF91cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwKGFk
ZXYsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
