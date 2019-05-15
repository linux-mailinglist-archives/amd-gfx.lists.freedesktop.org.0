Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656F1FB7C
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207FC891FD;
	Wed, 15 May 2019 20:29:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50FB891FD
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:29:46 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c14so887154qke.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 13:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pb8oH+S81rslfiNYFhZI8fPfr1jFr7512f5W27STmXU=;
 b=AoY+6W9gg4gmhN9s2a7hRNp1z92p/gQUWWQLo1K/RhASbVZnDPSTMJS9PKYpdQbcRJ
 hyErEQSOZ+vWh7IRFNmcowWnZS1VurYY9LuSHRMgyrivNDdF3Q6WZW4szcPwL89yLVwb
 Q39SdQIwx3m6jmhmZ7wcne45TNkqN+qRwL37EdD/iCM6XtcfDnQS7HzAW7w82MVQpdx3
 HBNWPIkLzwEc5nsV/lC9KoX3hVMJK/uu8ubw0FiFhdNYLJN3EZlE+VH0pJX2NzxCyQkr
 mvw29w/gMr62GZvMHszQU36la/7UYwt0hhgCRYckbqKMGUMAND8XlBgm7sjA7rrQ+KAi
 90cA==
X-Gm-Message-State: APjAAAXWAAe/2ZFqrSvfkbX6O8LxKerqADkcBtmjt/s+F21BrSCVNPTE
 +gLG3pCFNVtyywAxigvALuvj9CYD
X-Google-Smtp-Source: APXvYqzfIKgFpjJk6yfXszmjwZbAsLRmzVGLgvLOnBRGY0t5klX0d/Jmw+v3ksDdNM4GkOsv5BAKeA==
X-Received: by 2002:ae9:f112:: with SMTP id k18mr6624023qkg.235.1557952185604; 
 Wed, 15 May 2019 13:29:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id b11sm1565853qtt.6.2019.05.15.13.29.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 15 May 2019 13:29:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/vega20: use mode1 reset for RAS and XGMI
Date: Wed, 15 May 2019 15:29:30 -0500
Message-Id: <20190515202930.15701-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pb8oH+S81rslfiNYFhZI8fPfr1jFr7512f5W27STmXU=;
 b=QMVmWVV63CcIDexuIg0i1mUSyZnubM1FGuiv3P3E6BrdO7ZtDo08q0rEKa8CEa0TbH
 URvY54/CHcu46UdIA9ZcJwbOPYwA3jf6Umz4VoOb7phjJr693i5OAR3j/MtznfOsPLgU
 MgtUtFPg1oWYX8bT3eABP7a499RAwuUo/W7FWdoXILNZXu4ti7B7za/tzat/aqJHrCYC
 J14G4JUuMRlx/O9S9c1QEyJASyFT2nqxmv2rNK4XzvCBSfUfu/j9wu2qSsC/5qdImyAB
 89rXypVZ9WoKLmbbxh9f+3EPeviEXDXUz7rD5D5EVo5t1Jlawbyjr9YqZq0mdbBKLgYL
 4NSA==
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

SWYgUkFTIG9yIFhHTUkgYXJlIGVuYWJsZWQsIHlvdSBoYXZlIHRvIHVzZSBtb2RlMSByZXNldCBy
YXRoZXIKdGhhbiBCQUNPLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMg
fCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDE2Yzc0N2Y4MzhlZS4uY2Y2M2I0ZGFkYTRiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTY1LDYgKzY1LDggQEAKICNpbmNsdWRlICJk
Y2VfdmlydHVhbC5oIgogI2luY2x1ZGUgIm14Z3B1X2FpLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3Nt
dS5oIgorI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKKyNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgog
I2luY2x1ZGUgPHVhcGkvbGludXgva2ZkX2lvY3RsLmg+CiAKICNkZWZpbmUgbW1NUDBfTUlTQ19D
R1RUX0NUUkwwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDFiOQpAQCAtNDc2LDYgKzQ3OCwxMyBAQCBzdGF0aWMgaW50
IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQlzb2MxNV9h
c2ljX2dldF9iYWNvX2NhcGFiaWxpdHkoYWRldiwgJmJhY29fcmVzZXQpOwogCQllbHNlCiAJCQli
YWNvX3Jlc2V0ID0gZmFsc2U7CisJCWlmIChiYWNvX3Jlc2V0KSB7CisJCQlzdHJ1Y3QgYW1kZ3B1
X2hpdmVfaW5mbyAqaGl2ZSA9IGFtZGdwdV9nZXRfeGdtaV9oaXZlKGFkZXYsIDApOworCQkJc3Ry
dWN0IGFtZGdwdV9yYXMgKnJhcyA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CisKKwkJ
CWlmIChoaXZlIHx8IChyYXMgJiYgcmFzLT5zdXBwb3J0ZWQpKQorCQkJCWJhY29fcmVzZXQgPSBm
YWxzZTsKKwkJfQogCQlicmVhazsKIAlkZWZhdWx0OgogCQliYWNvX3Jlc2V0ID0gZmFsc2U7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
