Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F557E428
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9A16E7C8;
	Thu,  1 Aug 2019 20:30:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2688E6E7C8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k10so2524166qtq.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrK6PGFFR8c+KEVP49BkQrzaXSKVpc2aYzqO2/xH5jk=;
 b=WAvwaIxR1NjyFOWxvQ3wnixbiZvYu6YluPAlPqHGCqbeMhpsceoUz7fHBsXheAc5ds
 KqkkiusNs6Y+4cEEXN2TmVc4gUZO1nsLDhnejIBvGoZyG9b8hAxGGRgnCr7FR0nG37Ts
 YxyxFcbvmRq3Bw8AIEmUHmZdOOdjSepr8l+uiWqM79SzCsozQ6AK1iijPOrUR0e6eX7M
 /qCYKPMDTxH0IsVNuWAdsJskwl+QqT987yrlnU63MZf9AJo6jp3pQCelR43AZBYxe9Rc
 Jd0Rpp4UJmhwhV+Y8zY1Xf133EGCFA+TiVuOiZ4L31aLTmlvjWPe64cAJfkMhK+E3jCa
 E0rg==
X-Gm-Message-State: APjAAAW0/CutljceGJgE6d+n58AhD+tIUpog5Mg/ETQzWYG5k7KmyUdW
 1R5acqQZ7utbR/bhUf7uQaRfkQgB
X-Google-Smtp-Source: APXvYqz6vxwVc3u8Vj/l+Kv/MtosBTV0/3lpYcZoZb/oasVaBoyvCYKshvWVt9DDA5knITRrBLBWxA==
X-Received: by 2002:ac8:21f2:: with SMTP id 47mr92546247qtz.38.1564691419008; 
 Thu, 01 Aug 2019 13:30:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/36] drm/amdgpu/sdma5: declare sdma firmwares for navi12
Date: Thu,  1 Aug 2019 15:29:36 -0500
Message-Id: <20190801202957.29791-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrK6PGFFR8c+KEVP49BkQrzaXSKVpc2aYzqO2/xH5jk=;
 b=pOXsh4JuB/HAl9DD5u/U7bykcMuQ0vjSkzfZIt2eAzdcxtLgu1wQ6+umMzux77UkKq
 lzN4Cs7qDz3zQ1ghYuk7GadrYEQfPD8WIgCjVGnv3oEOst9R+AyqbRXPNLkcrYSh5RDY
 5vaWbj5f0rxdFK7Fkb1rLhWjE0N3sjcQQJ1SKleVUQuGvz6nbnlnAmmgjxEf4p5RMViN
 /uq9MI5Jz+bBUg8YxlBDV9sUl/m98l6L7sv3CBXf8fQJrt6ges2Bnskltc8ysc2xCdK/
 /RKelEV97C2ZSsWOa83MUmVG4QLfpiUq5Isn7hHAQxEkhmkBKj+kxIweUeYXPMRj5h+R
 X4fQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkRlY2xhcmUgdGhlIGZp
cm13YXJlcyBhbmQgbG9hZCB0aGUgcHJvcGVyIG9uZXMgZm9yIG5hdmkxMi4KClNpZ25lZC1vZmYt
Ynk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdr
aW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y1XzAuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwppbmRleCAzZTUzNjE0
MGJmZDYuLjUwNmI2MjI3MGU3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8w
LmMKQEAgLTQ1LDYgKzQ1LDkgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX3NkbWEx
LmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X3NkbWEuYmluIik7CiBNT0RV
TEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfc2RtYTEuYmluIik7CiAKK01PRFVMRV9GSVJNV0FS
RSgiYW1kZ3B1L25hdmkxMl9zZG1hLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2
aTEyX3NkbWExLmJpbiIpOworCiAjZGVmaW5lIFNETUExX1JFR19PRkZTRVQgMHg2MDAKICNkZWZp
bmUgU0RNQTBfSFlQX0RFQ19SRUdfU1RBUlQgMHg1ODgwCiAjZGVmaW5lIFNETUEwX0hZUF9ERUNf
UkVHX0VORCAweDU4OTMKQEAgLTE2NCw2ICsxNjcsOSBAQCBzdGF0aWMgaW50IHNkbWFfdjVfMF9p
bml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfTkFW
STE0OgogCQljaGlwX25hbWUgPSAibmF2aTE0IjsKIAkJYnJlYWs7CisJY2FzZSBDSElQX05BVkkx
MjoKKwkJY2hpcF9uYW1lID0gIm5hdmkxMiI7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCUJVRygp
OwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
