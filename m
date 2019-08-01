Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE67E421
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AFC6E7D4;
	Thu,  1 Aug 2019 20:30:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02DC6E7C8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:14 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w190so53094205qkc.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvM522WNT+Bf8W7ZHbZ+QNKyLE9LmjpxiyWcZ/JS5ws=;
 b=Q4yNmoORyZqb4jFPtJMupPXNj79+2Lf3pW3gc4iZEcTxgl6AXmQe237bruS3vk8FXt
 0k0o8FBtMELU4W3KNQXLqM83URMaMB86VLD9RiPg6kg8OngTDTGfJUxqwDOpO/0RfCNZ
 pGxyCQfBkGXN09qRN2M2ITV8hQPXKCC+JJ0pz+2QSqNBHUDFDmXYDJO7luQiQeaTPe6s
 u2bB69qREP/hjTJ2IoECu9K+8RUSSkk8/TnvE5BdDOnvVtZiC6XqvZvWVbbqR+OHXwS7
 54DabLMsVuqX1BRGWc6A0iqcUuXTIHQhzHPJrmaFlbZcfPry5gUmxLnUHTUo4RrtNo01
 T+oA==
X-Gm-Message-State: APjAAAXeGKqR2iZrc6KUD+k50gC/TK2Y/4iqVrJOLmTmFDVa2J/dVb2m
 2raa7WyV1Zkqd382acfQYXA5q9Fr
X-Google-Smtp-Source: APXvYqyPn29DnHr9QPjzt0NFNCjeZmhoq/12SYE+zY+syolkJmYRZeQCdmkT5FHy19cWgihJqmVPYg==
X-Received: by 2002:a37:9b92:: with SMTP id
 d140mr85429885qke.443.1564691413767; 
 Thu, 01 Aug 2019 13:30:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/36] drm/amdgpu/gfx10: set gfx cg for navi12
Date: Thu,  1 Aug 2019 15:29:30 -0500
Message-Id: <20190801202957.29791-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvM522WNT+Bf8W7ZHbZ+QNKyLE9LmjpxiyWcZ/JS5ws=;
 b=KMOMudDFMNVHO62wM81i8Xt+xDLVCSFm0UwjK9zj+YcuZecRLXH324zOmzB62c0tSF
 YabVdHiczHbpEYp4Stx5lIyQN/Wc4Geb0kQ64TtmsjU/RA/Nn3rNGxYWEUHB1yzV/s80
 5BofEtQwtYruWboVrDbn72derLUJoyOTe73901ZT6E+ZHeCeaojWIflOEQCvbQLZP68N
 QXs61s84cwiNiALayaLFKj8GOju1XSAudWTbkCZw4VYpkOp6L8EH8Yi52ElzpEL6Qz/x
 bDeQUOo51DD8iJgtj5yVfHjJRN4kaldZi86PDL/ioFdkDBRV/OjjUP7dkM7/y1u/drVs
 FI7A==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgb3RoZXIg
bmF2aSBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYwppbmRleCBiOWMwMzEyMzVjOTYuLmU2YzBmZDY3YTBmOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQxNDUsNiArNDE0NSw3IEBAIHN0YXRpYyBpbnQgZ2Z4
X3YxMF8wX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CisJ
Y2FzZSBDSElQX05BVkkxMjoKIAkJZ2Z4X3YxMF8wX3VwZGF0ZV9nZnhfY2xvY2tfZ2F0aW5nKGFk
ZXYsCiAJCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwog
CQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
