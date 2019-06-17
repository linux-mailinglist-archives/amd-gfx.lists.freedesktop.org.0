Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0348DFC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18A0894C1;
	Mon, 17 Jun 2019 19:18:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BED0894A7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:04 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12155917qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFfqc0+Qmwwm7N8ZI8ozdcouGf812U9LMnaN1Ys+QM8=;
 b=jA6hGdK+8p5dXRHG4/Z2zp0X91Su8A7oBO/Mc+alUOO5M/bjd27iLxz0a9O/E1Rtab
 0aRgzh3zU0qimSGxKSWCUbZi1Vm+llnOsGr7Qax3RsM0UtnFDkXMTt9TrlEj+bkMf3jC
 r/+fFrST9s7GL8t/1wv5Cmi+2WU6OX0GcRWqWpEYsCxK1FiEsj7AV7bovUMqFgd2zbBQ
 1Muvf4KwjCd5xKY4UW3xItklMtgu/02GezQGwflcJEMSNZ+adSg1rXPvugIHqmdHO+Ir
 TEKKDFOVo3Ize2haSPJdBF6TmJ4nJHP2t9pNL+wCdbKxQ9htv3UAem0oOsk8QYEzicLR
 VjfQ==
X-Gm-Message-State: APjAAAX0HqA0PoAlSHidLK3bhxK0G7kOXqYa8yrX6QK5WQN6RSsG6AWa
 lJNQtGTmZldni7GKPKpqmuXMhwCOAuE=
X-Google-Smtp-Source: APXvYqxgfiGqVvJ2oQWT55HV08dZ43F3KiVSK24OKNWcqipgVsWcJ01V527XoIdGhfXt0E0hGjAgCQ==
X-Received: by 2002:a0c:c16c:: with SMTP id i41mr22503564qvh.33.1560799083544; 
 Mon, 17 Jun 2019 12:18:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 062/459] drm/amdgpu: add structures for buffer
 allocate/release for rlc autoload
Date: Mon, 17 Jun 2019 14:10:23 -0500
Message-Id: <20190617191700.17899-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFfqc0+Qmwwm7N8ZI8ozdcouGf812U9LMnaN1Ys+QM8=;
 b=SjvrB8tqYOnr+uNAlnDFxPP3AiMnEZkPR2NKJuSzQGW7jv7PCdNxfakVcAxbkmaryz
 jnivPaMU4TT/3riJdZYUe/AAlihSWKgPt4/Odp7N2OgWeNfKun69xSO31I6+yMdXAmgG
 s3Yf2OwEyaeMUCgphDjZsUcG8oi4lnPYh+2ghh4uNZI30AQf8atadsIDIajPVZIbQJG/
 uPwz5gCfcOoBpCeR5vvurxf+ObJJx4mJwCsRdVhL/RwuDKoTuVeHqHLueOgXa0zzoJ+3
 9eCGyJ61c0RdXZ6SNu+vQpPxYHVshp+cpCDhPetj3riyNEM+yQAtudjJ5FvH81bJRgtZ
 08lQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Le.Ma" <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIkxlLk1hIiA8TGUuTWFAYW1kLmNvbT4KCkFsbG9jYXRlIGEgdmlzaWJsZSBmcmFtZWJ1
ZmZlciB0byBzdG9yZSBhbGwgZ2Z4aXAgdWNvZGVzIGFzIHRoZSBmb3JtYXQgb2YgVE9DLgoKU2ln
bmVkLW9mZi1ieTogTGUuTWEgPExlLk1hQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmxjLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JsYy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JsYy5oCmluZGV4IDQ5YThhYjUyMTEzYi4u
ZmY0M2ZhOWExNGE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmxjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JsYy5oCkBA
IC04NSw2ICs4NSwxMSBAQCBzdHJ1Y3QgYW1kZ3B1X3JsYyB7CiAJdTggKnNhdmVfcmVzdG9yZV9s
aXN0X3NybTsKIAogCWJvb2wgaXNfcmxjX3YyXzE7CisKKwkvKiBmb3IgcmxjIGF1dG9sb2FkICov
CisJc3RydWN0IGFtZGdwdV9ibwkqcmxjX2F1dG9sb2FkX2JvOworCXU2NAkJCXJsY19hdXRvbG9h
ZF9ncHVfYWRkcjsKKwl2b2lkCQkJKnJsY19hdXRvbG9hZF9wdHI7CiB9OwogCiB2b2lkIGFtZGdw
dV9nZnhfcmxjX2VudGVyX3NhZmVfbW9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
