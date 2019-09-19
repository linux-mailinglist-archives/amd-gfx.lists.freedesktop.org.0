Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E1B83A0
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA36F55F;
	Thu, 19 Sep 2019 21:45:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6C16F55A
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:45:36 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n7so6217446qtb.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvRQZKbfsXoeVtMLkXaVqYRlo3Tbrmolw19DnpEyRZM=;
 b=YDOFX/Ts4zXmJxvcKRIhU3v84ttZ18KhKGU4JezQ6nNU2YjZ5Y7XUQUk88Dti+aKf8
 iL7mLo7DxbwZai/ZjHuv2iaGyGAc6Nc+32+7g5wsYiDO/u8c6SZmVdYyWZUVk6wO2Y+E
 YxaT7YNcWCWe7/Cz8kBV4THQnpfk/qJM1ZbV4zPrdc3XR3rpASUOree1d5QU0LMuhFiD
 tGEFD5SGRuEscUqgL/iFreIlsnOSkRIoqmtJMxLoR3vVTldy9Zf6/5QvSDgHraGOR8IM
 qaAcV7tb/IIbRcoeSXpQIa3wzklNaUgUX/G8YH4tgjnlfC0uniOxDOm1Lss6OYW8WV9w
 TfwQ==
X-Gm-Message-State: APjAAAUVPFCTfrPL+p5PTPhg19l7LO1N9ezCWAXQB7x2UMD970Trt3Gb
 bazwhV3jqf7hc8EbMZA9jZgc/L82
X-Google-Smtp-Source: APXvYqzGB3pp05nLs5jlQPuaR/YoemjMNgj9+D9FcPpcXrFVBbYas5bb2Rss/KGqwmxBZ1vR2kjb+Q==
X-Received: by 2002:a0c:ac01:: with SMTP id l1mr10269603qvb.0.1568929535089;
 Thu, 19 Sep 2019 14:45:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id q44sm6231255qtk.16.2019.09.19.14.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:45:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/amdgpu: fix documentation for amdgpu_gem_prime_export
Date: Thu, 19 Sep 2019 16:45:22 -0500
Message-Id: <20190919214527.10803-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvRQZKbfsXoeVtMLkXaVqYRlo3Tbrmolw19DnpEyRZM=;
 b=aQn89ZZmMu9GVSIdFaU+quae0nz6173QkPVJryznE/D9UBTt2maHNnTXiMJ4rJ1ERC
 i+HZ/LkVMDAHakNG4R4YFYpv2AEGZf2tbqijKh8KpyIsQq54DSbtchkksbQA3oMPYol7
 yqgqkgmtN6ZgnaXrwre2+jOdvCCDkc1vJSB1hQiR7efZs00W+2xRGQlCXufhFBd/i6rn
 oniLwhxgmPFiogVceCJv8rJj2Q3M9FB70RIsuB4uz8a49aKc/DsgwBourqco6FZIDVQ9
 v/GllGYalobCGqxuaad7pE1SQ3fxFguoNIAEJyUH92Aa1Lu1gkgy6nO2YFo6fzmiEKB+
 ZM4g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHJvcCBleHRyYSBmdW5jdGlvbiBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwppbmRleCA2
MWYxMDhlYzJiNWMuLjQ5MTdiNTQ4YjdmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG1hX2J1Zi5jCkBAIC0zMjEsNyArMzIxLDYgQEAgY29uc3Qgc3RydWN0IGRtYV9i
dWZfb3BzIGFtZGdwdV9kbWFidWZfb3BzID0gewogCiAvKioKICAqIGFtZGdwdV9nZW1fcHJpbWVf
ZXhwb3J0IC0gJmRybV9kcml2ZXIuZ2VtX3ByaW1lX2V4cG9ydCBpbXBsZW1lbnRhdGlvbgotICog
QGRldjogRFJNIGRldmljZQogICogQGdvYmo6IEdFTSBCTwogICogQGZsYWdzOiBGbGFncyBzdWNo
IGFzIERSTV9DTE9FWEVDIGFuZCBEUk1fUkRXUi4KICAqCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
