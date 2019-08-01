Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F57E42D
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2266E7E2;
	Thu,  1 Aug 2019 20:30:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8026E7E2
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y26so71684372qto.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjMMR0VWcTj/ECM4PLhta0VjqFL4PJxqMNf+hWv5JM8=;
 b=lhyZaOCXJter6xKLROw1JS7OWX5vvkKkO9V43yqa/Yu/E6HTfhMyT0+0V/aOwYgctr
 4sv3vQGeVh5ZUrVv1/dFi0msQ/7Av7vn9mjXSK2KM9B1w6JHzCSA3Au9JLUaO0rAXIyU
 rRu6xiNScuJhg362wxQr9G/13G9RBVLrG6JJQ8+k6muo9i9XUFmVIDRvHzGVe5KfdRiC
 Xqei8eTCWcOofirEh0lUAMSUBzrjgTkgCWJ1Mq6EfiJVxFn78svxdVJx2DiCXI+MWSXf
 4EuaopnsVgXzVzV8IZxU4KZikb+6uEg7EenrLrGds03xILWRExjtkY0xmBGJyv4oZ3BK
 1uDw==
X-Gm-Message-State: APjAAAWgEuv6BxcVkrcufp2/DrBoxcBShFAWp3q3M8RZTxBZnNScR4vy
 98f4sZnTqpUn70JGyH3Sr6Ty8fsO
X-Google-Smtp-Source: APXvYqyUOSUZZ1XHHd/yzUnw4MiXHH7m8vf788Pdswyz/uVnZeJYBItLK5SX0jYygOQ/ff6554L9hA==
X-Received: by 2002:ac8:32ec:: with SMTP id a41mr94004892qtb.375.1564691423216; 
 Thu, 01 Aug 2019 13:30:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/36] drm/amdgpu: enable virtual display for navi12
Date: Thu,  1 Aug 2019 15:29:41 -0500
Message-Id: <20190801202957.29791-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjMMR0VWcTj/ECM4PLhta0VjqFL4PJxqMNf+hWv5JM8=;
 b=Ku5ONXUZDpRrHK5NFYr6o0yUBCUf140aSL1E2FJ+WZLqdZu/zY+uCk3H7c02q4D2LZ
 BxvDVV/BBd68SjUoa+5D8z6wedGbdx1mxt1HEKPEgB6erNwiTQsN8CrIhriv8TJjyYpb
 Ob4cWTVYt9eUHGwncKYJYzBnxBXIWJe5dy4vxgRGwU3BcNdFRT8DJQuCQbFSGkKJ3xre
 g4KMlab8P/lF6aTRLRJXQWa/Mj79pLEVIo9u2pYWdmcaSzC7rkIzzGrR4PXWKm8aNtq6
 qUmvwVEpZXmJT+u/DV/nAIETp4HexMuTqf1IXJUOblj5C1fuo4qM6D45o8iduK1rq0c7
 KOjw==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClZpcnR1YWwgZGlzcGxh
eSBpcyBhIHN3IGRpc3BsYXkgaW50ZXJmYWNlIGZvcgpicmluZyB1cCBhbmQgdmlydHVhbGl6YXRp
b24gb3IgZm9yIGNhcmRzIHdpdGhvdXQKZGlzcGxheSBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9kY2VfdmlydHVhbC5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
ICAgICAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwppbmRleCA5YjQ1ZjZlMTJjN2MuLmM4
MWQ3YTIwNjdhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Zp
cnR1YWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jCkBA
IC00NTgsNiArNDU4LDcgQEAgc3RhdGljIGludCBkY2VfdmlydHVhbF9od19pbml0KHZvaWQgKmhh
bmRsZSkKIAljYXNlIENISVBfQVJDVFVSVVM6CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENI
SVBfTkFWSTE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCURS
TV9FUlJPUigiVmlydHVhbCBkaXNwbGF5IHVuc3VwcG9ydGVkIEFTSUMgdHlwZTogMHglWFxuIiwg
YWRldi0+YXNpY190eXBlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDdjNzQ1NDFjNGU4
Mi4uYjI5MzUyOTI0YmQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTQyNSw2ICs0MjUs
OCBAQCBpbnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm52X2NvbW1vbl9pcF9ibG9jayk7CiAJ
CWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnbWNfdjEwXzBfaXBfYmxvY2spOwog
CQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmbmF2aTEwX2loX2lwX2Jsb2NrKTsK
KwkJaWYgKGFkZXYtPmVuYWJsZV92aXJ0dWFsX2Rpc3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRjZV92aXJ0dWFsX2lw
X2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92MTBfMF9p
cF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y1XzBf
aXBfYmxvY2spOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
