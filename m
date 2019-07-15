Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E769E3E
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A800589FD7;
	Mon, 15 Jul 2019 21:25:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151989FD3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:56 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id a15so17249971qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W9M+Vc7/cQjtrX2zfu8BIsuujlbhrGR4NAwlKKysOo=;
 b=bPjl88HM5eFfFsLygfVZ8oQOff9AeISv8ClW4uXCFFWZUVB+/12/L3AWuOsJ9FtuX1
 vfEW53I2aERO5V1kTARxtWf6Z1afmDR+z8VDeBPye5p9mSgllvoE/7H6HS522uKjuHdt
 oSHSKQufgouyvM0hbubXOv6w5o8RTz8fw0nIJiz0Go7eqMrmIM29tkys54NoJin1XUby
 0VZg+OZw7DUfKJJY0UHQwNRpHayMUvba1+a8os3lS6c2BlCIr4VJOWdwCjyNTJ2h7mzH
 vGfGXn9SBeDl047n8n6C1EOBe3sPM8K8+b25rMJmmRy3q7YEX6I0Te5zOu8cRzIXK7zn
 pw0Q==
X-Gm-Message-State: APjAAAW3x3hyTXAa4Dr1Gg41X8b+c2FS3bq8fFeFacZBdu+p9/XY6UZA
 lbJ0TE1/z0Nrzqf7zHjw63MhF6nb
X-Google-Smtp-Source: APXvYqxBSXDJr1FYh4D3Xn3bFTlVktr8KBWm3al/b7Wdz2/ystlJFvYr8QKNsN3hockjzUDjWFfHuQ==
X-Received: by 2002:ac8:27d4:: with SMTP id x20mr19274006qtx.138.1563225955901; 
 Mon, 15 Jul 2019 14:25:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 078/102] drm/amdgpu/: increase AMDGPU_MAX_RINGS to add 2nd vcn
 instance
Date: Mon, 15 Jul 2019 16:24:13 -0500
Message-Id: <20190715212437.31793-76-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W9M+Vc7/cQjtrX2zfu8BIsuujlbhrGR4NAwlKKysOo=;
 b=K94dbTOhSOxF958ZS6DucgE4oh9QvJi0nWekTSbap9Q+/9CjDgrJ+4aUin0nSR+JOm
 w9ayqQ97bOfevMZjPFMEB1Up2mloJhW6Y/4pMY29bKZGG1HU8HBUD6kwwwGVR7gVVxDE
 xVn38VDm16DcYivAtOs2yh1i+jX16/vl33se5ceq+7+IbVN2JtYfizR/3uHmvdIrdfYR
 Oj/BWWwRhuVwPHDx5kBFlfwom5lc3KINPHuDsRam2FESsmEDMHwKEcEY/w1Mgg+UHWa7
 jf3P+5ZNtdFaMMuVYi4EVRsyv90dGOWWDVydg5BMIzT1/7qJfe+PImGLEylfIu3cOa/k
 o5tA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCmluY3JlYXNlIEFNREdQVV9NQVhf
UklOR1MgdG8gYWRkIDJuZCB2Y24gaW5zdGFuY2UKClNpZ25lZC1vZmYtYnk6IEphbWVzIFpodSA8
SmFtZXMuWmh1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgKaW5kZXggNDQxMGM5N2FjOWI3Li45MzAzMTZlNjAx
NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaApAQCAtMjksNyAr
MjksNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIAogLyogbWF4IG51bWJlciBvZiBy
aW5ncyAqLwotI2RlZmluZSBBTURHUFVfTUFYX1JJTkdTCQkyNAorI2RlZmluZSBBTURHUFVfTUFY
X1JJTkdTCQkyOAogI2RlZmluZSBBTURHUFVfTUFYX0dGWF9SSU5HUwkJMgogI2RlZmluZSBBTURH
UFVfTUFYX0NPTVBVVEVfUklOR1MJOAogI2RlZmluZSBBTURHUFVfTUFYX1ZDRV9SSU5HUwkJMwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
