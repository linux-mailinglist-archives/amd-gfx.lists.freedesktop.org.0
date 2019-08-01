Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 093847E424
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE126E7C0;
	Thu,  1 Aug 2019 20:30:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD616E7BC
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r6so67433368qtt.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmgujAVeq5E9lOuLftWVPXVvwKIBN9LjzNc5ns7pt2A=;
 b=JVuDbpiFPGFnVW1E/E8lSHaKsOjcEfUWrbgwvrGBoEWIl0u+gEH1GwViA7xPogxhXr
 qsqEDMBiqHCJxIoFs/xptepK55uOhvJk60S/g9/Z5vKUFKRcGRtTnY0hBOcRD+bQLAQO
 ygLY5PrJzuREAdlCdSx7TQ1sjWM4CqMgtnAE9c9mDiBbAjpDEWVtKAK2lTGJKvulABmL
 Mv2xEmaq/N+/fARjYu3AYcy+6cUvdLHebLzflZHQmWMvwFtK1808KPfbkyYokgHJomWJ
 IAAaHgjL8+Mvm4QEqHVc5/cviDS2Ctkftex9t2CIRZVZvs3h0y7IiqpDgHTMIlIT77Il
 DZUg==
X-Gm-Message-State: APjAAAVMwxveioymbxbVKE8BTXIgzCk22BgBz9RYLtOBes8LKh/qKT/X
 IW3QgBEu7tNX6Sx/HKWsh6DbW7+T
X-Google-Smtp-Source: APXvYqyFnLHAgGx4bOsWP83pWXIlo+7okZBk1XfAUnRduQEuVEDs1uaiYin0lH4bMxlxcYuOHV2p1g==
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr94258154qvq.107.1564691415436; 
 Thu, 01 Aug 2019 13:30:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/36] drm/amdgpu/gfx10: declare cp/rlc firmwares for navi12
Date: Thu,  1 Aug 2019 15:29:32 -0500
Message-Id: <20190801202957.29791-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmgujAVeq5E9lOuLftWVPXVvwKIBN9LjzNc5ns7pt2A=;
 b=I5Y1TYdAp0Ua0VQhImzUUF/bSb5ZD84ciyoWeQ2bjkSIyfXuNhjQexMnXS4NYAv4qX
 JFABJ2eVggIkZxCHC9fM9RlkeKURj7RIjJlptfeP/kZSUfNrLPnJinXtCi0B6tNfiTw3
 iMjlpApPDjGjDNAjNZ/qtHK/0XDSOQ8rY+WnUuUCXZgbcPmDvGRIWUc8iCMEuO8bNQUK
 OLKMMvHXSrwC1xVeI1D75Jy7CZ1aiM1feFtBONF6QWDJZP4qNYVxKKVZLyXcGHmKRofa
 /r/GAbpSLUqEAlmywTIcfwaJKHflYQ7J3Na5KBxohKPtNi3+1Rjw4IsUjoJ24OAVSD5P
 OX2g==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNldCB0aGUgbmFtZSBw
cm9wZXJseSB0byBsb2FkIHRoZSByaWdodCB1Y29kZS4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUg
WXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBhNDU5ODJmNTZlMjku
Ljk5YjU3NTM3Zjg2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAg
LTczLDYgKzczLDEzIEBAIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9tZWMuYmluIik7
CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfbWVjMi5iaW4iKTsKIE1PRFVMRV9GSVJN
V0FSRSgiYW1kZ3B1L25hdmkxNF9ybGMuYmluIik7CiAKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1
L25hdmkxMl9jZS5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMl9wZnAuYmlu
Iik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTJfbWUuYmluIik7CitNT0RVTEVfRklS
TVdBUkUoImFtZGdwdS9uYXZpMTJfbWVjLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
bmF2aTEyX21lYzIuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTJfcmxjLmJp
biIpOworCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRp
bmdzX2djXzEwXzFbXSA9CiB7CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1DQl9I
V19DT05UUk9MXzQsIDB4ZmZmZmZmZmYsIDB4MDA0MDAwMTQpLApAQCAtNTQ2LDYgKzU1Myw5IEBA
IHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWNoaXBfbmFtZSA9ICJuYXZpMTQiOwogCQli
cmVhazsKKwljYXNlIENISVBfTkFWSTEyOgorCQljaGlwX25hbWUgPSAibmF2aTEyIjsKKwkJYnJl
YWs7CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
