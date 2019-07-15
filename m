Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B869E11
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7394D89E43;
	Mon, 15 Jul 2019 21:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C0F89E11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:07 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d79so12832106qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OkfPg/8bVOaftV+ifirLzQkW7sRfw5vwbgnPFTVCx3M=;
 b=RVjNC6aGi5z/8vyO6wNd3hvhuIuxAb4vj+bctMZ9LS69wmDGC8Nyx7voAVXIJjWqKF
 LpXiqTszPnUZmKlCxzaZWjOH2o3G30Pe4s/lhSSHAMJo2SSNvZtQ09ouW4TqdBYIYqM8
 rN7iU4xqBsAHPEhJ45ZR19FaO4qdfrmoATONq9BM7L6aicanlGF1osNbCgkzk3sH00DM
 vU94KGIQ46KjN9XI5JgDQrPJGhM7bqjGHxNhGxfTu7PUC2eNOTvvd1T7BFckufFrGyhP
 AEr/pSVeRboreRvNlLPab1EYsAq88xjzIYtUbReaZBJTO4z5CrW5UK6t71TUr0fiqfyV
 QryQ==
X-Gm-Message-State: APjAAAXWM6s9ciUhh/GT/mgeHkYuRZlOTm7mnrVGsGSdqJAd5yrldTPH
 WYZOZB8oO4cBCejRhKbBoJliS+Pa
X-Google-Smtp-Source: APXvYqwIuwSszBedBtyudxZYfgfiPPS+5dP3oSBLktuHScTjGHBt2scq18WIuaxLiLte8zKiRShOfQ==
X-Received: by 2002:a37:4781:: with SMTP id
 u123mr16902320qka.263.1563225905997; 
 Mon, 15 Jul 2019 14:25:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 024/102] drm/amdgpu/dce_virtual: add Arcturus virtual display
 support
Date: Mon, 15 Jul 2019 16:23:19 -0500
Message-Id: <20190715212437.31793-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OkfPg/8bVOaftV+ifirLzQkW7sRfw5vwbgnPFTVCx3M=;
 b=OhTbCVa/Gz1P3yHxjOYbO2BJ4LXq250Uju3IEC9HT7P7uZSbpW0vp3eLa7tUH2cs+K
 h6qhYrUjwvQsI+ArrMvmKu2upl9egCztQCT+RerMzEPAm2pG0DTkXt9XosY8aXD6HI/t
 k4HT5D6qtgtEVVK5Wn9iZ63MO346lkARxmTsa6m4LXMmRHP5qMxnLUgztEVA1vKuh5tg
 Ghu5340wANbazSE/E3Mm/vfCU41rg6CyL8K/LhbCH+CzsyK1m3KkXT3/WTgbO9lJupRw
 Tkt0CO8dN4VPntgWCSuSzRkYFmpdIMQDLRxhc6XSKWQZcg6DNhzTmUlLcuEYBq2sTk+t
 4slQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpWaXJ0dWFsIGRjZSBpcyBhIHN3IG9ubHkgZGlz
cGxheSBkcml2ZXIgZm9yIGVtdWxhdGlvbiBhbmQKdmlydHVhbGl6YXRpb24gYW5kIGNhc2VzIHdo
ZXJlIHdlIHdhbnQgdG8gdXNlIGEgdmlydHVhbApkaXNwbGF5IHN1YnN5c3RlbS4KClNpZ25lZC1v
ZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGNlX3ZpcnR1YWwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKaW5kZXggNDE5NWIxMTcyYmRkLi45
YjQ1ZjZlMTJjN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92
aXJ0dWFsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwpA
QCAtNDU1LDYgKzQ1NSw3IEBAIHN0YXRpYyBpbnQgZGNlX3ZpcnR1YWxfaHdfaW5pdCh2b2lkICpo
YW5kbGUpCiAJY2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJ
UF9WRUdBMjA6CisJY2FzZSBDSElQX0FSQ1RVUlVTOgogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2Fz
ZSBDSElQX05BVkkxNDoKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
