Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEB3CF69
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 16:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7510F891D2;
	Tue, 11 Jun 2019 14:51:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEF5891D2
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 14:51:11 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so7832181qkl.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 07:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VR+Xk0GQKm2bH8T1UEXMoRqX+sR2WL6u0tJO9bDwgXU=;
 b=jqaGHdGkDtYMt2vJrVlQiZXsQlkuI1RWMP5p9a1C/pQvO9VRUH5pSICILdYBiZOkny
 tTJfpWl9pGCU+mLxwXkawV5yW/6pZssYF1sQ5AMOmbvSRO04UMj+XgdytbYtgA21HEAr
 VM3O9ZyQigTLdpBWv1nHk8iZXnfYzkgPy+wBHOcSiM70ocKmhm8kc1vjhi4KtO1MD5QL
 BiwkEXRaZfnKLR0RG3T3UiIQ2qwx4XaS95fQY5m+3uSWY+jMSvXOYD0G0MjPZkfRImXV
 eX+AMOFYZU6fYk+0baVrvR1Mv456b/DdYn6dqaPi7uoGFXAhXjjSnddd0PbhW35jWpys
 gnGQ==
X-Gm-Message-State: APjAAAXZCWt/F0f5ORh3qdIwyUus7GZ3y7XAi7tLi57fvW0QFdmeP2cg
 4iKvof5DkSfbYsrCImYsYiMH4vlMtpY=
X-Google-Smtp-Source: APXvYqz5cjyiYQU+KqVwvtXLRXoCGmpQino25kGokRH2dmMYBfrURM7sA39DLXa1V5E9Os6f0UWD2w==
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr5808458qkl.121.1560264670078; 
 Tue, 11 Jun 2019 07:51:10 -0700 (PDT)
Received: from localhost.localdomain ([71.51.161.233])
 by smtp.gmail.com with ESMTPSA id c30sm7694908qta.25.2019.06.11.07.51.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:51:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: return 0 by default in amdgpu_pm_load_smu_firmware
Date: Tue, 11 Jun 2019 09:51:03 -0500
Message-Id: <20190611145103.621-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VR+Xk0GQKm2bH8T1UEXMoRqX+sR2WL6u0tJO9bDwgXU=;
 b=bjMBCADARnjLNUO2PzT1dNFK3JDe0fRnqaF1t9mmAmU67uKyJHUqFQ61cmgYb24d86
 DpUmG3Q9PhYy83ZJGftTJbwfXbCRvXtvaP4oAh/BaO5sX0f80bGiiNcf/oe5Da0tswH3
 PDPIgSzBCehGxJDqeliKBYSvx4a+t3PahoMvhbyRtrhlMQ+Ed3E0GhonGucDTgICnAzr
 tco3V/QrNEBbnuvhoNgv7ckwNQq8fiDAjfsLxC3NU+fw+YLPXfgZZSAkvkI4kJwL4dfJ
 WfgHVplWSsGt51GUoay35tBuqvVzbyW7EIvyGsAep4g7etqb27GIXguP+Zha376wqrg1
 mMUg==
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

Rml4ZXMgU0kgY2FyZHMgcnVubmluZyBvbiBhbWRncHUuCgpGaXhlczogMTkyOTA1OTg5MzAyMiAo
ImRybS9hbWQvYW1kZ3B1OiBhZGQgUkxDIGZpcm13YXJlIHRvIHN1cHBvcnQgcmF2ZW4xIHJlZnJl
c2giKQpCdWc6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEx
MDg4MwpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCBkODgyOGEzN2U0M2EuLjY1M2IyNDkx
ZmVjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKQEAgLTI3MDAsNyAr
MjcwMCw3IEBAIHZvaWQgYW1kZ3B1X3BtX3ByaW50X3Bvd2VyX3N0YXRlcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAogaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW9uKQogewotCWludCByID0g
LUVJTlZBTDsKKwlpbnQgcjsKIAogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCXJldHVy
biAwOwpAQCAtMjcxMyw3ICsyNzEzLDcgQEAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2Fy
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8KIAkJfQog
CQkqc211X3ZlcnNpb24gPSBhZGV2LT5wbS5md192ZXJzaW9uOwogCX0KLQlyZXR1cm4gcjsKKwly
ZXR1cm4gMDsKIH0KIAogaW50IGFtZGdwdV9wbV9zeXNmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
