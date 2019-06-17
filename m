Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC148F70
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6C089C82;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844689C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:09 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so12267617qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiSMGrU+13Jg14lbzPA0Gsp6HOVrgqUaI9jkZs18KgU=;
 b=YQTuF03J4NAfGOl6v/E8flxhGv3F/nOz0nuYmq2sTNEVwdsxdx6djF+Q6M6ZObm7Uk
 9Al43xPXAL3826n1ntBiFNJnHTanhOwkXoqkWm2xINBG79MAlMdFAxbTsTlGznfT9Hl5
 sZfFudL1MRKqTY1dUQkSyWJlK/tgeuxUyft3xO2pIEJV9E91uIjt6q4mUNgZxboAb8Dv
 VT2nwJPK3OOn6ngHoV9UAUEqjDpa6ql/9Pi5koHE7MoiAslpOGZnuvbIGWEzPadY9Y1J
 qJgAf4Pt0qtUwPZBYIk6HN6U1sFu8noT1BODGnig2ZoqNDMHfbJKPpucvaeHVLqWa2ke
 qIEQ==
X-Gm-Message-State: APjAAAVCzt0lOMDYvXipsiLQXow0OBn6jIakmCkoiTr0kekLb3pJYUjm
 s/cw98FICz8/e4WbV9O/uLdUWMxVBC4=
X-Google-Smtp-Source: APXvYqwzkIggSkdzNCgtq8+eB8QPGFQ6hcWba5uHR3NgxhhhcWDppLsro9xFNNZiwfEeOdL7Pp2jIA==
X-Received: by 2002:a0c:b07b:: with SMTP id l56mr23044607qvc.114.1560799927967; 
 Mon, 17 Jun 2019 12:32:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 260/459] drm/amd/powerplay/smu11: add secure board check
 function (v2)
Date: Mon, 17 Jun 2019 14:30:27 -0500
Message-Id: <20190617193106.18231-61-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiSMGrU+13Jg14lbzPA0Gsp6HOVrgqUaI9jkZs18KgU=;
 b=DeWphHnp8Y0/tmVOVtGnIr0OOXuLuoITGkHzqsnZKCtkKrMYb9bUITrrdvOUEThVKU
 SR5XCMS8K7MI23aHBw6XCHLuKSuHeHlq6KAA/lSMajsvsz8kEPwphilIrYIy/cVpOKJz
 F9wPvDSV7/x9HQzEKBGVsIJS6MLymVkPmLkmvJAYPHdYIOBoI1y1TWgpTeiBb7BIGfGf
 PCt290mHeJJaczCj2g8LXEwfB8GYD9IuibmTQ5dQnMhj/+R0VHkMw68xy2hjCWfDhnX2
 b94KQkijN9fAISzlPE+fE969qtMMsnJkJJv5WUm1bBE5lD9Xsv3hWjGAOeq4QShQU+vf
 hTGw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKVG8gZGV0ZXJtaW5lIHdoZXRoZXIg
dGhlIGJvYXJkIGlzIHNlY3VyZSBvciBub3QuCgp2MjogcmViYXNlIChBbGV4KQoKU2lnbmVkLW9m
Zi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyB8IDE3ICsrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRl
eCBmMWY5MjAyMzRkYmQuLjI1MzgzMGYzYzMwNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMzUsNiArMzUsOCBAQAogI2luY2x1ZGUgInNtdV92MTFf
MF9wcHRhYmxlLmgiCiAjaW5jbHVkZSAic211X3YxMV8wX3Bwc21jLmgiCiAKKyNpbmNsdWRlICJh
c2ljX3JlZy9tcC9tcF8xMV8wX3NoX21hc2suaCIKKwogI2RlZmluZSBGRUFUVVJFX01BU0soZmVh
dHVyZSkgKDFVTCA8PCBmZWF0dXJlKQogI2RlZmluZSBTTUNfRFBNX0ZFQVRVUkUgKCBcCiAJRkVB
VFVSRV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklUKSB8IFwKQEAgLTI4MSw2ICsyODMs
MjEgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X3dvcmtsb2FkX3R5cGUoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsIGVudW0gUFBfU01DX1BPV0VSX1AKIAlyZXR1cm4gdmFsOwogfQogCitzdGF0aWMg
Ym9vbCBpc19hc2ljX3NlY3VyZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKK3sKKwlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKKwlib29sIGlzX3NlY3VyZSA9IHRydWU7
CisJdWludDMyX3QgbXAwX2Z3X2ludGY7CisKKwltcDBfZndfaW50ZiA9IFJSRUczMl9QQ0lFKE1Q
MF9QdWJsaWMgfAorCQkJCSAgIChzbW5NUDBfRldfSU5URiAmIDB4ZmZmZmZmZmYpKTsKKworCWlm
ICghKG1wMF9md19pbnRmICYgKDEgPDwgMTkpKSkKKwkJaXNfc2VjdXJlID0gZmFsc2U7CisKKwly
ZXR1cm4gaXNfc2VjdXJlOworfQorCiBzdGF0aWMgaW50CiBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVh
dHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgdWludDMyX3QgKmZlYXR1
cmVfbWFzaywgdWludDMyX3QgbnVtKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
