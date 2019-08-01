Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B17E433
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5A76E7EF;
	Thu,  1 Aug 2019 20:30:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F446E7EA
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so53153672qkj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERjBG3xN69RPWYGk+iuf9Q0Yj2wN6+HvwdlBl+egvNo=;
 b=RXHj0pbS/AP+BspLo34sFQPlobCRvT+GT/yiQAgGJqeszoqA/7h/Te0eEqM3xvXflC
 7AZbKqwlh7CbleBsaTfKG2kr7qh/WFloqsv5Y6VHqpMuPtzEC/3Wd8pEn9qmkN0h3tHI
 sTcm6/4utbYFHdvOO0GoHhk3uAULFfsBhdtlZsWSB6u2pEROuq2Qr8SeBCTQHvhiNUdN
 C1S0uS3DrCT/UCtStpydaRbJ9hWLkBaG03m+5CrYJMbJMavamFn9TISffZY2402cyGLh
 PbMN0HpYu/BVEaS1V7uclf0aYfbM4baC47ZDcb43KJ54jY3DZyuqG4zhG6Zl+LFnLN0A
 OCmA==
X-Gm-Message-State: APjAAAX/z4BT0IAxH4WCNUBQuh0wxmn6oA+X58bqLWj7Y68zRltcEoJ8
 JMnhWFhfzNX6RJJdthlB6t+/w4Rc
X-Google-Smtp-Source: APXvYqzZHd45QF+jtmIstsPDbqaJP9WQ6MwCD1hVHEueYDxw7nFFPiuuMyGuAW6pjsgPqhg5+x/dXg==
X-Received: by 2002:a37:a14a:: with SMTP id k71mr266793qke.281.1564691428676; 
 Thu, 01 Aug 2019 13:30:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 26/36] drm/amdgpu/psp11: add psp support for navi12
Date: Thu,  1 Aug 2019 15:29:47 -0500
Message-Id: <20190801202957.29791-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERjBG3xN69RPWYGk+iuf9Q0Yj2wN6+HvwdlBl+egvNo=;
 b=q1/4BRFW/bjQQd8CcF4snN1Bps4fASCwIpLj57jVdY8BGneR7nsTOYgqjpWcN3I2mP
 KSVq13Sf8M12dF/pVC1taVDFqQ9rfEYq1Tw5oK98itwZt9jbDPfuSt4lOJH3vHsRHm5H
 /J1dtqcfjiTlDHBXrXiXSiPxjwkNJPQpMIhnun0RsaQOn7hBu6W5ohDWFu9KoRKqIEpr
 Zw3Jji4ZUFLzoQ6NwvSwdhE+WqSQC5nMPdti3J+i/aEV3SMrs8qmMaXRDDW7QPGZ7Kz/
 HRTfDEslR00+COaK8x4fa2uMkK5Z8Xn/8OUP4U1eRn/HFozqgKuW8xBrtIbhQH2cPnfZ
 L2Ow==
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
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jICB8IDYgKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYwppbmRleCBkMDUyZDA4NzNlNzEuLmNiZTBhNGVlOGM4MyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpAQCAtNTgsNiArNTgsNyBAQCBzdGF0aWMgaW50IHBzcF9l
YXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMDoKIAlj
YXNlIENISVBfTkFWSTE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCXBzcF92MTFfMF9zZXRfcHNw
X2Z1bmNzKHBzcCk7CiAJCXBzcC0+YXV0b2xvYWRfc3VwcG9ydGVkID0gdHJ1ZTsKIAkJYnJlYWs7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCmluZGV4IDJlYzgyMTU1NTU2OS4u
OGM4ODhhYTQ5OWI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAt
NDMsNiArNDMsOCBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfc29zLmJpbiIpOwog
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX2FzZC5iaW4iKTsKIE1PRFVMRV9GSVJNV0FS
RSgiYW1kZ3B1L25hdmkxNF9zb3MuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZp
MTRfYXNkLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEyX3Nvcy5iaW4iKTsK
K01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMl9hc2QuYmluIik7CiAKIC8qIGFkZHJlc3Mg
YmxvY2sgKi8KICNkZWZpbmUgc21uTVAxX0ZJUk1XQVJFX0ZMQUdTCQkweDMwMTAwMjQKQEAgLTc1
LDYgKzc3LDkgQEAgc3RhdGljIGludCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBz
cF9jb250ZXh0ICpwc3ApCiAJY2FzZSBDSElQX05BVkkxNDoKIAkJY2hpcF9uYW1lID0gIm5hdmkx
NCI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTI6CisJCWNoaXBfbmFtZSA9ICJuYXZpMTIi
OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlCVUcoKTsKIAl9CkBAIC0xNjIsNiArMTY3LDcgQEAg
c3RhdGljIGludCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpw
c3ApCiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKKwlj
YXNlIENISVBfTkFWSTEyOgogCQlicmVhazsKIAlkZWZhdWx0OgogCQlCVUcoKTsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
