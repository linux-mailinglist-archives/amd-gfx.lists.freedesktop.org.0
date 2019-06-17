Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45448DCC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F21892D6;
	Mon, 17 Jun 2019 19:17:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24CA892D5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12163757qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCHJZBsGyDYuBXXWbOlV3MuoEnYPMDKDn5gJzPBqt38=;
 b=F0vy6/saKDn/LoY9rheFTu1fbBFm8cw3kzhwkKqAd6uHBuRIQgC47vExK/y7mHWJ49
 5bNVdHGVlwB1w+QECD2jbMQpuYlcOQbD3EhcUdJsqOb+SXYkN5JBBn0GO0cajpPD7THT
 TxAcMTrbnqFEkx3OmwhHQakNMSosxgKAF2cNT8YVS9cur+PhUkFN5EBBpk+Ya+E/vt/3
 xU8g+ilBrF6Gpndh4TztWTB7FuSyrZA2jAROC/g8Xo3uPjiUzzZ/XtYPO+eBRY4c1/mG
 SGSzjCvnRYzwLCTJP+aTPH34GEuszxxAXx1fGDZKTOUJ1wcYVqzutmMb2urBW/vr9/OO
 4E/w==
X-Gm-Message-State: APjAAAWHLWUQCRCCMzOeWYXpCLbrUmbyD/arQIhfo9f1yAIiYE374XW6
 5vIip1eTsss3i8phErvDtsoPiMxlpZQ=
X-Google-Smtp-Source: APXvYqxd8PY4Pv9CGaj0UNU1EW7ijwjE0r1uNSRefbTMJvjg52tXs1yFO5hU4t5IczHnxUUghjtfBA==
X-Received: by 2002:ac8:8dd:: with SMTP id y29mr30167193qth.304.1560799042764; 
 Mon, 17 Jun 2019 12:17:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 021/459] drm/amdgpu: add gfx10 specific new member
 pa_sc_tile_steering_override
Date: Mon, 17 Jun 2019 14:09:42 -0500
Message-Id: <20190617191700.17899-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCHJZBsGyDYuBXXWbOlV3MuoEnYPMDKDn5gJzPBqt38=;
 b=e6HKPmosWcL2LiNrXcpxjaYgmwrs27rQUAJ5SbdpvJaDFP/KFe5XfpcRsdJRAK56nu
 SO7NB9R6Y2pvfZW+7GCrE/+7cp/YqkrhfWrjG5bYQ/ibaoeZZp2+OVBN/Rd9w/1JCqs6
 KI8KMPXzUFDxBuKhb2kEE5LeES0Cy0F8wstrlctD4FDSSVOSHFwIkGjHdIFQIL6UIrM8
 7Jg741xLb32zt594Orzsyty5imrfTi4VLutY+XgAz1bAKBSV1+cqwiwV3oZ5slZR2Bn4
 f0VN+LTguape8hvVcG1x/pP/svuDWa8/WlVC1/aUT5NXcq+lUHtQZTUcfgooM9N/RIv0
 AETA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggOWY1NWQ0
MjhhZGIwLi5hZjBiYjJiMDJhYmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2Z4LmgKQEAgLTEzNCw2ICsxMzQsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2dmeF9jb25maWcgewogCS8q
IGdmeDEwIHNwZWNpZmljIGNvbmZpZyAqLwogCXVpbnQzMl90IG51bV9zY19wZXJfc2g7CiAJdWlu
dDMyX3QgbnVtX3BhY2tlcl9wZXJfc2M7CisJdWludDMyX3QgcGFfc2NfdGlsZV9zdGVlcmluZ19v
dmVycmlkZTsKIH07CiAKIHN0cnVjdCBhbWRncHVfY3VfaW5mbyB7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
