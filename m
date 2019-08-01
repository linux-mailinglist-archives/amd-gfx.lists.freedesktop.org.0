Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A07D7E439
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE95B6E804;
	Thu,  1 Aug 2019 20:30:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EAB6E802
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so53094755qkl.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTpYfRVvLigzsTpFZhe+gnNm7KWgNpAV7i0lf+COz24=;
 b=e1vGv3R87O5B041G2L3oJFTlCcencxnaPGcOQqzOYAbdvoV8OPk72gQKGJSqaNSkwi
 PoVUpSg8SWgV6LVDZO5l4GyZuGYey6R33Or1yL1+E5nZ+LUiZb7netfW+QT4LMWL7XK3
 JaeUDU+OXz9dXT80+dCEsYEc/JD5L++CXPw0CxrNWu+vRJnmuRn6GJh55njoth214TZ3
 NosJvF0SsdkJFx1406ZtqjB33A8gYVTBxMJ3ZY2pSKGzdZ8rierLbEY2p8GXlKU0RYwU
 DLqq3Hdj5C9lOoJapB+rnxCT7Fh2iSXVMZElNmR9LK5hI90yAIliawoaVTF1A6Gu9/r6
 3LEw==
X-Gm-Message-State: APjAAAV8lMcZh+6IZINPr79qi0O3cNJji9YcG+AlUa9uz18FT1Qy8S73
 pVenmvBERrrX3JhcniUbbJ8bDJTr
X-Google-Smtp-Source: APXvYqziaYi7VQWHNvzMYbpV3qGig28GupZ3mq35pdt276trZ5m63QLWDT3Z9/VR7PrPXN38EJBIEQ==
X-Received: by 2002:a37:815:: with SMTP id 21mr86561522qki.257.1564691434051; 
 Thu, 01 Aug 2019 13:30:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/36] drm/amdgpu: enable DPG mode for Navi12
Date: Thu,  1 Aug 2019 15:29:53 -0500
Message-Id: <20190801202957.29791-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTpYfRVvLigzsTpFZhe+gnNm7KWgNpAV7i0lf+COz24=;
 b=adCHikcCAXJeMiGUxptHftAjHjIkMiQ0Yk6lXQ02hiOdHrmFPamhXvGfSBHqORja7b
 sZTvD8Ksk5c208TARyl82+NoxKIHiSem5xchJP4P3TiixNpF2TZBAmshGEdxc03CELmB
 z/LpjkjiCIn9m68E1tJ2urH/LvMSvP84Sx9pSwWle6os3c2+VBxU1PIL+PDR4wtQ8UBt
 m5/kqMxicIofhg3fgE8QZXje1PJrqmjF00apfULZFh0jrVkqbT3smPFD6gulndCcrMnQ
 ILxlME93T67/LO0zn2fC0FvoyF355VKM1TOLL2HU9M0xFme138OsTY7kCKdIvSSKr7jP
 IhOA==
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
 Boyuan Zhang <boyuan.zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkVuYWJsZSBEeW5hbWlj
IFBvd2VyIEdhdGluZyBWQ04gZm9yIE5hdmkxMi4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFu
ZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9q
aWUueXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9udi5jCmluZGV4IDdjMDBhYWVlZmRhOS4uODVlNzY4OGRiYWEwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L252LmMKQEAgLTYxNCw3ICs2MTQsNyBAQCBzdGF0aWMgaW50IG52X2NvbW1v
bl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMjoK
IAkJYWRldi0+Y2dfZmxhZ3MgPSAwOwotCQlhZGV2LT5wZ19mbGFncyA9IDA7CisJCWFkZXYtPnBn
X2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOX0RQRzsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lk
ID0gYWRldi0+cmV2X2lkICsgMHhhOwogCQlicmVhazsKIAlkZWZhdWx0OgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
