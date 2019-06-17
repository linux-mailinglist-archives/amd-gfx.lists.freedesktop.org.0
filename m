Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C148F4B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828789BF3;
	Mon, 17 Jun 2019 19:31:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2F589BDB
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:32 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a27so6951650qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzoPiol4j40qYRX1j1yjSmT7/sk3ULF9njIOMZM8wA4=;
 b=F4ezGwvjulmz0AtRGv+WtPo3bSWVe/1jHdrthCxgsvGTvTOCC0Gj/flQdZHVQE/Sv9
 YUkOQRfKLf9tbKe3svKBPaO6da8GYpejNkGBP38lvhauLJ83EYwpP+jvlh+KSJ9eGZxm
 SSKJSDIGt2VovdmMoj5u18Z1siPt/mEq3rfzhbRcusSJ/G1oYBrLe13Xm1ChaXClnJwA
 PTV/KMQaIeUSs1BmJ6iIVrYqpDg7r9Quj88C6MjPCRk2lpzwCqYcloW78Teyb2xmOhD6
 mPX+0awQ2CZ4t+p6wvqg69VGUThaiLI5OSvBZWeWwGf7yRk3TiKy3rBeNYMUJk8LamsQ
 Xk0g==
X-Gm-Message-State: APjAAAX2bBzxTx4X4ff9SHnBCbIVHZg0KrtwXu/yCYFWjh8GUWzt2ZXo
 a25jDAw3zpHMjDjAl8zXqnvLpO4wA4M=
X-Google-Smtp-Source: APXvYqzrfMQUcgApTbvqPEJOYh+LvFMb4XTsg1N0CFlr6bZwP55d/tf/xSu0dyxD+oEJxva4wo++Fg==
X-Received: by 2002:a37:4c92:: with SMTP id
 z140mr15375378qka.245.1560799891610; 
 Mon, 17 Jun 2019 12:31:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 220/459] amd/powerplay: enable uclk dpm
Date: Mon, 17 Jun 2019 14:29:47 -0500
Message-Id: <20190617193106.18231-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzoPiol4j40qYRX1j1yjSmT7/sk3ULF9njIOMZM8wA4=;
 b=Nieg3kpEIwvU926CI45G+mNx+Cd7QlCDfiw9/oOkD/Pt1lKBUif+ztkkS1te3Vh1sf
 04hNzP42to8lHMXxV0u6o750AcAKn8Ba+7ZV+25wH7NahBy8Hm82HM7qc1VBJ1+C0vji
 zmTWftv6RveyJnLt/reFz3ZlbleyrpQE4HH9VuO18oSbYc5FJ7QDaJe0nq7vLF0tBMmY
 ZOOfDXtegu+zmJ0Ndzkurx37Yu4aQ0vaKAjOlAgO4LwhURWFH4RWy7C4t83kGlHXNgnP
 mcegpdWb/nG8RjVc18l9SajJrFSecWLgmghOnvhh09KA5XajHbTQpZ6bagXV/Ix8KifH
 m8pQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCkVuYWJsZSB1Y2xrIGRw
bSBvbiBuYXZpMTAgYXMgdGhlIHJlc3VsdCBvZgpyZW1vdmluZyBmYXN0IHN3aXRjaCBzZXR0aW5n
LgoKU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGQyNDAwZWNmNTY3Zi4uMGVlODM3ZGY2ZGQxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0yNzMsNyArMjcz
LDEwIEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9MRURfRElTUExBWV9CSVQpCiAJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9NTUhVQl9QR19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9BVEhVQl9QR19CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENF
RkNMS19CSVQpOworCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0RDRUZDTEtfQklUKQor
CQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKQorCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfTUVNX1ZERENJX1NDQUxJTkdfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfTUVNX01WRERfU0NBTElOR19CSVQpOwogCiAJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUg
JiBQUF9HRlhPRkZfTUFTSykKIAkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJF
X01BU0soRkVBVFVSRV9HRlhfU1NfQklUKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
