Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35CB83A1
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882E6FBDA;
	Thu, 19 Sep 2019 21:45:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFF46F55A
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:45:37 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j31so6225130qta.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVrR6q30Xl8kyCr+Zw9kYiLgwcRMnGLXbUkBjJ4q/RA=;
 b=Ps2Vex8lAA5clyKkuqxQJbZW2oLnlM7Bjubfyeq0pOraVfLo+0Bp30NC6iQ7Ba0z2G
 RzJfPFby/OGGk/dsau9HkoB0GInezQLz/3pGsnCghGfCrxgGwvVPjQY3RkZEExjWsmhX
 qoVrCfaXrII0PQt08/UxTt8OSSpcPHEJsfK2HCoNn3KaCsX/V1EPbuZ0JLJnS8LedNXD
 ZUiOdd8HLDRgwQG+NtUa7NLUSBsZ5rwOnGubw5DXWQwGE8xkrw/qT3VDaUhjJUMn4/aS
 JJMkWwh4j70sLICXSGYsNtj8hQUVLE+wEOdnBpXpKILpZVV+C4g8/O0n6WTGqHQZB1Py
 3O9Q==
X-Gm-Message-State: APjAAAXiBpSZfcRh/zG1prMa7Ata6XF/OpHy4wNXcHRwIx4zNwwr5/UR
 FVcIrPAGTyuOEQ8L0G7bLVfLZJ6f
X-Google-Smtp-Source: APXvYqy2GcBqZFmxiDpeUJsqwGMPk3IQpWdqmqGSFBRvGSk5OczZBR0ih61kozogthiJyE/IwxgsHA==
X-Received: by 2002:ac8:1616:: with SMTP id p22mr5666902qtj.356.1568929536078; 
 Thu, 19 Sep 2019 14:45:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id q44sm6231255qtk.16.2019.09.19.14.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:45:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu/mn: fix documentation for amdgpu_mn_read_lock
Date: Thu, 19 Sep 2019 16:45:23 -0500
Message-Id: <20190919214527.10803-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919214527.10803-1-alexander.deucher@amd.com>
References: <20190919214527.10803-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVrR6q30Xl8kyCr+Zw9kYiLgwcRMnGLXbUkBjJ4q/RA=;
 b=I+CY/PqGxeM3bgV0JCvtkivLPBSwQRSILrQRrZb9pbyXTVP3IDIQz4oVK3PAKXQafL
 5JGLx6sBxafTA1lZZp8w3x4h+sKrDZ4+974ZCOtBkYDS5TTVB+olm9r1QxOy+4Sm5dX/
 OKywco6Dd0sEEAI20AFh1fIZhjdDptew2YiG9m+D1gBMqAqoGeLfxyZcr7QudVhjaqb0
 u8B9cn6nGzImxLN8zOhO7kyC/WvoxSt3nT3macj85vgNR2ynjdZjc2yy/HqEjb2wcZ+r
 9arw6IHnI2LT3tDYK1mwuX4u8KTlK8XE4+m2+jzq7pfe4CVD/zHEVdd8U+akFKig+AuK
 8ZEg==
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

RG9jdW1lbnQgdGhlIG5ldyBwYXJhbWV0ZXIuCgpGaXhlczogOTMwNjVhYzc1M2U0ICgibW0sIG9v
bTogZGlzdGluZ3Vpc2ggYmxvY2thYmxlIG1vZGUgZm9yIG1tdSBub3RpZmllcnMiKQpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKaW5k
ZXggZjFmOGNkZDY5NWQzLi5hZTIzMzEyODBlNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9tbi5jCkBAIC0xMzYsNiArMTM2LDcgQEAgdm9pZCBhbWRncHVfbW5fdW5sb2NrKHN0
cnVjdCBhbWRncHVfbW4gKm1uKQogICogYW1kZ3B1X21uX3JlYWRfbG9jayAtIHRha2UgdGhlIHJl
YWQgc2lkZSBsb2NrIGZvciB0aGlzIG5vdGlmaWVyCiAgKgogICogQGFtbjogb3VyIG5vdGlmaWVy
CisgKiBAYmxvY2thYmxlOiBpcyB0aGUgbm90aWZpZXIgYmxvY2thYmxlCiAgKi8KIHN0YXRpYyBp
bnQgYW1kZ3B1X21uX3JlYWRfbG9jayhzdHJ1Y3QgYW1kZ3B1X21uICphbW4sIGJvb2wgYmxvY2th
YmxlKQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
