Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E369E1B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960D89E7C;
	Mon, 15 Jul 2019 21:25:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13989E5B
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d15so12858535qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pfUuzwtzu+j4o8tO+cRoxSm6srAEhJN1aRqTY8xhKP4=;
 b=VPc70rlba+FWpH9Xj1AD7cPxlv7SreNxRRj04x8lYEeYkQkIMiMbXXBbyS9UhGL/Zb
 2Cv8SVUBmVT5/SRxlxyu/quOsQ5ABC0J5uUq/LWN3Bng38XejDBTUV1nYVRSqILTfjJM
 HeMEtzNHygPOfZfwQ7oKtrJOb8g3RrdiL4u8L63gekPGQh+5kksHmRiqKIo11Q2PNbkB
 cwhMxfo9jULGYFVsrTMEYGxjqE5JjAaa4S9FmKIpf/JcQhwyuTNwHnOTrbOyCTNqotMz
 iXZExalpS2el+nVo5UwE1ORX910KSaYWZpT9JqybQHVWPpTXXSQpxAQqVMD72jOPohnc
 YHpA==
X-Gm-Message-State: APjAAAWUh3fpRkePNwYIktJUbulFWXyXusoN62pA+jOQT3OEUCOKC/og
 43OTGFkvejeg+o+LIhnPZZzTAvkf
X-Google-Smtp-Source: APXvYqyjYG0nFqLgv2HbVUXZBWoT5r9SwvorhVp9DZP7BFExZrIhnPcgl+oiCzT9btQCWtM3tr+6sA==
X-Received: by 2002:a05:620a:11ba:: with SMTP id
 c26mr16720766qkk.201.1563225917559; 
 Mon, 15 Jul 2019 14:25:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 037/102] drm/amdgpu: enable 8 SDMA instances for Arcturus
Date: Mon, 15 Jul 2019 16:23:32 -0500
Message-Id: <20190715212437.31793-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pfUuzwtzu+j4o8tO+cRoxSm6srAEhJN1aRqTY8xhKP4=;
 b=JykY6vT8RU1YyeMEweDkb1uxUEAxiqyJux2PTkqm/RQhEl6iCDhVS6TMj4n12w2NK9
 JodMso0oWGLUmEgahmPtCOFjzaxDK/IFmIg/68jzl1ZRYswb2dcN/AKJyUuMaQdGhEEC
 kNTfwQkTbjInpcmjDobXOZUEfLLl8+hMQ1Lg9SuCrScNTYa+t2DY7TVxTYumdtYzlY0s
 WvJwf0ywhr1JvQM6dfoZryIOcWjpRk7ZNEnIZxWfcFlx+56MIOTenu8m803CUDOe5+23
 9sn1i1WcOIXlvXLU8ezdsbrBEmLelSjxOOdGspjlebvaGcY5s7YRZ97FXuWDGi2L3RUl
 He0A==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBbGwgdGhlIDggU0RNQSBpbnN0YW5jZXMgd29y
ayBmaW5lIG9uIHRoZSBsYXRlc3QgR29waGVyIGJ1aWxkIG1vZGVsLgoKU2lnbmVkLW9mZi1ieTog
TGUgTWEgPGxlLm1hQGFtZC5jb20+ClJldmlld2VkLWJ5OiBTbm93IFpoYW5nIDxTbm93LlpoYW5n
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjRfMC5jCmluZGV4IDk3NDIyOGI5MThkMi4uMGNhNDFhOGE3ZTViIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTUzOSw2ICsxNTM5LDggQEAgc3Rh
dGljIGludCBzZG1hX3Y0XzBfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAKIAlpZiAoYWRldi0+
YXNpY190eXBlID09IENISVBfUkFWRU4pCiAJCWFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyA9IDE7
CisJZWxzZSBpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMpCisJCWFkZXYtPnNk
bWEubnVtX2luc3RhbmNlcyA9IDg7CiAJZWxzZQogCQlhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMg
PSAyOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
