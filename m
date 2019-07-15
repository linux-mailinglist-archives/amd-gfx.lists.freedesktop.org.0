Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20369E4E
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21186E032;
	Mon, 15 Jul 2019 21:26:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F56E02A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:06 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id 44so17217370qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzMy8QH5fVUVH5+9OZkfqmac6la8gXvTUvyRWRtmsqo=;
 b=LD01c5MbHqsPd3ZBtFSKQqPsxRlMK0OCP84OsGu90EoPImRkMEgY/NK/CZMLBCHx5S
 qFUc3ze1hxZmmZ59UHdAzRiFB4PJ1qEGp0QquCXvr83yeS5IM4KYSwwC4RoxIBdr0uuD
 sVYPqHRA0z0yqFwh+gCwYcKXGxFUfTF5QHW71yu0cRrhSMEUjq+sW/qjb5dzJyGzlYWz
 MX65aWF+fA1SFpsAAm4LjQ6hGeYcML39lrCcDBJLRTZ5UdHLTogPOz4JVC/R/0n8r9Me
 h5ArWWxX0H+r72BUqYHLp0YJyBa803VaMfEn20FtUQj5W9xR/oPCVmtiM9v1Q9MprMgv
 H92A==
X-Gm-Message-State: APjAAAW57jJvQkCwnYWTJYGarOwjw3X4AbJzupHin0m+CDY8GfW82293
 A9IZjObeXhgqszFtIP36fe7DIQy7
X-Google-Smtp-Source: APXvYqyuJ8NHtf0400asEh65hO5j75+MdHXbwBTsirVqMiH+GW/SI/WOtHddtn5F5BUasRgpDWl8Yw==
X-Received: by 2002:ac8:f99:: with SMTP id b25mr13869050qtk.142.1563225964763; 
 Mon, 15 Jul 2019 14:26:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 087/102] drm/amdgpu: init arct external rev id
Date: Mon, 15 Jul 2019 16:24:22 -0500
Message-Id: <20190715212437.31793-85-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzMy8QH5fVUVH5+9OZkfqmac6la8gXvTUvyRWRtmsqo=;
 b=rhhozQ+UYW0jBDlF7yR66iU4M466a+U3EayqeZv+ZHziccGEBtMUErwjgfMgvGVUY9
 0XcNtsG5VUeUv5Aetb3aTGcc3LWwVqjAm5PNruQWzUAYwfyxWjF/YlSFVjkgd0uYurVq
 fILZSJC8isE7BVr+kYy9DKT7vHW1JCDcrWFozh8L4v/eto2gCEpSOjyh+l3/Bik3Hvzg
 1pmLp+tzekQT2nHIXiwekgu0tDfuHekmypvQpfSJaJuKmyt5XmrfZwvbsRGxRqomsImb
 Bl4nlVGnylxnC2W980hslIS4ctpXyKptQCIhzqCeEooGAffWAV3T71PsH/6Xsxh9MsMF
 1EJw==
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
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYwppbmRleCBkYzA5NDY5Zjc3YzUuLmY2N2VjZjgxNGM4YyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMDE2LDYgKzEwMTYsNyBAQCBzdGF0aWMgaW50IHNvYzE1
X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJYWRldi0+YXNpY19mdW5jcyA9ICZ2
ZWdhMjBfYXNpY19mdW5jczsKIAkJYWRldi0+Y2dfZmxhZ3MgPSAwOwogCQlhZGV2LT5wZ19mbGFn
cyA9IDA7CisJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MzI7CiAJ
CWJyZWFrOwogCWRlZmF1bHQ6CiAJCS8qIEZJWE1FOiBub3Qgc3VwcG9ydGVkIHlldCAqLwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
