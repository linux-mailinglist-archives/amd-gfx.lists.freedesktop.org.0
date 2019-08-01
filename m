Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7347E427
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA196E7D6;
	Thu,  1 Aug 2019 20:30:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE976E7D6
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y26so71684078qto.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YDgyr7+sYarMZ+KZqoDxG2wO9KaN5vtZHDwJT2t4Fg=;
 b=UxJTnaiYeptwki4I5Dfsjh6KpsC9gsVH9VB5TATD88pm1FImAn0rYVPoJq0Ih+Ur2N
 Acl4OgVKqHJg7Z8F66rTZhDRMiWR2fra+za905QXUfHXOiqLBwmqPfusywosRvzUTb4B
 dhW/QAqiEMg/GlznK2YBFIdzj5qvOwehnYvN/czhnu4fx4cqGUMxZiJrxqLRlsV08Rv+
 PbFs6RZ87NIbhQH/M3tRSuJZAkoIxd0vHMzR2ucS5grwPy7iTKiimY8r61qMOdha/1gs
 jDJMnPg8wDSJC05JIGBB7eSHcckYPcjhgXrVJ09doZV0LXr+szC9OUnGWJGZ37rDHbBD
 Yjyw==
X-Gm-Message-State: APjAAAXndcxe9ZYYpmh8qy3d1r3H6/T/COsFIYHusNd4IbEdabY3xwYG
 HEQCRs5XJzQrsbhgXNPjYU2vBr5Q
X-Google-Smtp-Source: APXvYqwBfB4ejB8jb0/Pp1Ezr4LDtEFrZPn7A19mivaeBVOUQU4RbRqZ2NeAv0kgsjW8SxDaUYoHJA==
X-Received: by 2002:ac8:1887:: with SMTP id s7mr92397732qtj.220.1564691417931; 
 Thu, 01 Aug 2019 13:30:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/36] drm/amdgpu/gfx10: set rlc funcs for navi12
Date: Thu,  1 Aug 2019 15:29:35 -0500
Message-Id: <20190801202957.29791-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YDgyr7+sYarMZ+KZqoDxG2wO9KaN5vtZHDwJT2t4Fg=;
 b=ufbeWkUSHnAXG5YeNJLbF1Uv41JbYbLBWAzLpnNsQvCrenYDo/RMvEkY5dxp6lTCg2
 tieMaljYSV9rD6uAa7weFRaS1RIPCVy6SmK+R+T6C0/GNIzkNWwS3PaU66QwwOIGSHY1
 WA6bDnRxeT4bhnntlqBHxHC0YVE9+5+kLI+Vsu9AoFJsLnXaCMb0UVQEGY46lYudAlIo
 9acS1SUUSBpSNnUzG8skDOorB1Q7ZP4/whcIBMN2ozDe5+R0FxJW5pOsvVl661ABowvZ
 5UzglCRg7AVvV4Vl2gW+JXGIa/RVtuuf0pq+OrjEWXICLMJk9wHV8uscIidkqP0qGBRh
 P9BQ==
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
XzAuYwppbmRleCAzNzgxNGM1YjJmYTIuLjY1ZTcxMjUxOTkxNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTUyMDYsNiArNTIwNiw3IEBAIHN0YXRpYyB2b2lkIGdm
eF92MTBfMF9zZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN3aXRj
aCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBfTkFW
STE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWFkZXYtPmdmeC5ybGMuZnVuY3MgPSAmZ2Z4X3Yx
MF8wX3JsY19mdW5jczsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
