Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0BA060C
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 17:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71832891D1;
	Wed, 28 Aug 2019 15:19:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C414891B3
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 15:19:54 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id b11so3400833qtp.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 08:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4aZCgxbEq1hbpMn6XNZ5vJBcpkyswZGL4ShPU742yE=;
 b=BfXStiG7AO5eEGnu9jSXp2mXyI9tUy4BOaJSo4J0mt7ri16QIDDxPD2lprYa5Za43w
 nQbLk9GDY9ISFT1jEZAYazKbLONHXhhoWc5mAURBW2aMba7ZQAeo551S9Dz1j2GooSTH
 /jbLaaFQLBZ+t6fw754/WmoVjTeNCDPxDyjGS8L293gpf2G1JCsFGzhgmMl+mnaP0Jj4
 WVT9o1I4EhOfvDB5NVMNGNWgCXT5Elo9OIUQaZNAI7vz6W8Qd82aSjXGCf6p21BBVjQp
 +AMp/xJ1QLaFS05WBFc3u+sBMp3FntWGsHTq0vaMkLpio9k2f3HVEw4x6Y2fuPFmr3h6
 5rjg==
X-Gm-Message-State: APjAAAVW4sp7G64g7XB6kyNLe9WM7BiTV7VSK74UPZwcnu7vlZT0KTf7
 Mo+1Uiu7x0dKGioG0MrjEfaswBMU
X-Google-Smtp-Source: APXvYqypws9h3ODIHM3tDXFhMILA8SDfaKZPcUPpaq4d5r4Qids36QEcYUSm0EolssLnsmMdOWMoyA==
X-Received: by 2002:ac8:138d:: with SMTP id h13mr4840058qtj.276.1567005593274; 
 Wed, 28 Aug 2019 08:19:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n20sm1259429qtp.69.2019.08.28.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 08:19:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amd/powerplay: regards the APU always enable the dpm
 feature mask
Date: Wed, 28 Aug 2019 10:19:41 -0500
Message-Id: <20190828151943.3619-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828151943.3619-1-alexander.deucher@amd.com>
References: <20190828151943.3619-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4aZCgxbEq1hbpMn6XNZ5vJBcpkyswZGL4ShPU742yE=;
 b=V3jhOJO8OaB8EanueqYKEQaLiNuHqUWtdXJnJKVUW3dFAGRa66CUsoJeEmpOZj0PLn
 6VuA+DZV3fSXtBb+S6fInARerCWLI966XDmsEJJWvCg4QBq+J2wcoD+dHgvkfViK1hsg
 EjPLvrHKL9dZKR4X23Dngap0SEy8LPiQNl0uZ5LeGNZY4WzvdZMVx6A3aFs+ukJbxsR9
 dtxWYD6Ry/2cKiQeqw29qP8tUAjUfIVsjYezTvxIt1fLEeODbikHoTf/a2xcXGY941Mq
 E2ZvdPunz6LXE31w6mGFSGLzNUDuWsid7ETLbz1tXQTY9uBF2AOIhFk7OKAvODwqnjOX
 we8g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpUaGVyZSBpcyBubyBkcml2
ZXIgbWVzc2FnZSB0byBlbmFibGUvZGlzYWJsZSBmZWF0dXJlIG1hc2sgZm9yIEFQVS4KRm9yIHRo
ZSBzYWtlIG9mIEFQVSByZXVzaW5nIHN3U01VIGludGVyZmFjZSBhbmQgYXNzdW1lIEFQVSBzdXBw
b3J0cyBhbGwKdGhlIGZlYXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2Uu
TGlhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDZmNDM1ZDYwZmU4Ni4uYjRmODljM2MyYjQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC02MzYsNyArNjM2
LDcgQEAgaW50IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gc211X2ZlYXR1cmVfbWFzayBtYXNrKQogCWludCByZXQgPSAwOwogCiAJaWYgKGFkZXYt
PmZsYWdzICYgQU1EX0lTX0FQVSkKLQkJcmV0dXJuIDA7CisJCXJldHVybiAxOwogCiAJZmVhdHVy
ZV9pZCA9IHNtdV9mZWF0dXJlX2dldF9pbmRleChzbXUsIG1hc2spOwogCWlmIChmZWF0dXJlX2lk
IDwgMCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
