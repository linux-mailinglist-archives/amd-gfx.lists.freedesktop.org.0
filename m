Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4F48E1B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119298967A;
	Mon, 17 Jun 2019 19:18:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8267C8955D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:22 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id a15so12168217qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kbu7GT9HgqnYDB6V5/G4nlDkxTVnP14hOK4A7pLsV9c=;
 b=DFgp6x6Ua7F7ajo8gKp/vnaRofTgps3DgMUQHjLCC95GRVq9rmWSamZ1PhjQXKbgZ6
 sitkHUCVks4qYSYH91vnBMS3t0wJw2uS64PP8T4T/uE42A10X3G6T2c7JZlqjOBfyCHg
 9+hKNj/hQhfEkW5jxrSXM6tT9RUOO9k8DuiY/7mk2TMXBGqEq7mVUhiEHnJhBMxieie/
 iTzoi2fKeHWmm6FkDjbTd7LnRdQavTV8ysqFpP+BQP9ntUTyVprPnKEc22w5BS0BWv0o
 GDkv8cxIRQju+xsKYkBt0u498MiQP2PFhBGEiM8RexTr0i03s6HLXfNtTz4etj2lrP01
 GNxA==
X-Gm-Message-State: APjAAAXi6bujxaJaPQ/aEMz3c6dPxxKy0bD2hHVr76wKvKIwqoix+VOn
 qLqAFxP4mnhUuoPuXEZKbZ7FTSoNF6Q=
X-Google-Smtp-Source: APXvYqxP25t7hNSZqYVeNldh72r85mk72WNU/eYvwJfVopJ+WyNhlV7dPWo2kOF99AgV//9QuurO2Q==
X-Received: by 2002:a0c:b4ae:: with SMTP id c46mr23429885qve.230.1560799101361; 
 Mon, 17 Jun 2019 12:18:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 082/459] drm/amdgpu: enable psp front door loading by default
 on navi10
Date: Mon, 17 Jun 2019 14:10:43 -0500
Message-Id: <20190617191700.17899-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kbu7GT9HgqnYDB6V5/G4nlDkxTVnP14hOK4A7pLsV9c=;
 b=Vh/Y60aw4zp4PJXCOxcMQBAieZ9WTuPIgJ1EjWSUOBGlC0YOlJuW+dhM9gRpPwYByz
 ibhQZNWFFpqrMtePiKVUOK6wIuF/UxnX1Nm+4JjfG+hJ5AuWu1JMyTceDI/3lGc6m3xY
 rg93E/tRixrbWtHQZ60bblku2RaYuCwxleg2GAPi6wEdEgKsFlMBiGygEZ3sEQ6iuKWr
 tNWYe5uAfXx4Yay6XR+ZdzG3FtBbfFptEXnhat2eLxTmiZhibxHu+sgX6qeUN5xFSamD
 0iaOpba3UfCgSnLY1/aydk1rk4aGiBy0tcEuqcjSREvBEdETZHB3cbp414lwUzH/REfX
 ashQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dWNvZGUuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vj
b2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwppbmRleCBl
ZTU0ZDllMGNlMWYuLjA5ZjM4NGNlOGNkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Vjb2RlLmMKQEAgLTMzNiwxMiArMzM2LDExIEBAIGFtZGdwdV91Y29kZV9nZXRfbG9h
ZF90eXBlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQogCWNhc2Ug
Q0hJUF9SQVZFTjoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CisJY2Fz
ZSBDSElQX05BVkkxMDoKIAkJaWYgKCFsb2FkX3R5cGUpCiAJCQlyZXR1cm4gQU1ER1BVX0ZXX0xP
QURfRElSRUNUOwogCQllbHNlCiAJCQlyZXR1cm4gQU1ER1BVX0ZXX0xPQURfUFNQOwotCWNhc2Ug
Q0hJUF9OQVZJMTA6Ci0JCXJldHVybiBBTURHUFVfRldfTE9BRF9ESVJFQ1Q7CiAJZGVmYXVsdDoK
IAkJRFJNX0VSUk9SKCJVbmtub3duIGZpcm13YXJlIGxvYWQgdHlwZVxuIik7CiAJfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
