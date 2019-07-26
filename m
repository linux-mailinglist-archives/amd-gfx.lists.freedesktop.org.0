Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D12771EF
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 21:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10DC6EE3B;
	Fri, 26 Jul 2019 19:16:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F8F6EE3B
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 19:16:25 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h18so53693834qtm.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 12:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxqSnjlzgJpZFBk/1bUn24nluanm+fCH6EADKKG6szw=;
 b=RWgObb+hM57ns+soVUuqc5wf7If+ziNGffxxSDQQthDPLk1eNPsWzagYvkZQW4IG+A
 28nI4GT5AsSRgjCrKdPzk6wh44f/XjR4Ldr5fPVwbysORVKVVyU+CJ32Ly0gycpURJIC
 OdxKqkTQwY0Hb2WiabIcKaUf29zZ/qs5HG5hGiJN3KuK3+mvKnHrYwQ0FYu/sMOzmEY+
 Wfd0btQLJel3iKyEMI/IYLsmGye2Y/X/UErkWffp6becyO4xX/PVlXr2XF5/guWMmsdc
 ZoFiHrMF6Ex7UcA/fZFHXvxN/LuEjsPt4IwaDbsQ79HHugL0UDwuGzuFMrHQQ63NzSQQ
 zZKg==
X-Gm-Message-State: APjAAAW4niNIHHBOr+PGuojR9eoX42FAb7xzy/4n0vHBd7AtwF6hovgl
 XdE197DD/ZmlkMm93qqf3OXHI7mk
X-Google-Smtp-Source: APXvYqwvOPcRHixZz/SSAVd2NNcxLJWdZRSfzUh4MVbA1BNWle50IpNu1ermAG41+FlxVV3RQGX1nA==
X-Received: by 2002:a0c:ba0b:: with SMTP id w11mr69436365qvf.71.1564168584604; 
 Fri, 26 Jul 2019 12:16:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r14sm25836243qke.47.2019.07.26.12.16.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 12:16:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
Date: Fri, 26 Jul 2019 14:16:15 -0500
Message-Id: <20190726191615.20351-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726191615.20351-1-alexander.deucher@amd.com>
References: <20190726191615.20351-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxqSnjlzgJpZFBk/1bUn24nluanm+fCH6EADKKG6szw=;
 b=lgkgijXvqdYMOITIUi0ZjFRZGpZHuQl987C4K7unAtZZkSPJSAVeXyWmkwMWekUEKw
 QpP4dWckCPSexM8Q7NQpOELs+aCsd2xgiL48mLmZBJDtUH9eQGKnPfvaIQAvK3v3v+PS
 r5/rgJMXoTc1FUV3wCAS3CWSd5taUXTTX8KoASWNWmJ/p9QlIvIl7AU8dRQieqT3YFCR
 6OLN2vD78Abfrs+Feg/oiPEXDfiKePgX38sFZIvh4rNBsjBrI3YMu2E9N56jeRZh/hRo
 jZ9rE7Q1i0a3GVCOkKJ5FWTOI0+2cb93N5EHGxH4TZql0RrgRnrfx9k7k0cdQ/WmbRJf
 cnRw==
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

U2FtZSBhcyBuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKaW5kZXggZjA1MmM3MGU0NjU5Li45N2Y3
YzUyMzVjYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMK
QEAgLTkxLDYgKzkxLDcgQEAgdm9pZCBhbWRncHVfYW1ka2ZkX2RldmljZV9wcm9iZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJa2ZkMmtnZCA9IGFtZGdwdV9hbWRrZmRfYXJjdHVydXNf
Z2V0X2Z1bmN0aW9ucygpOwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJ
UF9OQVZJMTQ6CiAJCWtmZDJrZ2QgPSBhbWRncHVfYW1ka2ZkX2dmeF8xMF8wX2dldF9mdW5jdGlv
bnMoKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
