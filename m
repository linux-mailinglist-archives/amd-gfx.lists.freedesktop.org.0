Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B935D77E
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4EB6E07D;
	Tue,  2 Jul 2019 20:29:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE86E07B
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so20144883qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBw0+oFIBIW2rTfOIvMtrjqhZsCwH8NwGrlSlnGIY2E=;
 b=n/zMg7xrtZU0A6KaKQPIskzTaH0PXOKdbIVngMfXVkugkZbYMCsRJ4dva0qbjnH+KI
 H3e5qs7S9+ZRoaZMAAqzka+wSVUmfFAj665Q0P2yXrsUkJP22m/cHMOMErwWxI9dKIRq
 jnOMnPjPkiXtAj9WGcKM4uINfLv8L/s4cplfFbL5vebT3Nt6gFoQM4pRgfLnBdihL871
 wDJVYvjm0BsXO0sNFiXOjNiJqMAxh1ep/eJVuSyUhTd/8iuBVSVtHoxyyXjUrZ7kbl7u
 Aza0sDo1By4WMtjX3MGx/CoYBT/8bdTO+0+3EDc25umqIfcbQT+jStBHfxITf3TVdj6v
 d2Eg==
X-Gm-Message-State: APjAAAWUaUhf8nPL21NlSXu8EsF/jf0qhhaYKfeKRvBB1TV19OdCMrgC
 UHy4pT+BAp5Z18IIb0amaGVWdUEfnmA=
X-Google-Smtp-Source: APXvYqySAzlA22gXGXvemkJiqzsxN6hMkRdayS9e/bgZDPWcOhdIZhRb6nhx+sjQI1R2A5hU63whXw==
X-Received: by 2002:a0c:bd91:: with SMTP id n17mr27888017qvg.128.1562099374752; 
 Tue, 02 Jul 2019 13:29:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 44/53] drm/amdgpu/athub2: set clock gating for navi14
Date: Tue,  2 Jul 2019 15:28:35 -0500
Message-Id: <20190702202844.17001-45-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBw0+oFIBIW2rTfOIvMtrjqhZsCwH8NwGrlSlnGIY2E=;
 b=C6AGktHKbiAH8J2MBlW/c76YytvIX30eN4Rs8N4sWt+xIeLsjWWp5hwfuu55ZcrmB5
 xGezkBuR+Mu445JJABD4VezoPewcBOxXiWH0WyO+yM43ch1aYYW6thqnqpp+qmWZutrS
 Vx2ehWE6t4w4c2KZDZrOTcvoUARRRnmcYnh4+Pk6Z8vARqKME2BIKvUbhDeS/UQG/QT6
 XxQoY9kJ1Km373hM99kEcZNf+60rK85mo1nOPRt25mXZBbpUvDilpvAAHQFU+SKeV9PG
 Up3lqr68twgnOH4l4OGsezby+MHNSwda7vbRuXgQWIXZ+Ee7dvsaKQVMfuvP9cXtGgz9
 detQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0aHViX3YyXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYXRodWJfdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjJfMC5j
CmluZGV4IGQzZDdjMjE3NjkzMy4uOGI5OWQzNGY4NzZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYXRodWJfdjJfMC5jCkBAIC03NCw2ICs3NCw3IEBAIGludCBhdGh1Yl92Ml8wX3NldF9j
bG9ja2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCXN3aXRjaCAoYWRldi0+
YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTE0OgogCQlh
dGh1Yl92Ml8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCiAJCQkJc3Rh
dGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwogCQlhdGh1Yl92Ml8wX3Vw
ZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
