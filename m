Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD65D764
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463A893A2;
	Tue,  2 Jul 2019 20:29:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F696E05A
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so20129005qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPuMVgGSKvWFWacbmqOh+xKeb7q59vtD2FGYzYm9d5I=;
 b=Otai4TF+JmHhl7ohMxZ6fx8tuoNX1cVmjWWPXwn/X87hafu8EjpT/Rti4RxD31rVIS
 L0FyyQD78fWHMibk8yOlg0yAD57PZl7WYkXugRGWCqolaGbzKZhV22dEdpROYmk8Q6DH
 p+WujnD2zdEMoHJ6U1m6sFtgPtXfdX641ok3wEjoZICq8tN/iCY25pRH8WxmWQSSNxYn
 W0W73voBNpQUVoWd/o7Eo1Nam82/0x/sYMgLwpoSvxqodsMhcA+1WG9/NmV8tqWQlHK5
 HN7GIYLTSaxMt2gCjYxN10/xQ+otWa8gsRSDFsFAYF4Vn3mc4Uk5ZdGPwsMweDEirimU
 FtyA==
X-Gm-Message-State: APjAAAWyHdYaJAnMsWLw/NAGfVCkfuMvpGKiBbsGgeUBvGVf1vmKHLma
 IRWSO2LDKPJ8BUb68+pmHseul4cDzv0=
X-Google-Smtp-Source: APXvYqyrsM+0GFgOMg0u6HBThQ628Sn50kF+GHd2SdF79+5QYnUELV1E7lapTarvYVPGA7A9kVuxLQ==
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr28312347qvh.238.1562099353327; 
 Tue, 02 Jul 2019 13:29:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/53] drm/amdgpu/gfx10: set tcp harvest for navi14
Date: Tue,  2 Jul 2019 15:28:11 -0500
Message-Id: <20190702202844.17001-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPuMVgGSKvWFWacbmqOh+xKeb7q59vtD2FGYzYm9d5I=;
 b=aFUIAK8yuz0Z1owkvdlKrW3Gxi7IcQn/Qo7iod7MPlpAEPHW1ICXa3ELY/9sygtfRV
 1rfpM6qTWYtQVoEF80NZr2/CduMgi3qqKxg4Qagb/cyGPF+PPR82PqLM5jwJIjee6wbo
 CAdvNPdS6AkwDb+gIejbm44ZU81eDPZrmujFtQPNDblc4zVWVF42P92k8J7PKSJuapU4
 5anZqZcDn+Jg3PKSfxPtM7niilzUl/zZybJachioDmrvILAfbjXG0hyNRjY6mF6cGUeB
 VdGn6dgPF/asjgWqEKELU9J9d8pUfaRb/4KIhulWgFhzJ6TnOHuZ/7DEG+Lh6deIk1Ay
 HM0g==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClVwZGF0ZSBzZXR0aW5n
cyBmb3IgbmF2aTE0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5A
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgNCArKystCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBiNDNjMTZmYzZiMTAuLmNiNzMyYWE4ZGU2
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE0NzYsNiArMTQ3
Niw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF90Y3BfaGFydmVzdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAkvKgogCSAqIEdDUkRfVEFSR0VUU19ESVNBQkxFIGZpZWxkIGNvbnRhaW5z
CiAJICogZm9yIE5hdmkxMDogR0wxQz1bMTg6MTVdLCBTUUM9WzE0OjEwXSwgVENQPVs5OjBdCisJ
ICogZm9yIE5hdmkxNDogR0wxQz1bMjE6MThdLCBTUUM9WzE3OjEyXSwgVENQPVsxMTowXQogCSAq
LwogCXUzMiBnY3JkX3RhcmdldHNfZGlzYWJsZV9tYXNrID0gYW1kZ3B1X2dmeF9jcmVhdGVfYml0
bWFzaygKIAkJCTIgKiBtYXhfd2dwX3Blcl9zaCArIC8qIFRDUCAqLwpAQCAtMTQ4NCw2ICsxNDg1
LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3RjcF9oYXJ2ZXN0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCS8qCiAJICogVVRDTDFfVVRDTDBfSU5WUkVRX0RJU0FCTEUgZmllbGQgY29u
dGFpbnMKIAkgKiBmb3IgTmF2aTEwOiBTUUc9WzI0XSwgUk1JPVsyMzoyMF0sIFNRQz1bMTk6MTBd
LCBUQ1A9Wzk6MF0KKwkgKiBmb3IgTmF2aTE0OiBTUUc9WzI4XSwgUk1JPVsyNzoyNF0sIFNRQz1b
MjM6MTJdLCBUQ1A9WzExOjBdCiAJICovCiAJdTMyIHV0Y2xfaW52cmVxX2Rpc2FibGVfbWFzayA9
IGFtZGdwdV9nZnhfY3JlYXRlX2JpdG1hc2soCiAJCQkyICogbWF4X3dncF9wZXJfc2ggKyAvKiBU
Q1AgKi8KQEAgLTE0OTEsNyArMTQ5Myw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF90Y3BfaGFy
dmVzdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCTQgKyAvKiBSTUkgKi8KIAkJCTEp
OyAvKiBTUUcgKi8KIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTApIHsKKwlp
ZiAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEwIHx8IGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX05BVkkxNCkgewogCQltdXRleF9sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7CiAJCWZv
ciAoaSA9IDA7IGkgPCBhZGV2LT5nZnguY29uZmlnLm1heF9zaGFkZXJfZW5naW5lczsgaSsrKSB7
CiAJCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+Z2Z4LmNvbmZpZy5tYXhfc2hfcGVyX3NlOyBqKysp
IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
