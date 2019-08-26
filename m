Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BB9D60A
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 20:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966E96E29F;
	Mon, 26 Aug 2019 18:55:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F666E29F
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 18:55:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id q4so18975162qtp.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 11:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNMFcUqLvrrGj+LaDcdLeEzYYUbKrqDbQBmmAMO5nEs=;
 b=JQLQyXD3kmz0TgW4jq7OKYwNSBkyRJqE4Xfd3DRmix/wf+i0iJP6sMD1iDs0QDuOYL
 C+9bPKSyN0NeoOYBg9vVNiMXociPRpKqi+nYKIHnjjjebDpJjLSsU/hIIRJIkMTgzivj
 x1R2UmXBXVTkPJyQ7Nt+UbSf3cJXtTt/dBFzmknDCludQgAom/T9EI698sA/xN7Rr1hl
 0bJdkdZzHKCf4IDoU3UUMN47gKqPGfBfTQMcWKtIddDG7ouByJ9FCf8XlcMvX1VyH/xL
 cf1tTmsJ4Jd6wo8YBVtNI8VMt/J/YRe33Q4T/tLPS8yt7sdF75U2DjLlG2a9La9n8M/2
 71DQ==
X-Gm-Message-State: APjAAAVjEEXnA9UKVbfT+iQ4IsIfQhR2SRPX6PdSYKmdxrIz1Hkd9nmL
 wZESB9XERgauEGhi51mHcof9IkKC
X-Google-Smtp-Source: APXvYqyE23Oh1NqHZVXXFiMYhxGFptYUyu0G2nY99LrUg70N665qRoUWlR4uHskZVvo8iErGXQAU8w==
X-Received: by 2002:ac8:2512:: with SMTP id 18mr19292180qtm.382.1566845704911; 
 Mon, 26 Aug 2019 11:55:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id a3sm6373211qtp.10.2019.08.26.11.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 11:55:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix a warning in smu11 i2c code
Date: Mon, 26 Aug 2019 13:54:53 -0500
Message-Id: <20190826185453.1793-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNMFcUqLvrrGj+LaDcdLeEzYYUbKrqDbQBmmAMO5nEs=;
 b=E4eSCpy4UdJrCpkhtiTlxGYIZZXevZESKJUhoFgv+5VyamZqWwpCfGPQU8VT16FAOA
 8o+Klgl+qooBTzLlxJaAcPwsYFTulVCbpF/xDBUcy5PbguEp0FtBEZ5WKlxkLMemH93I
 GCTlxj4wFOQzf5cdI94Uw15mQ2A7CwrXgfYtjm9DxTS9If78zNS44fk3ukixoOkpbv/1
 NReVqPRmmi7Cvm6SBFHfIaNAXo12deUSVSqM+4LcILPtiGB+WGDLYXQz2pgXlyqrusqm
 KO9b+QAmRlzPpQJaqAE0Da/E8a3hezk7GSMr7vzExlm/kDyppnaAJkZ4ZWC6A56+P6CJ
 iqBg==
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

bWFrZSBzdXJlIHJlZyBpcyBpbml0aWFsaXplZCBpbiBzbXVfdjExXzBfaTJjX3NldF9jbG9ja19n
YXRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jCmluZGV4IDRjZmNlZjBmZWZm
OC4uN2QwZDRjNTdiMzE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
bXVfdjExXzBfaTJjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8w
X2kyYy5jCkBAIC01MCw3ICs1MCw3IEBACiBzdGF0aWMgdm9pZCBzbXVfdjExXzBfaTJjX3NldF9j
bG9ja19nYXRpbmcoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sLCBib29sIGVuKQogewogCXN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsKLQl1
aW50MzJfdCByZWc7CisJdWludDMyX3QgcmVnID0gUlJFRzMyX1NPQzE1KFNNVUlPLCAwLCBtbVNN
VUlPX1BXUk1HVCk7CiAKIAlyZWcgPSBSRUdfU0VUX0ZJRUxEKHJlZywgU01VSU9fUFdSTUdULCBp
MmNfY2xrX2dhdGVfZW4sIGVuID8gMSA6IDApOwogCVdSRUczMl9TT0MxNShTTVVJTywgMCwgbW1T
TVVJT19QV1JNR1QsIHJlZyk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
