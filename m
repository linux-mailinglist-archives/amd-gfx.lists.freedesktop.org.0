Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6576A043
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8FE6E05A;
	Tue, 16 Jul 2019 01:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627346E054
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x22so12867381qtp.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXrADeJQoDr0AE4IwYzL6Tjy2GC4uD7ebb0KUksUakQ=;
 b=TVJeGPuuhW8iB5Ae81JhiDIOSqWUvfCoZIo/HaeECcT2hMjcyT63n1yn7BwAiw+HZO
 tkWS7K3u4MryEKS2jW2tAJz7EaDK3/p4fEA8FdjmTeaTQmnGi3VYocXeFrko4ubbXtjv
 WWEyBsLfrJJbaXdjLSveXAH3jI1AY+gY7gWKC2cFBnzDvugrhX/JQ4RzIJ73n2ONdzUz
 lKf8Jkg+Zb/1GuNhlBsYnlSzJgekbqJ/qv6J5qk/UBaTBhQoVLs5z7KZBDrVZiqo9EvE
 T5/0WNNrLwl9qn18wNW8y8CYt2ft7QqXZfW6rJ2EP55SJJx7kpBxMoRJtfNiPRa7McVp
 IYiw==
X-Gm-Message-State: APjAAAWITnvgmyQlibH/E/A86bcHryAKXLrwpdKiKNP6MVZZ+UeBvpQj
 swgQ9MMJ9YF7K1fAcOXSA7Ouu7k6
X-Google-Smtp-Source: APXvYqx+QLgscOytHZaLBujfnby2TYajQ1mVlODX5+jPYFTB8ZrGwQBYkmM3z/yjgLVDURUTDr266Q==
X-Received: by 2002:ac8:2d08:: with SMTP id n8mr20321702qta.383.1563240476305; 
 Mon, 15 Jul 2019 18:27:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 098/102] drm/amdgpu: enable all 8 sdma instances for Arcturus
 silicon
Date: Mon, 15 Jul 2019 20:27:37 -0500
Message-Id: <20190716012741.32036-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXrADeJQoDr0AE4IwYzL6Tjy2GC4uD7ebb0KUksUakQ=;
 b=IBJH4iImwYCdbLvKiSHtusbzIKaOqRidkBXvnhvCeS8eXTJdy3fTw41Spc3JomNzzM
 3r74WxEsV9qsOftC0ZoOS/IRgbGThRa0E1mCs+xF56zJwQUUGvFj8YuYiMUQOXXKFcKo
 yb7hHmU4BLswRXlT3sJU9fPAse/0++WvNrlqAWeFt/kM1Dp4HP9y7BZZJur0lPDZBfev
 CyfzwUZE65iuzX2C5tL8GUQ12TZ5Vf6jeW04xH2JGV0xvgyCLA35wgsCuAAj3pJ/JDdV
 0XqIxcVFnWWO/ncP9i+k+mY64Ecyohvykg5nAID84u10jHz+Aw4qfXpTvh0UDlw51MLy
 DfZA==
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
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpUaGUgbW9yZSA2IHNkbWEgaW5zdGFuY2VzIHdv
cmsgZmluZSBub3cgd2l0aCBERiBmaXggaW4gdmJpb3M6CiAgKiBtbURGX1BJRV9BT05fTWlzY0Ns
aWVudHNFbmFibGUoMHgxYzcyOCk9MHgzZmUoREZfQUxMX0lOU1RBTkNFKQogICAgICAgWzk6NF1N
bWh1YnNFbmFibGU9M2YgKGNoYW5nZSBmcm9tIDApCgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUu
bWFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMKaW5kZXggYzY4YmJjZjUyNjAyLi4xNjZiMTk5OWRjYmYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0xNTk5LDcgKzE1OTksNyBAQCBz
dGF0aWMgaW50IHNkbWFfdjRfMF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAlpZiAoYWRldi0+
YXNpY190eXBlID09IENISVBfUkFWRU4pCiAJCWFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyA9IDE7
CiAJZWxzZSBpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMpCi0JCWFkZXYtPnNk
bWEubnVtX2luc3RhbmNlcyA9IDI7CisJCWFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyA9IDg7CiAJ
ZWxzZQogCQlhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMgPSAyOwogCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
